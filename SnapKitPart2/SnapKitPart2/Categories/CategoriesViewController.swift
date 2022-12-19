//
//  ViewController.swift
//  SnapKitPart2
//
//  Created by Yuliya Lapenak on 12/14/22.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var dataSourсe = ["Юмор", "Еда", "Кино", "Рестораны", "Прогулки", "Политика", "Новости",  "Автомобили", "Сериалы", "Рецепты", "Работа", "Отдых", "Спорт", "Спорт", "Политика", "Новости", "Юмор", "Еда", "Кино", "Рестораны", "Прогулки", "Политика", "Новости", "Юмор", "Еда", "Кино"].map { Category(title: $0)}
    
    override func loadView() {
        super.loadView()
        view = CategoriesView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    func setupTable() {
        guard let view = view as? CategoriesView else { return } // выполняем приведение к типу
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
    }
}

extension CategoriesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dataSourсe[indexPath.row].isSelected.toggle()
        collectionView.reloadItems(at: [indexPath])
    }
    
}

extension CategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSourсe.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else {
            return  UICollectionViewCell()
        }
        cell.set(dataSourсe[indexPath.row])
        return cell
    }
}

extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: dataSourсe[indexPath.row].title.size(withAttributes: [.font: UIFont.systemFont(ofSize: 18, weight: .semibold)]).width + 90, height: 40)}
}
