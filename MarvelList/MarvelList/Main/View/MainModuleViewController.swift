//
//  MainModuleViewController.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.

import UIKit


class MainModuleViewController: UIViewController {

	var presenterModule: MainModulePresenterProtocol?
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var itemsCollection: UICollectionView!
    
	override func viewDidLoad() {
        super.viewDidLoad()
        customizeUI()
        
    }
    
    private func customizeUI() {
        itemsCollection.register(UINib(nibName: "MainCollectionViewCell", bundle: .main),
                                forCellWithReuseIdentifier: "MainCollectionViewCell")
    }

}

extension MainModuleViewController: MainModuleViewProtocol  {
    
}

extension MainModuleViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCollectionViewCell

        return cell!
    }
    
    
}

