//
//  CategoryCell.swift
//  SnapKitPart2
//
//  Created by Yuliya Lapenak on 12/14/22.
//

import UIKit
import SnapKit


class CategoryCell: UICollectionViewCell {
    
    static let identifier = "CategoryCell"
    
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
//        stackView.spacing = 12
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let viewOnCell: UIView = {
      let view = UIView()
        view.backgroundColor = .gray
        return view
    } ()
    
    let iconImageView: UIImageView = {
      let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ model: Category) {
        titleLabel.text = model.title
        contentView.backgroundColor = model.isSelected ? .orange : .darkGray
    }
    
    func setup() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(viewOnCell)
        stackView.addArrangedSubview(iconImageView)
        stackView.setCustomSpacing(16, after: titleLabel)
        stackView.setCustomSpacing(16, after: viewOnCell)
        
        
        contentView.backgroundColor = .darkGray
        contentView.layer.cornerRadius = 12
        setConstrains()
    }
    
    func setConstrains() {
        
        stackView.snp.makeConstraints {
            $0.top.trailing.bottom.leading.equalToSuperview().inset(10)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
        }
        
        viewOnCell.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.width.equalTo(1)
//            $0.centerY.equalToSuperview()
//            $0.leading.equalTo(titleLabel.snp.trailing).inset(5)
        }
        
        iconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(stackView.snp.leading).inset(10)
            $0.height.width.equalTo(24)
        }
    }
}
 
