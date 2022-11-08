//
//  FormValidation.swift
//  ZSSExtensions
//
//  Created by Ethan.L on 11/21/20.
//  Copyright © 2016 Zachary Shakked. All rights reserved.
//

import Foundation

public struct FormValidation {

    static public func isRequiredString (_ value: Any?) -> String? {
        if let string = value as? String {
            if string == "" {
                return "This field is required."
            }
        }
        return nil
    }

    static public func isProbablyAnEmail (_ value: Any?) -> String? {
        if let string = value as? String, string != "" {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            if !emailTest.evaluate(with: string) {
                return "Invalid email"
            }
        }
        return nil
    }

    static public func isProbablyAnGmail (_ value: Any?) -> String? {
        if let string = value as? String, string != "" {
            let emailRegEx = "^[a-zA-Z][-_.a-zA-Z0-9]{5,29}@g(oogle)?mail.com$"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            if !emailTest.evaluate(with: string) {
                return "Invalid email"
            }
        }
        return nil
    }

    static public func isProbablyAName (_ value: Any?) -> String? {
        if let string = value as? String, string != "" {
            let nameRegEx =  "/^[a-zA-Z '.-]*$/"
            let nameTest = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
            if !nameTest.evaluate(with: string) {
                return "Invalid name"
            }
        }
        return nil
    }

    static public func isValidPassowrd (_ value: Any?) -> String? {
        /** password validation regex
         Minimum 8 characters at least 1 Alphabet and 1 Number:
         "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"

         Minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character:
         "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"

         Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet and 1 Number:
         "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"

         Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character:
         "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"

         Minimum 8 and Maximum 10 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character:
         "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,10}"
        */

        if let string = value as? String, string != "" {
            /// Minimum 8 characters at least 1 Alphabet and 1 Number
            let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
            let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
            if !passwordTest.evaluate(with: string) {
                return "Invalid password"
            }
        }
        return nil
    }

    static func minimumLength (length: Int) -> FormFieldValidation {
        return { value in
            if let string = value as? String,
                string.count < length {
                return "\(length) character minimum"
            }
            return nil
        }
    }
}
