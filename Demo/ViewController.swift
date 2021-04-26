//
//  ViewController.swift
//  Demo
//
//  Created by Rajiv Puli on 26/04/21.
//

import UIKit
import RCustomButton

class ViewController: UIViewController {

    @IBOutlet var button: RButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let button = RButton()
        button.shapeOfButton = .cirlce
    }


}

