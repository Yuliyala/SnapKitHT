//
//  ViewController.swift
//  SnapKitPart2
//
//  Created by Yuliya Lapenak on 12/14/22.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var dataSourсe = ["Юмор", "Еда", "Кино", "Рестораны", "Прогулки", "Политика", "Новости",  "Автомобили", "Сериалы", "Рецепты", "Работа", "Отдых", "Спорт", "Спорт", "Политика", "Новости", "Юмор", "Еда", "Кино", "Рестораны", "Прогулки", "Политика"].map { Category(title: $0)}
    //Переменная для получения приведенной  view, чтоб не делать приведение каждый раз
    var rootView: CategoriesView {
        view as! CategoriesView //выполняем приведение типа
    }
    
    override func loadView() {
        super.loadView()
        view = CategoriesView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    func setupTable() {
        
        rootView.collectionView.delegate = self
        rootView.collectionView.dataSource = self
    }
    
    func showHideButton() {
        //прятание кнопки через isHidden
//        rootView.continueButton.isHidden = !dataSourсe.contains{ $0.isSelected}
        
        rootView.showButton(isVisible: dataSourсe.contains{ $0.isSelected})
    }
}

extension CategoriesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dataSourсe[indexPath.row].isSelected.toggle()
        collectionView.reloadItems(at: [indexPath])
        showHideButton()
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
        return CGSize(width: dataSourсe[indexPath.row].title.size(withAttributes: [.font: UIFont.systemFont(ofSize: 18, weight: .semibold)]).width + 76, height: 40)}
}
