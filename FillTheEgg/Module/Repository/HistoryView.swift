//
//  HistoryView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/02.
//

import UIKit

class HistoryView : UIView{
    
    var attendance = [0]
    var gratitudeJournal = ["1", "2"]
    var dailyGoal = ["1", "2"]
    
    private let mainLabel : UILabel = {
        let label = UILabel ()
        label.text = "이 날의 알참 지수!"
        label.font = FontFamily.Pretendard.extraBold.font(size: 20)
        label.textColor = Assets.Colors.gray2.color
        return label
    }()
    
    let showDetailButton : ButtonWithOutLine = {
        let btn = ButtonWithOutLine(title: "자세히 보기", color: Assets.Colors.softRed.color, borderColor: Assets.Colors.softRed.color.cgColor)
        
        return btn
    }()
    
    private lazy var attendanceLabel : UILabel = {
        let label = UILabel ()
        label.text = attendance.isEmpty ? "- 출석 실패!" :  "- 출석 완료!"
        label.font = FontFamily.Pretendard.bold.font(size: 18)
        label.textColor = Assets.Colors.gray3.color
        return label
    }()
    
    private lazy var graititudeJournalLabel : UILabel = {
        let label = UILabel ()
        label.text = "- 감사일기 \(gratitudeJournal.count)개 작성!"
        label.font = FontFamily.Pretendard.bold.font(size: 18)
        label.textColor = Assets.Colors.gray3.color
        return label
    }()
    
    private lazy var dailyGoalLabel : UILabel = {
        let label = UILabel ()
        label.text = "- 오전 목표 \(dailyGoal.count)개 완료!"
        label.font = FontFamily.Pretendard.bold.font(size: 18)
        label.textColor = Assets.Colors.gray3.color
        return label
    }()
    
    private let eggRateImage = FilledEggImageView()
    
    
    // MARK: - init

    init() {
        super.init(frame: .zero)
        
        setupSubview()
        setupConstraints()
        
        backgroundColor = Assets.Colors.white.color
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        eggRateImage.ratio = 0.3
    }
    
    // MARK: - layout
    
    private func setupSubview() {
        [mainLabel, attendanceLabel, graititudeJournalLabel, dailyGoalLabel, eggRateImage, showDetailButton]
            .forEach{
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.bottomAnchor.constraint(equalTo: dailyGoalLabel.bottomAnchor, constant: 30),
            
            mainLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            showDetailButton.centerYAnchor.constraint(equalTo: mainLabel.centerYAnchor),
            showDetailButton.leadingAnchor.constraint(equalTo: mainLabel.trailingAnchor, constant: 30),
            
            attendanceLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 40),
            attendanceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            graititudeJournalLabel.topAnchor.constraint(equalTo: attendanceLabel.bottomAnchor, constant: 20),
            graititudeJournalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            dailyGoalLabel.topAnchor.constraint(equalTo: graititudeJournalLabel.bottomAnchor, constant: 20),
            dailyGoalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            

            eggRateImage.centerYAnchor.constraint(equalTo: graititudeJournalLabel.centerYAnchor),
            eggRateImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            eggRateImage.widthAnchor.constraint(equalToConstant: Size.middleEggWidth),
            eggRateImage.heightAnchor.constraint(equalToConstant: Size.middleEggHeight),
            
        ])
        
        
    }

    
}
