//
//  NotificationView.swift
//  ZSSExtensions
//
//  Created by Ethan.L on 11/28/20.
//

import Foundation

public class NotificationView: StandardView {

    public var mainColor: UIColor = .shakdStrongPink

    private lazy var iconImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    public init(frame: CGRect = .zero, icon: UIImage = UIImage(), text: String = "Error notification", height: CGFloat = 48) {
        super.init(frame: frame)
        self.setup()
        self.configure(icon: icon, text: text, height: height)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(frame: .zero)
    }

    public func configure(icon: UIImage = UIImage(),
                          text: String = "Error notification",
                          font: UIFont = UIFont.preferredFont(forTextStyle: .title1),
                          textColor: UIColor = .white,
                          height: CGFloat = 48) {
        self.isHidden = true
        
        self.iconImgView.image = icon
        self.titleLabel.text = text
        self.titleLabel.font = font
        self.titleLabel.textColor = textColor
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    func setup () {
        translatesAutoresizingMaskIntoConstraints = false

        layer.cornerRadius = 6
        layer.backgroundColor = self.mainColor.cgColor
        layer.applySketchShadow(color: .shakdDarkBlueGrey, alpha: 0.06, x: 0, y: 16, blur: 16, spread: 0)

        self.addSubview(titleLabel)
        self.addSubview(iconImgView)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapClose))
        self.iconImgView.addGestureRecognizer(tapGesture)

        Constraint.activate(
            Constraint.pin(iconImgView, to: self, top: 12, bottom: -12, left: 12),
            Constraint.pin(titleLabel, to: self, top: 0, bottom: 0, left: 0, right: 0),
            Constraint.size(iconImgView, height: 24.0, width: 24.0)
        )
    }

    @objc func onTapClose() {
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = 0.0
            self.isHidden = true
        })
    }

}
