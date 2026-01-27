//
//  DetailsVC.swift
//  button
//
//  Created by Gagan Verma on 28/01/26.
//

import UIKit

class DetailsVC: UIViewController {

    let lable = UILabel()
    var selectedItem : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        lable.text = selectedItem
        lable.font = .systemFont(ofSize: 24)
        lable.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(lable)
        
        NSLayoutConstraint.activate([
            lable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lable.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    

}
