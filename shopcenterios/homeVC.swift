//
//  homeVC.swift
//  shopcenterios
//
//  Created by Olgun ‏‏‎‏‏‎ on 28.07.2024.
//

import UIKit

class homeVC: UIViewController {

    @IBOutlet var imageVieww: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func shoplistClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toshoplistVC", sender: nil)
    }
    
    @IBAction func tvClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "tourunVC", sender: nil)
    }
    
    @IBAction func foodClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "tourunVC", sender: nil)
    }
    @IBAction func marktClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "tourunVC", sender: nil)
    }
    @IBAction func vegetableClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "tourunVC", sender: nil)
    }
}
