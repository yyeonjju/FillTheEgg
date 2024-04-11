//
//  OnboardingView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/10.
//

import UIKit

final class OnboardingView : UIView {
    
    //PageViewController 정의
    lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return vc
    }()
    
    let pageControlDotsView : UIView = {
        let view = UIView()
        view.backgroundColor = Assets.Colors.lightBeige.color
        return view
    }()
    
    // MARK: - init

    override init(frame : CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Assets.Colors.eggWhite.color
        setupAddSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup

    func setupAddSubView() {
        [pageControlDotsView, pageViewController.view]
            .forEach{
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pageControlDotsView.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            pageControlDotsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageControlDotsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageControlDotsView.heightAnchor.constraint(equalToConstant: 100),
            
            
            pageViewController.view.topAnchor.constraint(equalTo: pageControlDotsView.bottomAnchor, constant: 10),
            pageViewController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: bottomAnchor),
//            pageViewController.view.heightAnchor.constraint(equalToConstant: 500),
        ])
    }

}
