//
//  SwcondViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/02/17.
//

import UIKit

class SwcondViewController: UIViewController {

    let label : UILabel = {
        var label = UILabel()
        label.textColor = Colors.mainYellow.color
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "두번째 화면"
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
