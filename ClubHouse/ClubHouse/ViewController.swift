//
//  ViewController.swift
//  ClubHouse
//
//  Created by Yuliya Lapenak on 12/14/22.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    // напишем функцию которая  будет настраивать наш интерфейс
    
    private func initialize() {
        //настроим задний фон
        view.backgroundColor = UIColor(displayP3Red: 241/255, green: 238/255, blue: 228/255, alpha: 1)
        
        let label = UILabel()
        label.text = "🎉 Welcome!"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(50)
            $0.top.equalToSuperview().inset(150)
        }
        
        let extraLabel = UILabel()
        extraLabel.text = "Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label Extra label"
        extraLabel.numberOfLines = 0
        view.addSubview(extraLabel)
        
        extraLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(50)
            $0.top.equalTo(label).inset(100)
        }
        
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(displayP3Red: 84/255, green: 118/255, blue: 171/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Get your username ->", for: .normal)
        view.addSubview(button)
        button.layer.cornerRadius = 20
        
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(250)
            $0.bottom.equalToSuperview().inset(150)
            $0.height.equalTo(40)
        }
        button.addTarget(self, action: #selector(buttonType), for: .touchUpInside)
    }
    
    @objc private func buttonType() {
        print("We want to get a username")
    }
}

