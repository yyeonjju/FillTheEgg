//
//  OpenSourceTableViewCell.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/18.
//

import UIKit

final class OpenSourceTableViewCell: UITableViewCell {
    let label : UILabel = {
        let label = UILabel()
        label.text = "--"
        label.font = FontFamily.Pretendard.regular.font(size: 16)
        label.textColor = Assets.Colors.gray1.color
        label.numberOfLines = 0
        return label
    }()
    
    let lintLabel : UILabel = {
        let label = UILabel()
        label.text = "--"
        label.font = FontFamily.Pretendard.regular.font(size: 16)
        label.textColor = Assets.Colors.linkBlue.color
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupStackView()
        setupConstrains()

    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - layout constraint
    
    private func setupStackView() {
        [label, lintLabel]
            .forEach{
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    private func setupConstrains () {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            lintLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 4),
            lintLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lintLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)

        ])
    }
}

