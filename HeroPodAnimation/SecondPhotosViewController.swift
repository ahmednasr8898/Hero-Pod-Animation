//
//  SecondPhotosViewController.swift
//  HeroPodAnimation
//
//  Created by Ahmed Nasr on 12/25/20.
//
import UIKit
import Hero
class SecondPhotosViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myTitelLabel: UILabel!
    
    let image = UserDefaults.standard.object(forKey: "Image")
    let mtitle = UserDefaults.standard.object(forKey: "Title")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView.image = UIImage(named: image as! String)
        myTitelLabel.text = mtitle as? String
        
        myImageView.heroID = image as? String
        myTitelLabel.heroID = mtitle as? String
    }
    @IBAction func backOnClick(_ sender: UIButton) {
        hero_dismissViewController()
    }
}
