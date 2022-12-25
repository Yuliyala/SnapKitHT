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
    
    var textField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Name"
        return  textField
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }

    func setup() {
        view.addSubview(button)
        view.addSubview(button2)
        
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
    }

}


