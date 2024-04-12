//
//  PageControlDotsStackView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/12.
//

import UIKit

final class PageControlDotsStackView : UIStackView {
    
    private class Dotview : UIView {
        let dot : UIView = {
            let circle = UIView()
            circle.clipsToBounds = true
            circle.layer.cornerRadius = 5
            circle.backgroundColor = Assets.Colors.gray5.color
            return circle
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)

            addSubview(dot)
            dot.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                dot.centerXAnchor.constraint(equalTo: centerXAnchor),
                dot.centerYAnchor.constraint(equalTo: centerYAnchor),
                dot.widthAnchor.constraint(equalToConstant: 10),
                dot.heightAnchor.constraint(equalToConstant: 10),
            ])
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    private var dots : [Dotview] = []
    
    // MARK: - init

    init(pageCount : Int) {
        super.init(frame: .zero)
        
        for _ in 0..<pageCount {
            self.dots.append(Dotview())
        }
        
        setupStackView()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - setup
    private func setupStackView () {
        self.spacing = 10
        self.distribution = .equalCentering
        self.axis = .horizontal
        self.alignment = .center
        
        dots.forEach {
            addArrangedSubview($0)
        }
    }
    
    // MARK: - method
    func switchPage(to : Int) {
        for (index, item) in dots.enumerated() {
            if index == to {
                item.dot.backgroundColor = Assets.Colors.gray3.color
            }else {
                item.dot.backgroundColor = Assets.Colors.gray5.color
            }
        }
    }

}
