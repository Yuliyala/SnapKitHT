//
//  CustomTextField.swift
//  CustomViews
//
//  Created by Yuliya Lapenak on 12/25/22.
//

import UIKit

class CustomTextField: UITextField {
    
    
 
    init() {
    super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundColor =  .white
        layer.masksToBounds = true
        layer.borderColor = UIColor.orange.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 8
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        leftViewMode = .always
    }
    
}
