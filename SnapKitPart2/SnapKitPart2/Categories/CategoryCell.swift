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
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
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
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = .darkGray
        contentView.layer.cornerRadius = 12
        setConstrains()
    }
    
    func setConstrains() {
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
        }
        
    }
}
 
