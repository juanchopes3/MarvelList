//
//  MainCollectionViewCell.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.
//

import UIKit
import Kingfisher

class MainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    var item : MainModuleModel?
    var callbackClick: ((MainModuleModel) -> ())?
    
    func setup(data: MainModuleModel) {
        self.item = data
        
        guard let url = (item?.thumbnail?.url) else { return }
        let urlImage : URL = URL(string: url)!
        itemImage.kf.setImage(with: urlImage)
        labelName.text = item?.name
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.addGestureRecognizer(tap)

    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        callbackClick!(self.item!)
    }

}
