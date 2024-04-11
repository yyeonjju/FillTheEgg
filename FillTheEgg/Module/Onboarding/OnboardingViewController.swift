//
//  OnboardingViewController.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/04/10.
//

import UIKit

final class OnboardingViewController: UIViewController {
    private let viewManager = OnboardingView()
    
    private let first = FirstOnboardingViewController()
    private let second = SecondOnboardingViewController()
    private let third = ThirdOnboardingViewController()
    private let fourth = FourthOnboardingViewController()
    private let fifth = FifthOnboardingViewController()
    
    //PageViewController에서 사용될 ViewControllers 준비
    private lazy var dataViewControllers: [UIViewController] = {
        return [first, second, third, fourth, fifth]
    }()
    
    // MARK: - lifecycle

    override func loadView() {
        view = viewManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewController()
    }
    
    // MARK: - method

    private func setupPageViewController() {
        let pageViewController = viewManager.pageViewController
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        //자식 뷰컨 추가
        addChild(pageViewController)
        // ViewController 이벤트와 연결
        pageViewController.didMove(toParent: self)
        
        //첫번쨰 화면 설정 : .setViewControllers()로 첫번째 ViewController만 set
        if let firstVC = dataViewControllers.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }

}


extension OnboardingViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    //-> 이 방향으로 스와이프하기 직전에
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        
        return dataViewControllers[previousIndex]
    }

    //<- 이 방향으로 스와이프 하기 직전에
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == dataViewControllers.count {
            return nil
        }

        return dataViewControllers[nextIndex]
    }
}

