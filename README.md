# FillTheEgg

하루 중 오전만 알차게 써도 하루 생산성 급상승한 경험 있지 않으신가요? <br/>
오전 루틴을 잡기 힘든 학생들, 프리랜서들, 취준생들을 위해 이 앱이 탄생했습니다.

아침부터 핸드폰 붙잡고 숏폼 보면 하루 날리기 일쑤! <br/>
오전 생산성을 위한 미션을 완료하며 알찬 오전을 만들어보세요. <br/>
출석체크, 감사일기, 목표실행 하나하나 완료하며 알🥚을 채워봅시다! <br/>
완료도에 따라 달라지는 동기부여 코멘트! 캘린더로 한 눈에 볼 수 있는 나의 오전 루틴 히스토리!

당신의 아침루틴 메이트가 될게요 :)

<br/>

<img src="https://github.com/yyeonjju/FillTheEgg/assets/80277701/606a9131-4b7f-473e-ac52-3cabfb825078" width="800">


<br/><br/>


## 🐣 FillTheEgg

- 앱 소개 : 알찬 하루를 보내기 위한 디딤돌인 오전 루틴을 만들 수 있는 서비스
- 개발 인원 : 1인
- 개발 기간 : 24/2/20 - 24/4/12
- 최소 버전 : 16.0


<br/><br/>

## 📎 기술 스택
- UI : UIKit, FSCalendar
- Architecture : MVC
- Local DB : CoreData
- Etc. : SwiftGen


<br/><br/>

## 📝 핵심 기능
- 출석 인증, 감사 일기, 오전 목표의 달성률에 따라 알참지수 계산
- 감사 일기&오전 목표 등록 / 목표 완료에 따른 체크박스 on/off
- 캘린더에서 특정 날짜의 알참지수에 대한 히스토리 제공

<br/><br/>


## ✅ 핵심 기술 구현 사항
- CoreData의 Entity들에 대한 CRUD가 정의된  CoreDataStore클래스 정의 시 불필요한 중복코드를 방지하기 위해 BasicCoreDataStore 제네릭 타입 생성
- NSManagedObject을 제네릭타입으로 받는 BasicCoreDataStore를 생성해서 CoreData의 Entity들에 대한 CRUD 정의
- TabBarProtocol 프로토콜을 통해 TabBar의 각 탭에 필요한 요구사항을 추상화하고, TabBarProtocol을 준수하는 TabViewType 열거형을 통해 각 탭의 
      루트 뷰컨트롤러, 아이콘 이미지, 타이틀 정의 
- TabViewType 열거형에 정의된 탭 정보를 바탕으로 탭바가 생성될 수 있도록 UITabBarController을 상속한 제네릭 CustomTabBarController를 생성
- 로젝트에 있는 리소스를 Swift 코드로 자동 생성해서 타입 안정성을 부여하고자 SwiftGen라는 도구 사용하여 빌드되는 시점에 실행될 수 있도록 설계
- 이미지 뷰와 함께 캘린더의 셀을 구성하기 위해 FSCalendarCell을 상속한 커스텀 셀 구현



<br/><br/>

## 📌서비스 핵심 목표

- 알찬 하루를 보내기 위한 디딤돌인 오전 루틴을 만들 수 있는 서비스 제공
- 성취감 향상을 위해 너무 많은 항목을 요구하지 않고 오전 출석 인증, 감사 일기 작성, 오전 목표달성 이 세 가지를 완료하는 것을 목표로 동기부여 제공
- 어떤 오전 목표와 감사함을 가지고 하루를 시작했는지 히스토리를 축적하여 캘린더에서 날짜 클릭 시 그 날의 정보 제공

<br/><br/>

