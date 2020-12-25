//
//  SecondViewController.swift
//  HeroPodAnimation
//
//  Created by Ahmed Nasr on 12/25/20.
//
import UIKit
import Hero

class SecondViewController: UIViewController {

    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var nameView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        secondImage.heroID = "myImage"
        secondImage.image = UIImage(named: "ahmed")
        nameView.heroID = "myName"
    }
    @IBAction func backOnclick(_ sender: UIButton) {
        hero_dismissViewController()
    }
    @IBAction func handelPanGesture(_ sender: UIPanGestureRecognizer) {
        let transtion = sender.translation(in: nil)
        let progress = transtion.y / 2 / view.bounds.height
        
        switch sender.state {
        case .began:
            hero_dismissViewController()
        case .changed:
            Hero.shared.update(progress)
            let currentPostion = CGPoint(x: transtion.x + secondImage.center.x, y: transtion.y + secondImage.center.y)
            Hero.shared.apply(modifiers: [.position(currentPostion)], to: secondImage)
        default:
            Hero.shared.finish()
            /*if progress > 0.1{
                Hero.shared.finish()
            }else{
                Hero.shared.cancel()
            }*/
        }
    }
}
