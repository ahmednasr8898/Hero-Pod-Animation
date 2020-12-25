//
//  photosViewController.swift
//  HeroPodAnimation
//
//  Created by Ahmed Nasr on 12/25/20.
//

import UIKit
import Hero
class photosViewController: UIViewController {

    @IBOutlet weak var collectioView: UICollectionView! 
    let titles = ["Leo", "Loe Messi", "Goat", "Barca"]
    let photos = ["1","2","3","4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectioView.delegate = self
        collectioView.dataSource = self
    }
}
extension photosViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.myImage.image = UIImage(named: photos[indexPath.row])
        cell.myTitleLabel.text = titles[indexPath.row]
        
        cell.myImage.heroID = photos[indexPath.row]
        cell.myTitleLabel.heroID = titles[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) - 15, height: 250) 
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UserDefaults.standard.setValue(photos[indexPath.row], forKey: "Image")
        UserDefaults.standard.setValue(titles[indexPath.row], forKey: "Title")
        let st = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SecondPhotosViewController")
        self.present(st, animated: true, completion: nil)
    }
}
