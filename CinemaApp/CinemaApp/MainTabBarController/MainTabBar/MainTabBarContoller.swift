//
//  MainTabBarContoller.swift
//  CinemaApp
//
//  Created by Stanislav on 18.09.2023.
//

import UIKit


// MARK: - MainTabBarController

class MainTabBarContoller: UITabBarController {

    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        createViewControllers()
    }
    
    // MARK: Setup View Controllers in TabBar
    
    private func createViewControllers() {
        viewControllers = [
            configureViewController(viewController: MainViewController(),
                                    title: "Главная",
                                    image: UIImage(systemName: "house")),
            configureViewController(viewController: CatalogViewController(),
                                    title: "Каталог",
                                    image: UIImage(systemName: "play.square.stack")),
            configureViewController(viewController: MyChoiceViewContoller(),
                                    title: "Мой выбор",
                                    image: UIImage(systemName: "face.smiling")),
            configureViewController(viewController: SearchViewContoller(),
                                    title: "Поиск",
                                    image: UIImage(systemName: "magnifyingglass")),
            configureViewController(viewController: ProfileViewController(),
                                    title: "Профиль",
                                    image: UIImage(systemName: "person"))
        ]
    }

}

// MARK: - Methods for setting up TabBar and ViewController

private extension MainTabBarContoller {
    
    // MARK: Setup color for TabBar
    
    private func configureTabBar() {
        tabBar.backgroundColor = UIColor(named: "TabBarColor")
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .gray
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(named: "TabBarColor")
        
        tabBar.scrollEdgeAppearance = tabBarAppearance
        tabBar.standardAppearance = tabBarAppearance
        
        
    }
    
    // MARK: Setup title and image for View Controller
    
    private func configureViewController(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        let navigationController = UINavigationController(rootViewController: viewController)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "BackgroundColorForNavCont")
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        return navigationController
    }
    
}
