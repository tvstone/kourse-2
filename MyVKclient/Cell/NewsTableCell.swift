//
//  NewsTableCell.swift
//  MyVKclient
//
//  Created by Владислав Тихоненков on 06.07.2021.
//

import UIKit

class NewsTableCell: UITableViewCell {
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var likeButton: UIButton!

    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var viewingCount: UILabel!
    @IBOutlet weak var shareButtom: UIButton!
    @IBOutlet weak var commentButtom: UIButton!
    
    var isLiked = false
    var likeCounterInt = 0
    
    func setupNewsCell(){
       
    }
   
    func clearNewsCell() {
        newsLabel.text = nil
        newsImage.image = nil
        
    }
    
    override func prepareForReuse() {
        clearNewsCell()
    }
    
    func config (textLabel : String?, image: UIImage?){
        newsLabel.text = textLabel
        newsImage.image = image
        
    }
     
    override func awakeFromNib() {
        super.awakeFromNib()
        setupNewsCell()
        clearNewsCell()
    
        likeImageView.image = UIImage(systemName: "heart")
        likeCount.text = String(likeCounterInt)
        likeCount.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        viewingCount.text = "1"
    
    }


    @IBAction func likeClikButtom(_ sender: UIButton) {
    
                if isLiked {
        
                    likeImageView.image = UIImage(systemName: "heart")
                    likeCounterInt -= 1
                    likeCount.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        
                }
                else {
        
                    likeImageView.image = UIImage(systemName: "heart.fill")
                    likeCounterInt += 1
                    likeCount.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                }
        
                likeCount.text = String(likeCounterInt)
        
                isLiked = !isLiked

    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      
    }
    
}
