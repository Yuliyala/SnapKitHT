//
//  ViewController.swift
//  SnapKitHomeWork
//
//  Created by Yuliya Lapenak on 12/10/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(cgColor: CGColor(gray: 200/255  , alpha: 0.5))
        return view
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        return stackView
    } ()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name"
        return textField
    }()
    
    let surnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter surname"
        return textField
    }()
    
    let genderTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter surname"
        return textField
    }()
    
    let dateOFBirthTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter date of birth"
        return textField
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = " Name:"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let surnameLabel: UILabel = {
        let label = UILabel()
        label.text = " Surname:"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.text = " Gender:"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let dateOFBirthLabel: UILabel = {
        let label = UILabel()
        label.text = " Date of birth:"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let termsLabel: UILabel = {
        let label = UILabel()
        label.text = " I agree with Terms & Conditions"
        label.font = .systemFont(ofSize: 15, weight: .light)
        return label
    } ()
    
    let agreeSwitch = UISwitch()
    
    let button:  UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .darkGray
        button.setTitle("SAVE", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    let genders = ["Male", "Female"]
    
    var pickerView = UIPickerView()
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupSwitch()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        createToolBar()
        createDatePicker()
        
        genderTextField.inputView = pickerView
    }
    
    func setupViews() {
        view.addSubview(mainView)
        mainView.addSubview(button)
        mainView.addSubview(stackView)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(surnameLabel)
        stackView.addArrangedSubview(surnameTextField)
        stackView.addArrangedSubview(genderLabel)
        stackView.addArrangedSubview(genderTextField)
        stackView.addArrangedSubview(dateOFBirthLabel)
        stackView.addArrangedSubview(dateOFBirthTextField)
        stackView.addArrangedSubview(agreeSwitch)
        stackView.addArrangedSubview(termsLabel)
        stackView.setCustomSpacing(8, after: nameLabel)
        stackView.setCustomSpacing(16, after: nameTextField)
        stackView.setCustomSpacing(8, after: surnameLabel)
        stackView.setCustomSpacing(16, after: surnameTextField)
        stackView.setCustomSpacing(8, after: genderLabel)
        stackView.setCustomSpacing(16, after: genderTextField)
        stackView.setCustomSpacing(8, after: dateOFBirthLabel)
        stackView.setCustomSpacing(30, after: dateOFBirthTextField)
        stackView.setCustomSpacing(6, after: agreeSwitch)
        mainView.snp.makeConstraints {
            $0.leading.bottom.trailing.top.equalToSuperview()
        }
        
        button.addTarget(self, action: #selector(saveButtonPressed), for: .primaryActionTriggered)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(screenTapped)))
        
        button.snp.makeConstraints {
            $0.height.equalTo(60)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(mainView.safeAreaLayoutGuide).offset(-30)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        makeConctraintsTextField(textField: nameTextField)
        makeConctraintsTextField(textField: surnameTextField)
        makeConctraintsTextField(textField: dateOFBirthTextField)
        makeConctraintsTextField(textField: genderTextField)
        
        setupTextField(textField: nameTextField)
        setupTextField(textField: surnameTextField)
        setupTextField(textField: genderTextField)
        setupTextField(textField: dateOFBirthTextField)
    }
    
    func makeConctraintsTextField(textField: UITextField) {
        textField.snp.makeConstraints{
            $0.height.equalTo(50)
        }
    }
    
    func setupTextField(textField: UITextField) {
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.backgroundColor = .white
        textField.leftViewMode = .always
    }
    
    func setupSwitch() {
        agreeSwitch.onTintColor = .darkGray
        agreeSwitch.thumbTintColor = .white
    }
    
    func presentAlert(title: String, message: String, preferredStyle: UIAlertController.Style ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let action = UIAlertAction(title: "OK", style: .default) { action in
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func saveButtonPressed() {
        var name: String = ""
        var surname: String = ""
        
        if let nameString = nameTextField.text, !nameString.isEmpty ,
           let surnameString  = surnameTextField.text, !surnameString.isEmpty {
            name = nameString
            surname = surnameString
            presentAlert( title: "Success", message: "Name - \(name), Surname - \(surname)", preferredStyle: .alert )
        }
    }
    
    @objc func screenTapped() {
        view.endEditing(true)
    }
    
    @objc func switchOn() {
        if agreeSwitch.isOn {
            button.isEnabled = true
            button.alpha = 1
        } else {
            button.isEnabled = false
            button.alpha = 0.1
        }
    }
    
    func createToolBar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }
    
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        dateOFBirthTextField.inputView = datePicker
        dateOFBirthTextField.inputAccessoryView = createToolBar()
    }
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        self.dateOFBirthTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTextField.text = genders[row]
        genderTextField.resignFirstResponder()
    }
    
}

