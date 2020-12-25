//
//  ViewController.swift
//  HeroPodAnimation
//
//  Created by Ahmed Nasr on 12/25/20.
//
import UIKit
import Hero

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView.heroID = "myImage"
        myImageView.image = UIImage(named: "ahmed")
        myNameLabel.heroID = "myName"
    }
    @IBAction func ImageButtonOnClick(_ sender: UIButton) {
        let st = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SecondViewController")
        self.present(st, animated: true, completion: nil)
    }
}

