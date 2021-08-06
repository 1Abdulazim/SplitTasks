//
//  DefaultNavigationController.swift
//  SplitTasks
//
//  Created by Abdulazim on 02/08/21.
//

import Foundation
import UIKit

class DefaultNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
extension DefaultNavigationController:UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
}

extension UINavigationController {
    func setNav(color:UIColor = .clear,backColor:UIColor = .white,trasncluent:Bool = false){
        let font = UIFont.systemFont(ofSize: 17)
        

        navigationBar.isTranslucent = trasncluent
        navigationBar.tintColor = color
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes =  [NSAttributedString.Key.foregroundColor:color, NSAttributedString.Key.font: font]
            navBarAppearance.shadowImage = UIImage()
            navBarAppearance.backgroundColor = backColor
            navBarAppearance.shadowColor = .clear
            navigationBar.standardAppearance = navBarAppearance
            navigationBar.compactAppearance = navBarAppearance
            navigationBar.scrollEdgeAppearance = navBarAppearance
        }else{
            navigationBar.barTintColor = backColor
            navigationBar.backgroundColor = backColor
            navigationBar.titleTextAttributes =
                [NSAttributedString.Key.foregroundColor:color, NSAttributedString.Key.font: font]
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
            navigationBar.prefersLargeTitles = false
            navigationItem.largeTitleDisplayMode = .never
        }
    }
}

