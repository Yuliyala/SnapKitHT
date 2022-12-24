//
//  CategoriesView.swift
//  SnapKitPart2
//
//  Created by Yuliya Lapenak on 12/14/22.
//

import UIKit
import SnapKit

class CategoriesView: UIView {
    
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 2
        label.text = "Отметьте то, что вам интересно, чтобы настроить Дзен"
        label.textColor = .gray
        return label
    }()
    
    let laterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.setTitle("Позже", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        return button
    }()
    
    let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 12
        return stackView
    }()
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: LeftAlignedCollectionViewFlowLayout())
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    var continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("Продолжить", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        button.layer.cornerRadius = 40
//        button.isHidden = true
        button.alpha = 0
        button.isEnabled = false
        return button
    } ()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundColor = .black
        addSubview(headerStackView)
        addSubview(collectionView)
        addSubview(continueButton)
        headerStackView.addArrangedSubview(descriptionLabel)
        headerStackView.addArrangedSubview(laterButton)
        setConstraints()
    }
    
    func showButton(isVisible: Bool) {
        // проверяем надо ли делать анимацию
        if continueButton.isEnabled == isVisible { return }
        continueButton.isEnabled = isVisible
        // Делаем анимацию
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear) {
            self.continueButton.alpha = isVisible ? 1 : 0
        }
    }
    
    func setConstraints() {
        laterButton.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(90)
        }
        
        headerStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(32)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(headerStackView.snp.bottom).offset(24)
            $0.trailing.leading.equalToSuperview().inset(16)
            $0.bottom.equalTo(continueButton.snp.top).inset(-24)
        }
        
        continueButton.snp.makeConstraints {
            $0.height.equalTo(90)
            $0.width.equalTo(280)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-40)
        }
    }
}

class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)

        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }

            layoutAttribute.frame.origin.x = leftMargin

            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY , maxY)
        }

        return attributes
    }
}
