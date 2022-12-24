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
        stackView.spacing = 12
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let separator: UIView = {
      let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    } ()
    
    var iconImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageName = "plus"
        let image = UIImage(named: imageName)
        imageView = UIImageView(image: image!)
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
        separator.alpha = model.isSelected ? 0 : 1
        iconImageView.image = UIImage(named: model.isSelected ? "checkmark" : "plus")
    }
    
    func setup() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(separator)
        stackView.addArrangedSubview(iconImageView)
        stackView.setCustomSpacing(16, after: titleLabel)
        stackView.setCustomSpacing(16, after: separator)
        
        
        contentView.backgroundColor = .darkGray
        contentView.layer.cornerRadius = 12
        setConstrains()
    }
    
    func setConstrains() {
        
        stackView.snp.makeConstraints {
            $0.top.trailing.bottom.leading.equalToSuperview().inset(10)
        }
        
        separator.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.width.equalTo(1)
        }
        
        iconImageView.snp.makeConstraints {
            $0.size.equalTo(18)
        }
    }
}
 
