//
//  UniversalTableViewCell.swift
//  MyVKclient
//
//  Created by Владислав Тихоненков on 27.06.2021.
//

import UIKit

@IBDesignable
class UniversalTableViewCell: UITableViewCell {

    
    @IBOutlet weak var universalImage: UIImageView!
    @IBOutlet weak var backview: UIView!
    @IBOutlet weak var universalTitleLabel: UILabel!
    
    @IBInspectable var cornerRadius : CGFloat = 25 

    @IBInspectable var shadowOffset :CGSize = CGSize(width: 5, height: 5)
    @IBInspectable var shadowColor : UIColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
    @IBInspectable var shadowRadius :CGFloat = 5
    @IBInspectable var shadowOpacity :Float = 0.5
    
    var saveObject : Any?
 
    func setupCell(){
        
        backview.layer.cornerRadius = cornerRadius
        universalImage.layer.cornerRadius = cornerRadius
        
        backview.layer.shadowColor = shadowColor.cgColor
        backview.layer.shadowOffset = shadowOffset
        backview.layer.shadowRadius = shadowRadius
        backview.layer.shadowOpacity = shadowOpacity
        
    }
    func clearCell(){
        self.universalImage.image = nil
        self.universalTitleLabel.text = nil
        self.saveObject = nil
        
    }
    
    func animateAvatar() {
        
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 100
        animation.mass = 1
        animation.duration = 1
        animation.beginTime = CACurrentMediaTime()
        animation.fillMode = CAMediaTimingFillMode.backwards
        universalImage.layer.add(animation, forKey: nil)
        backview.layer.add(animation, forKey: nil)

        
    }
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clearCell()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
        clearCell()
      
    }

    func configureCell (title : String?, image : UIImage?) {
        universalTitleLabel.text = title
        universalImage.image = image
        
    }

    func configureCell (user : friend) {
        saveObject = user
        universalTitleLabel.text = user.nameFriend
        universalImage.image = user.avaFriend
    }
    
    func configureCell (group : groupFriends) {
        saveObject = group
        universalTitleLabel.text = group.titleGroup
        universalImage.image = group.avaGroup
    }
    
    
    
    
    
}


