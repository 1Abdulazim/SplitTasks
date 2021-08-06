//
//  TabbarViewController.swift
//  SplitTasks
//
//  Created by Abdulazim on 02/08/21.
//

import UIKit

class TabbarViewController: UITabBarController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        createControllers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createControllers()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        var newTabBarFrame = tabBar.frame
        let newTabBarHeight: CGFloat = 60
        newTabBarFrame.size.height = newTabBarHeight
        newTabBarFrame.origin.y = self.view.frame.size.height - newTabBarHeight
        tabBar.frame = newTabBarFrame
        navigationController?.setNavigationBarHidden(false, animated: false)
        print("")
    }
}
extension TabbarViewController {
    func createControllers() {
        let home = MainViewController()
        home.tabBarItem = UITabBarItem(title: "все", image: UIImage(), tag: 0)
        let homeNavigation = DefaultNavigationController(rootViewController: home)
        
        let process = ProcessViewController()
        process.tabBarItem = UITabBarItem(title: "прогрессе", image: UIImage(), tag: 1)
        let processNavigation = DefaultNavigationController(rootViewController: process)

        let complete = CompleteViewController()
        complete.tabBarItem = UITabBarItem(title: "выполнено", image: UIImage(), tag: 2)
        let completeNavigation = DefaultNavigationController(rootViewController: complete)

        viewControllers = [homeNavigation,processNavigation,completeNavigation]
    }
    
    private func appearanceSettings() {
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
    }
}
