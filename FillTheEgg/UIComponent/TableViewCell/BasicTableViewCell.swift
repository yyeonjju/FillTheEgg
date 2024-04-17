//
//  BasicTableViewCell.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/17.
//

import UIKit

final class BasicTableViewCell: UITableViewCell {
    let label : UILabel = {
        let label = UILabel()
        
        label.font = FontFamily.Pretendard.regular.font(size: 16)
        label.textColor = Assets.Colors.gray1.color
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
        [label]
            .forEach{
                contentView.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    private func setupConstrains () {
        NSLayoutConstraint.activate([
            //⭐️ contentView를 기준으로 stackView의 오토레이아웃 조절
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),

        ])        
    }
}
