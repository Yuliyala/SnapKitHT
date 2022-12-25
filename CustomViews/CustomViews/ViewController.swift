//
//  ViewController.swift
//  CustomViews
//
//  Created by Yuliya Lapenak on 12/25/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let button: StateButton = {
        let button = StateButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.style = .secondary
        button.setTitle("Cancel", for: .normal)
        return button
    }()
    
    let button2: StateButton = {
        let button = StateButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.style = .primary
        button.setTitle("Sign in", for: .normal)
        return button
    }()
    
    var nameTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Name"
        return  textField
    }()
    
    var surnameTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Surname"
        return  textField
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }

    func setup() {
        view.addSubview(button)
        view.addSubview(button2)
        view.addSubview(nameTextField)
        view.addSubview(surnameTextField)
        
        
        button.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(32)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(250)
            $0.height.equalTo(64)
        }
        
        button2.snp.makeConstraints {
            $0.bottom.equalTo(button.snp.top).inset(-32)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(250)
            $0.height.equalTo(64)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(45)
        }
        
        surnameTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(45)
        }
    }

}


