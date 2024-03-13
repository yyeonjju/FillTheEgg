//
//  BulletTableViewCell.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/12.
//

import UIKit

final class BulletTableViewCell : UITableViewCell {
    // MARK: - Components
    private lazy var stackView : UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 10
        sv.alignment = .firstBaseline
        sv.distribution = .fill
        sv.addArrangedSubview(bullet)
        sv.addArrangedSubview(label)
        sv.backgroundColor = .red
        let _ = print("🍑BulletTableViewCell - stackView")
        return sv
    }()
    
    
    let bullet : UIView = {
        let view = UIView()
        view.backgroundColor = Assets.Colors.mainYellow.color
        view.layer.cornerRadius = 5
        
        return view
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.text = gratitudeJournalList[0].text
        label.textColor = Assets.Colors.gray1.color
        label.numberOfLines = 0

        return label
    }()
    
    
    // MARK: - init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupStackView()

    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        print("🍑BulletTableViewCell - updateConstraints")
        
        setupConstrains()
        
        super.updateConstraints()
    }

    
    
    // MARK: - layout constraint draw
    
    
    
    // MARK: - method
    
    func setupStackView() {
        [stackView]
            .forEach{
                self.addSubview($0)
            }
    }
    
    func setupConstrains () {

        [stackView, bullet, label]
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: widthAnchor), //label이 자동 개행되기 위해 필요
//            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            bullet.widthAnchor.constraint(equalToConstant: 10),
            bullet.heightAnchor.constraint(equalToConstant: 10)
        ])
        
        
        
    }
    
}
