//
//  LeftIconButton.swift
//  CustomViews
//
//  Created by Yuliya Lapenak on 12/28/22.
//

import UIKit

class LeftIconButton: UIButton {
   
    var text: String = "" {
        didSet {
            label.text = text
        }
    }
    
    var image: UIImage? {
        didSet {
            leftImageView.image = image
        }
    }
    
    var imageTint: UIColor = .black {
        didSet {
            leftImageView.tintColor = imageTint
            layer.borderColor = imageTint.cgColor
        }
    }
    
    let leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        addSubview(leftImageView)
        addSubview(label)
        setConstraints()
        
        layer.masksToBounds = true
        layer.cornerRadius = 12
        backgroundColor = .white
        layer.borderWidth = 1.2
        layer.borderColor = UIColor.gray.cgColor
    }
    
    func setConstraints() {
        
        leftImageView.snp.makeConstraints {
            $0.size.equalTo(30)
            $0.leading.equalToSuperview().offset(12)
            $0.centerY.equalToSuperview()
        }
        
        label.snp.makeConstraints {
            $0.leading.equalTo(leftImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
        }
    }
}
