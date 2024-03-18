//
//  BulletCheckboxTableViewCell.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/03/18.
//

import UIKit

final class BulletCheckboxTableViewCell : UITableViewCell {
    // MARK: - Components
    private lazy var contentsStackView : UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 10
        sv.alignment = .center
        sv.distribution = .fill
        sv.addArrangedSubview(bullet)
        sv.addArrangedSubview(label)
        sv.addArrangedSubview(ckeckbox)
//        sv.backgroundColor = .red
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
//        label.lineBreakMode = .byTruncatingTail

        return label
    }()
    
    let ckeckbox : CheckBoxButton = {
        let button = CheckBoxButton()
//        button.backgroundColor = .green
        

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
    
    override func updateConstraints() {
        print("🍑BulletTableViewCell - updateConstraints")
        super.updateConstraints()
    }

    
    
    // MARK: - layout constraint draw
    
    func setupStackView() {
        [contentsStackView]
            .forEach{
                contentView.addSubview($0)
            }
    }
    
    func setupConstrains () {

        [contentsStackView, bullet, label, ckeckbox]
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        NSLayoutConstraint.activate([
            //⭐️ label이 자동 개행되기 위해 필요
            contentsStackView.widthAnchor.constraint(equalTo: widthAnchor),
            
            //⭐️ contentView를 기준으로 stackView의 오토레이아웃 조절
            contentsStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            contentsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            contentsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            bullet.widthAnchor.constraint(equalToConstant: 10),
            bullet.heightAnchor.constraint(equalToConstant: 10),
            
            ckeckbox.widthAnchor.constraint(equalToConstant: 30),
            ckeckbox.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        
        
    }
    
}
