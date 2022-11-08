//
//  Form.swift
//  ZSSExtensions
//
//  Created by Ethan.L on 11/21/20.
//

import UIKit

public typealias FormFieldValidation = (Any?) -> String?

public struct FormField {
    /// The name for the element of form e.g. email, password, first name, etc
    public let name: String

    /// The validation rules and regex
    public let validations: [FormFieldValidation]

    /// The input UI controls, e.g. TextField
    public var input: FormFieldInput

    /// The initial value (placeholder) of input controls
    public let initialValue: Any?

    /// The optional field which specify the element is required to complete the form
    public let isRequired: Bool

    public init(name: String, validations: [FormFieldValidation], input: FormFieldInput, initialValue: Any?, isRequired: Bool = true) {
        self.name = name
        self.validations = validations
        self.input = input
        self.initialValue = initialValue
        self.isRequired = isRequired
    }
}

public protocol FormFieldInput {
    /// The initial value, placeholder of input control, UITextField
    var formFieldInputValue: Any? { get }

    /// The delegate method to define action when TextField clear event is triggered
    func formFieldInputClearValue()

    /// The validation error handler delegate method
    func formFieldInputSetError(_ error: String?)

    /// The TextField value set delegate method
    func formFieldInputSetValue(_ value: Any?)

    /// The delegate method for textFieldDidEndEditing event
    var formFieldInputValueDidChange: (() -> Void)? { get set }
}

public protocol FormButton {
    /// The UIButton rendering method
    func formButtonSetLoading(_ loading: Bool)

    /// The UIButton's setting Enabled/Disabled status rendering method
    func formButtonSetEnabled(_ enabled: Bool)
}

extension UIAlertController {
    /// Presenting alert message
    class func present(from viewController: UIViewController, title: String?, body: String?) {
        let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        DispatchQueue.main.async {
            viewController.present(alert, animated: true)
        }
    }
}

/// Note: This class is designed to
/// make reusable component which provides validation form with input controls,
/// success handlers and error handlers

public class Form {
    /// Display error message presenting UIAlertController
    class func displayErrorMessage(_ error: Error?, viewController: UIViewController) {
        if let error = error {
            if let error = error as? Form.ResponseError {
                if let (title, body) = error.global {
                    UIAlertController.present(from: viewController, title: title, body: body)
                }
            }
        }
    }

    struct ResponseError : Error {
        let global: (title: String, body: String)?
        let field: [String: String]?
    }

    /// The input elements in the form
    public var fields: [FormField]

    /// The action button recognizer for input contents
    public let button: LoginButton

    /// The action button performing block
    public var onSubmit: OnSubmit

    /// The floating view controller
    public weak var viewController: UIViewController?

    public var isLoading = false
    public typealias OnSubmit = ([String: Any], @escaping (Error?) -> Void) -> Void

    public init(fields: [FormField], button: LoginButton, viewController: UIViewController? = nil, onSubmit: @escaping OnSubmit) {
        self.fields = fields
        self.button = button
        self.onSubmit = onSubmit
        self.viewController = viewController
        self.button.addTarget(self, action: #selector(onTouchUpInsideButton), for: .touchUpInside)
        for var field in fields {
            field.input.formFieldInputValueDidChange = {[weak self] in
                self?.checkIfFormCanBeSubmitted()
                let value = field.input.formFieldInputValue
                for validation in field.validations {
                    if let error = validation(value) {
                        field.input.formFieldInputSetError(error)
                        break
                    }
                }
            }
        }
        checkIfFormCanBeSubmitted()
    }

    @objc func onTouchUpInsideButton(_ sender: UIButton) {
        // Checking the validation results for all elements in the form
        var hasFieldError = false
        for field in fields {
            field.input.formFieldInputSetError(nil)
            let value = field.input.formFieldInputValue
            for validation in field.validations {
                if let error = validation(value) {
                    field.input.formFieldInputSetError(error)
                    hasFieldError = true
                    break
                }
            }
        }

        // Load the button setting status depending on validation result
        guard !hasFieldError else { return }
        button.formButtonSetLoading(true)

        // Set data from each element of the form for form submission
        var data = [String:Any]()
        for field in fields {
            if let value = field.input.formFieldInputValue {
                data[field.name] = value
            }
        }

        // Submit action
        onSubmit(data, {error in
            DispatchQueue.main.async {[weak self] in
                self?.displayError(error)
            }
        })
    }

    func displayError(_ error: Error?) {
        self.button.formButtonSetLoading(false)
        self.checkIfFormCanBeSubmitted()

        guard let error = error else {
            return
        }

        // Handle response error
        if let error = error as? ResponseError {
            if let (title, body) = error.global {
                if let viewController = self.viewController {
                    UIAlertController.present(from: viewController, title: title, body: body)
                }
                return
            }

            if let errors = error.field {
                for (name, error) in errors {
                    for field in self.fields {
                        if field.name == name {
                            field.input.formFieldInputSetError(error)
                        }
                    }
                }
                return
            }
        }

        // Handle exceptional / unknown error
        if let viewController = self.viewController {
            var title = "An Error Occured"
            var body = "Please try again later."

            UIAlertController.present(from: viewController, title: title, body: body)
        }
        return
    }

    func checkIfFormCanBeSubmitted() {
        for field in fields {
            field.input.formFieldInputSetError(nil)
            let value = field.input.formFieldInputValue
            for validation in field.validations {
                if validation(value) != nil {
                    button.formButtonSetEnabled(false)
                    return
                }
            }
        }
        button.formButtonSetEnabled(true)
        return
    }
}
