//
//  ViewController.swift
//  button
//
//  Created by Gagan Verma on 27/01/26.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func buttonTapped(_ sender: Any) {
       let vc = storyboard?.instantiateViewController(withIdentifier: "tapped") as! TappedVC
        navigationController?.pushViewController(vc, animated: true)
     
    }
    
    
}

