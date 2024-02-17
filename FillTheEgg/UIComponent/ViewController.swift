//
//  ViewController.swift
//  FillTheEgㄴg
//
//  Created by 하연주 on 2024/02/12.
//

import UIKit

class ViewController: UIViewController {
    
    let label : UILabel = {
        var label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        label.textColor = .black
//        label.textColor = UIColor(named : "mainYellow")
        label.textColor = Colors.mainYellow.color
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "----"
        return label
    }()

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 150),
            label.heightAnchor.constraint(equalToConstant: 80),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }


}

