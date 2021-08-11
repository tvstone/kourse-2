//
//  MyProfileController.swift
//  MyVKclient
//
//  Created by Владислав Тихоненков on 03.08.2021.
//

import UIKit

class MyProfileController: UIViewController {

    @IBOutlet weak var myName: UILabel!
    @IBOutlet weak var myUserId: UILabel!
    @IBOutlet weak var myAvatar: UIImageView!
    @IBOutlet weak var myGallary: UICollectionView!
    @IBOutlet weak var backView: UIView!
   
    var myFotoArray = [UIImage]()
    let countCells = 2
    let myFotoCellId = "myFotoCellId"
    let offSetCell : CGFloat = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myUserId.text = "User ID : " + String(Session.shared.userId)
        avatarSetar()
        myArraySetup()
    
        myGallary.dataSource = self
        myGallary.delegate = self
        
        myGallary.register(UINib(nibName: "MyFotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: myFotoCellId)
        
    }
    
    func avatarSetar() {
        myAvatar.layer.cornerRadius = 90
  
    }
    func myArraySetup() {
        for i in 1...6 {
            let image = UIImage(named: "p\(i)")!
            myFotoArray.append(image)
        }
    }

}

extension MyProfileController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myFotoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myFotoCellId, for: indexPath) as? MyFotoCollectionViewCell else {return UICollectionViewCell()}
        cell.fotoView.image = myFotoArray[indexPath.item]
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        let speacing = ((countCells + 1) * Int(offSetCell)) / countCells
        let widthCell = frameCV.width / CGFloat(countCells)-CGFloat(speacing)
        let heightCell = widthCell
        
        return CGSize(width: widthCell, height: heightCell)
    }
    
}
