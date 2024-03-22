//
//  BulletWithDeleteButtonTableViewCell.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/22.
//

import UIKit

final class BulletWithDeleteButtonTableViewCell : BulletTableViewCell {
    // MARK: - Components
    
    private let deleteButton : UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold)
        let titleImage = UIImage(systemName: "trash", withConfiguration: imageConfig)
        button.setImage(titleImage, for: .normal)
        
        button.backgroundColor = Assets.Colors.gray4.color
        button.tintColor = Assets.Colors.gray3.color
        button.layer.cornerRadius = 5

        return button
    }()
    
    
    // MARK: - init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupStackView()
        setupConstrains() //⭐️ override func updateConstraints() 이 위치가 아니라 override init 여기서 해주어야한다

    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    // MARK: - layout constraint draw
    
    private func setupStackView() {
        [deleteButton]
            .forEach{
                contentsStackView.addArrangedSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    private func setupConstrains () {
        
        NSLayoutConstraint.activate([
            deleteButton.widthAnchor.constraint(equalToConstant: 40),
            deleteButton.heightAnchor.constraint(equalToConstant: 40),
        ])

    }
    
}
