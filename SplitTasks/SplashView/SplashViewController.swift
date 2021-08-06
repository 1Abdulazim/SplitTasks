//
//  SplashViewController.swift
//  SplitTasks
//
//  Created by Abdulazim on 02/08/21.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .purple
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1) {
            guard let window = UIApplication.shared.windows.first else { return }
            let tabBarController = TabbarViewController()
            window.rootViewController = tabBarController
            let options: UIView.AnimationOptions = .transitionCrossDissolve
            let duration: TimeInterval = 0.3
            UIView.transition(with: window, duration: duration, options: options, animations: {}, completion:
                                { completed in
                                    // maybe do something on completion here
                                })

        }
    }

}
