//
//  ViewController.swift
//  CustomViews
//
//  Created by Yuliya Lapenak on 12/25/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Hello"
        return label
    }()
    
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
    
    let leftIconButton: LeftIconButton = {
        let button = LeftIconButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.text = "Search..."
        button.image = UIImage(systemName: "heart")
        button.imageTint = .orange
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
        setupLabelText()
    }
    
    func setup() {
        view.backgroundColor = .white
      
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(button)
        contentView.addSubview(button2)
        contentView.addSubview(leftIconButton)
        contentView.addSubview(nameTextField)
        contentView.addSubview(surnameTextField)
        contentView.addSubview(label)
        // добавляем скролл вью  и делаем контстрейнты равные супервью
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        //на скрол вью добавляем контент вью оно равно размерам скролвью, но так же задаем ему ширину равны/ ширине экрана для того, чтобы скол вью не растянулся в ширину
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
            $0.width.equalTo(view.snp.width)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(26)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(45)
        }
        
        surnameTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(45)
        }
        
        label.snp.makeConstraints {
            $0.top.equalTo(surnameTextField.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        leftIconButton.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(250)
            $0.height.equalTo(64)
        }
        
        button2.snp.makeConstraints {
            $0.top.equalTo(leftIconButton.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(250)
            $0.height.equalTo(64)
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(button2.snp.bottom).offset(32)
            $0.bottom.equalToSuperview().inset(-10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(250)
            $0.height.equalTo(64)
        }

    }
    
    func setupLabelText() {
        //Строка с атрибутами(шрифт, цвет и т.д.)
        let attributedString =  NSMutableAttributedString()
        let headerString = NSAttributedString(
            string: "It's a Header\n",
            attributes: [.font : UIFont.systemFont(ofSize: 22, weight: .bold)]
        )
        attributedString.append(headerString)
        
        let subtitle = NSAttributedString(
            string: "It's a subtitle\n",
            attributes: [.font : UIFont.systemFont(ofSize: 18, weight: .semibold),
                         .foregroundColor: UIColor.gray]
        )
        attributedString.append(subtitle)
        label.attributedText = attributedString
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        paragraphStyle.lineSpacing = 5
        
        let body = NSAttributedString(
            string: "It's a body Чтобы проще читалось, я упоминаю здесь только классы, однако всё сказанное в статье применимо также к функциям, методам и модулям, так что имейте это в виду.Принцип служит для того, чтобы делать поведение класса более разнообразным, не вмешиваясь в текущие операции, которые он выполняет. Благодаря этому вы избегаете ошибок в тех фрагментах кода, где задействован этот класс.It's a body Чтобы проще читалось, я упоминаю здесь только классы, однако всё сказанное в статье применимо также к функциям, методам и модулям, так что имейте это в виду.Принцип служит для того, чтобы делать поведение класса более разнообразным, не вмешиваясь в текущие операции, которые он выполняет. Благодаря этому вы избегаете ошибок в тех фрагментах кода, где задействован этот класс.It's a body Чтобы проще читалось, я упоминаю здесь только классы, однако всё сказанное в статье применимо также к функциям, методам и модулям, так что имейте это в виду.Принцип служит для того, чтобы делать поведение класса более разнообразным, не вмешиваясь в текущие операции, которые он выполняет. Благодаря этому вы избегаете ошибок в тех фрагментах кода, где задействован этот класс.",
           
            attributes: [.font : UIFont.systemFont(ofSize: 12, weight: .light),
                         .foregroundColor: UIColor.black,
                         .paragraphStyle: paragraphStyle]
        )
        attributedString.append(body)
        label.attributedText = attributedString
    }
}


