//
//  SceneDelegate.swift
//  FillTheEgg
//
//  Created by 하연주 on 2024/02/12.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .white //전체적 배경색 해줄려면 이렇게해야하네..
        
        //⭐️ 네비게이션 컨트롤러 생성
        let homeView = UINavigationController(rootViewController: HomeViewController())
        let repositoryView = UINavigationController(rootViewController: RepositoryViewController())
        let settingsView = UINavigationController(rootViewController: SettingsViewController())
        
        
//        homeView.navigationBar.backgroundColor = .yellow
        
        
        //⭐️ 탭바 컨트롤러 생성
        let tabBarVC = UITabBarController()
        
        // 탭바로 사용하기 위한 뷰 컨트롤러들 설정
        tabBarVC.setViewControllers([homeView,repositoryView,settingsView], animated: true)
        tabBarVC.modalPresentationStyle = .fullScreen
//        tabBarVC.tabBar.backgroundColor = .gray
        
        // 탭바 이름/이미지 설정 (이미지는 애플이 제공하는 것으로 사용)
        guard let items = tabBarVC.tabBar.items else { return }
        
        //HomeViewController
        items[0].title = "Home"
        items[0].image = UIImage(systemName: "house")
        
        //CalendarHomeViewController
        items[1].title = "Calendar"
        items[1].image = UIImage(systemName: "calendar")
        
        //SettingsViewController
        items[2].title = "Settings"
        items[2].image = UIImage(systemName: "gearshape")
        
        
        
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible() //현재 창을 표시하고 같은 수준 이하의 다른 모든 창 앞에 배치하는 편리한 방법
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

