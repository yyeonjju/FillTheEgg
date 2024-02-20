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
        button.titleLabel?.font = UIFont(name: FontFamily.Pretendard.regular.name, size: FontSize.regular)
//        button.titleLabel?.font = UIFont(name: FontFamily.Suit.regular.name, size: 50)
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
        
        getFontName()
        
    }
    
    
    func getFontName() {
        print("----------")
        for family in UIFont.familyNames {

            let sName: String = family as String
            print("family: \(sName)")

            for name in UIFont.fontNames(forFamilyName: sName) {
                print("name: \(name as String)")
            }
        }
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

