//
//  FotoController.swift
//  MyVKclient
//
//  Created by Владислав Тихоненков on 27.06.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class FotoController: UICollectionViewController {

    var fotoArray = [UIImage]()
    var FullSizeViewControllerID = "FullSizeViewControllerID"
    var countCells = 3
    var offSetCell = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UINib(nibName: "FotoCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return fotoArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? FotoCell else { return UICollectionViewCell()}
    
       cell.config(image: fotoArray[indexPath.item])

        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          let vc = storyboard?.instantiateViewController(withIdentifier: FullSizeViewControllerID) as! FullSizeViewController
          vc.friendsArray = fotoArray
          vc.indexPath = indexPath
          self.navigationController?.pushViewController(vc, animated: true)
      }
}

extension FotoController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        let speacing = ((countCells + 1) * offSetCell) / countCells
        let widthCell = frameCV.width / CGFloat(countCells)-CGFloat(speacing)
        let heightCell = widthCell
        
        return CGSize(width: widthCell, height: heightCell)
    }
}
