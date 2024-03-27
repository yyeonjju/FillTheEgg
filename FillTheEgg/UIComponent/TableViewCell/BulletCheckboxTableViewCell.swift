//
//  BulletCheckboxTableViewCell.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/18.
//

import UIKit

final class BulletCheckboxTableViewCell : BulletTableViewCell {
    
    var toggleCheckbox : (BulletCheckboxTableViewCell) -> Void = { _ in }
    
    // MARK: - Components
    
    let ckeckbox : CheckBoxButton = {
        let button = CheckBoxButton()
//        button.backgroundColor = .green
        
        button.addTarget(self, action: #selector(checkboxTapped), for: .touchUpInside)
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
        [ckeckbox]
            .forEach{
                contentsStackView.addArrangedSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    private func setupConstrains () {
        
        NSLayoutConstraint.activate([
            ckeckbox.widthAnchor.constraint(equalToConstant: 30),
            ckeckbox.heightAnchor.constraint(equalToConstant: 30),
        ])

    }
    
    // MARK: - method
    @objc func checkboxTapped() {
        toggleCheckbox(self)
    }
}
