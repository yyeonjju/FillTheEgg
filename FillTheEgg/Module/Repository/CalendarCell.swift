//
//  CalendarCell.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/02.
//

import UIKit
import FSCalendar

class CalendarCell : FSCalendarCell {
    
    let eggRateImage = FilledEggImageView(mode: .withoutLabel)

    //선택되지 않은 날짜
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = FontFamily.Pretendard.regular.font(size: 10)
        label.textColor = Assets.Colors.gray3.color
        label.textAlignment = .center
        label.text = "00"
        return label
    }()

    //선택된 날짜 원 백그라운드
    let selectedDateCircle: UIView = {
        let circle = UIView()
        circle.backgroundColor = Assets.Colors.gray4.color
        circle.clipsToBounds = true
        circle.layer.cornerRadius = 12
        circle.alpha = 0
        return circle
    }()

    //선택된 날짜
    let selectedDateLabel: UILabel = {
        let label = UILabel()
        label.font = FontFamily.Pretendard.regular.font(size: 10)
        label.textColor = Assets.Colors.white.color
        label.textAlignment = .center
        label.text = "00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init!(frame: CGRect) {
        super.init(frame: frame)
        setupAutoLayout()
        setupDateCircle()
    }

    required init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func configureAppearance() {
        super.configureAppearance()
    }

    override var isSelected: Bool {
        didSet {
            if isSelected {
                selectedDateCircle.alpha = 1
            }

            else {
                selectedDateCircle.alpha = 0
            }
        }
    }

    private func setupDateCircle() {
        selectedDateCircle.addSubview(selectedDateLabel)

        NSLayoutConstraint.activate([
            selectedDateLabel.centerXAnchor.constraint(equalTo: selectedDateCircle.centerXAnchor),
            selectedDateLabel.centerYAnchor.constraint(equalTo: selectedDateCircle.centerYAnchor)
        ])
    }

    private func setupAutoLayout() {
        [eggRateImage, dateLabel, selectedDateCircle].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            eggRateImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            eggRateImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            eggRateImage.widthAnchor.constraint(equalToConstant: Size.microEggWidth),
            eggRateImage.heightAnchor.constraint(equalToConstant: Size.microEggHeight),

            dateLabel.topAnchor.constraint(equalTo: eggRateImage.bottomAnchor, constant: 2),
            dateLabel.centerXAnchor.constraint(equalTo: eggRateImage.centerXAnchor),

            selectedDateCircle.topAnchor.constraint(equalTo: eggRateImage.bottomAnchor, constant: 3),
            selectedDateCircle.centerXAnchor.constraint(equalTo: eggRateImage.centerXAnchor),
            selectedDateCircle.widthAnchor.constraint(equalToConstant: 24),
            selectedDateCircle.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    
}
