//
//  DefaultTextfield.swift
//  SplitTasks
//
//  Created by Abdulazim on 03/08/21.
//

import Foundation

import UIKit

@IBDesignable
class DefaultTextfield: UIView {
    
    var topLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textColor = .gray
        return lbl
    }()
    
    var textField: UITextField = {
        let txtField = UITextField()
        txtField.layer.borderWidth = 1
        txtField.layer.masksToBounds = true
        txtField.layer.cornerRadius = 5
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 0))
        txtField.leftView = paddingView
        txtField.leftViewMode = .always
        return txtField
    }()
    
    
    override public init(frame: CGRect) {
        let _frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: 60)
        super.init(frame: _frame)
        setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        self.addSubview(topLabel)
        self.addSubview(textField)
        textField.font = UIFont.systemFont(ofSize: 16)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.textColor = UIColor.gray
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 6),
            topLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -6),
            topLabel.topAnchor.constraint(equalTo: self.topAnchor),
            topLabel.heightAnchor.constraint(equalToConstant: 20),
            textField.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10),
            textField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 1),
            textField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
