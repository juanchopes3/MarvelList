//
//  DetailModuleViewController.swift
//  MarvelList
//
//  Created by Juan  Martinez on 21/06/22.

import UIKit
import Kingfisher


class DetailModuleViewController: UIViewController {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var presenterModule: DetailModulePresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        presenterModule?.getDetail()
    }
    
    @IBAction func tapBack(_ sender: Any) {
        presenterModule?.goToBack()
    }
    
}

extension DetailModuleViewController: DetailModuleViewProtocol  {
    func setDetail(data: MainModuleModel) {
        guard let url = (data.thumbnail?.url) else { return }
        let urlImage : URL = URL(string: url)!
        itemImage.kf.setImage(with: urlImage)
        titleLabel.text = data.name
        descriptionLabel.text = data.description
        
    }
    
    
}

extension DetailModuleViewController {
    
}

