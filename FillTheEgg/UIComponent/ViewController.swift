//
//  ViewController.swift
//  FillTheEgㄴg
//
//  Created by 하연주 on 2024/02/12.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .blue
        button.setTitle("첫번째탭 다음페이지로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 150),
            nextButton.heightAnchor.constraint(equalToConstant: 80),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    @objc func nextButtonTapped () {
        let SwcondVC = SwcondViewController()
        SwcondVC.modalPresentationStyle = .fullScreen
        //⭐️⭐️⭐️⭐️⭐️ 네비게이션할려면 present가 아니라 Push⭐️⭐️⭐️⭐️⭐️⭐️⭐️
//        present(firstViewNextPageController, animated: true, completion: nil)
        self.navigationController?.pushViewController(SwcondVC, animated:
        true)
    }


}

