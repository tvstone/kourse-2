//
//  FullSizeCollectionViewCell.swift
//  MyVKclient
//
//  Created by Владислав Тихоненков on 16.07.2021.
//

import UIKit

class FullSizeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backViewFullScrin: UIView!
    @IBOutlet weak var imageFullScreen: UIImageView!
    @IBOutlet weak var backViewCell: UIView!
    
    func setupCell(){

    }
   
    func clearCell() {
        imageFullScreen.image = nil
      
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
    func config (image: UIImage){

        imageFullScreen.image = image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setupCell()
       clearCell()
    }

    
}

