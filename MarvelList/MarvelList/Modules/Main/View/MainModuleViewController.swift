//
//  MainModuleViewController.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.

import UIKit
import SVProgressHUD


class MainModuleViewController: UIViewController {

	var presenterModule: MainModulePresenterProtocol?
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var itemsCollection: UICollectionView!
    
    var items: [MainModuleModel]?
    
	override func viewDidLoad() {
        super.viewDidLoad()
        customizeUI()
        getData()
    }
    
    private func customizeUI() {
        itemsCollection.register(UINib(nibName: "MainCollectionViewCell", bundle: .main),
                                forCellWithReuseIdentifier: "MainCollectionViewCell")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func getData() {
        SVProgressHUD.show()
        presenterModule?.getListData()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}

extension MainModuleViewController: MainModuleViewProtocol  {
    
    func setItems(data: [MainModuleModel]) {
        items = data
        itemsCollection.reloadData()
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
}

extension MainModuleViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if items != nil {
            return items?.count ?? 0
        }
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell  {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCollectionViewCell
        if let item = items?[indexPath.row] {
            cell?.setup(data: item)
            cell?.callbackClick = { product in
                guard let id = product.id else { return }
                self.presenterModule?.goToDetailView(id: id)
            }
            return cell!
        }
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.size.width)/2 - 35, height: 200)
    }
    
    
}

