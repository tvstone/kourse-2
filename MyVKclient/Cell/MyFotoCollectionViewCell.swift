//
//  MyFotoCollectionViewCell.swift
//  MyVKclient
//
//  Created by Владислав Тихоненков on 04.08.2021.
//

import UIKit

class MyFotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var fotoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fotoView.image = nil
        // Initialization code
    }

}
