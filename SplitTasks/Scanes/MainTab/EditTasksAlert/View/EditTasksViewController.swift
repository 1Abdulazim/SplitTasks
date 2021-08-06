//
//  EditTasksViewController.swift
//  SplitTasks
//
//  Created by Abdulazim on 05/08/21.
//

import UIKit

class EditTasksViewController: UIViewController {

    @IBOutlet weak var titleField: DefaultTextfield!
    @IBOutlet weak var descField: DefaultTextfield!
    internal var confirmButtonTapped: (()->())?
    
    internal var titleText: String? = ""
    internal var desc:String? = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.topLabel.text = "title"
        descField.topLabel.text = "description"
        titleField.textField.text = titleText
        descField.textField.text = desc

    }
    @IBAction func confirmButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.confirmButtonTapped?()
            
        }
    }
    @IBAction func cancelButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
