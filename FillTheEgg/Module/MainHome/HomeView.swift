//
//  HomeView.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/02/20.
//


import UIKit

final class HomeView: UIView {
    
    
    // MARK: - Component
    
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    
    var contentView: UIView = {
        let view = UIView()
//        view.backgroundColor = .blue
        return view
    }()
    
    let attendCheckSection : AttendanceCheckView = {
        let view = AttendanceCheckView(frame: .zero)

        return view
    }()
    
    lazy var gratitudeJournalSection : GratitudejournalView = {
        let view = GratitudejournalView(frame: .zero)
//        view.backgroundColor = .blue
        return view
    }()
    
    lazy var dailyGoalsSection : DailyGoalsView = {
        let view = DailyGoalsView(frame: .zero)

        return view
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = FontFamily.Pretendard.semiBold.font(size: FontSize.homeViewDate)
        label.textColor = Assets.Colors.gray2.color
        label.textAlignment = .left
        label.numberOfLines = 2
        label.text = "2월 20일 화요일"
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
//        label.font = UIFont(name: FontFamily.Pretendard.extraBold.name, size: FontSize.homeViewTime)
        //swiftgen 사용
        label.font = FontFamily.Pretendard.extraBold.font(size: FontSize.homeViewTime)
        
        label.textColor = Assets.Colors.gray2.color
        label.textAlignment = .left
        label.text = "20:03"
        return label
    }()
    
    private lazy var motivationStackView : UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution  = .fill
        sv.alignment = .center
        sv.spacing = 8
        sv.addArrangedSubview(quoteLeftIcon)
        sv.addArrangedSubview(motivationLabel)
        sv.addArrangedSubview(quoteRightIcon)
        return sv
    }()
    
    private let quoteLeftIcon : UIImageView = {
        let ImageView = UIImageView()
        ImageView.image = Assets.Assets.quoteLeft.image.withRenderingMode(.alwaysTemplate)
        ImageView.tintColor = Assets.Colors.mainYellow.color
        return ImageView
    }()
    private let quoteRightIcon : UIImageView = {
        let ImageView = UIImageView()
        ImageView.image = Assets.Assets.quoteRight.image.withRenderingMode(.alwaysTemplate)
        ImageView.tintColor = Assets.Colors.mainYellow.color
        return ImageView
    }()
    
    let motivationLabel : UILabel = {
        let label = UILabel()
        label.font = FontFamily.Pretendard.semiBold.font(size: FontSize.regular)
        label.textColor = Assets.Colors.gray2.color
        label.numberOfLines = 0
        label.text = "오늘 하루도 알찬 아침으로 하루를 시작해보세요! "
        label.textAlignment = .center
        
        return label
    }()
   
    let eggRateImage = FilledEggImageView()
    
    private let eggRateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.Pretendard.regular.name, size: FontSize.regular)
        label.textColor = Assets.Colors.gray2.color
        label.text = "오늘의 알참지수!"
        return label
    }()
    
    
    
    // MARK: - Method



    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitial()
        setupAddSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func updateConstraints() {
//        print("updateConstraints")
//        super.updateConstraints()
//    }
    
    //뷰의 드로잉 주기 중 하위뷰의 레이아웃을 설정하는 단계
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setupInitial() {
        backgroundColor = .white
    }
    
    func setupAddSubView() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        [dateLabel,
          timeLabel,
//          motivationLabel,
          eggRateImage,
          eggRateLabel,
          attendCheckSection,
          gratitudeJournalSection,
          dailyGoalsSection,
          motivationStackView,
        ]
            .forEach {
                contentView.addSubview($0)
            }
        [dateLabel,
          timeLabel,
          motivationLabel,
          eggRateImage,
          eggRateLabel,
          attendCheckSection,
          gratitudeJournalSection,
          dailyGoalsSection,
          motivationStackView,
         quoteLeftIcon,
         quoteRightIcon,
        ]
            .forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    func setupConstraints()  {
    
        NSLayoutConstraint.activate([
            
            //scrollView
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            //스크롤 뷰에 담을 contentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.bottomAnchor.constraint(equalTo: dailyGoalsSection.bottomAnchor, constant: 200),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            //contentView는 전체적으로 scrollView대비 양옆 간격 주기
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            
            //실제 뷰
            
            // dateLabel
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dateLabel.heightAnchor.constraint(equalToConstant: dateLabel.font.pointSize),
            
            
            // timeLabel
            timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            timeLabel.heightAnchor.constraint(equalToConstant: timeLabel.font.pointSize),
            
            //eggRateLabel
            eggRateLabel.topAnchor.constraint(equalTo: dateLabel.topAnchor),
            eggRateLabel.centerXAnchor.constraint(equalTo: eggRateImage.centerXAnchor),
            eggRateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
//            eggRateLabel.bottomAnchor.constraint(equalTo: eggRateImage.topAnchor, constant: 20),
            
            //eggRateImage
//            eggRateImage.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor),
            eggRateImage.topAnchor.constraint(equalTo: eggRateLabel.bottomAnchor,constant: 10),
//            eggRateImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            eggRateImage.widthAnchor.constraint(equalToConstant: Size.middleEggWidth),
            eggRateImage.heightAnchor.constraint(equalToConstant: Size.middleEggHeight),
            
            
            // motivationStackView
            quoteLeftIcon.widthAnchor.constraint(equalToConstant: 40),
            quoteLeftIcon.heightAnchor.constraint(equalToConstant: 40),
            
            quoteRightIcon.widthAnchor.constraint(equalToConstant: 40),
            quoteRightIcon.heightAnchor.constraint(equalToConstant: 40),
            
            motivationStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            motivationStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            motivationStackView.topAnchor.constraint(equalTo: eggRateImage.bottomAnchor, constant: 40),
            motivationStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            motivationStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            
            //attendCheckSection
            attendCheckSection.topAnchor.constraint(equalTo: motivationStackView.bottomAnchor, constant: 50),
            attendCheckSection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            attendCheckSection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            attendCheckSection.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            //gratitudeJournalSection
            gratitudeJournalSection.topAnchor.constraint(equalTo: attendCheckSection.bottomAnchor, constant: 50),
            gratitudeJournalSection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            gratitudeJournalSection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            gratitudeJournalSection.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            //dailyGoalsSection
            dailyGoalsSection.topAnchor.constraint(equalTo: gratitudeJournalSection.bottomAnchor, constant: 50),
            dailyGoalsSection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dailyGoalsSection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dailyGoalsSection.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            
            
        ])
        
        
    }

}

