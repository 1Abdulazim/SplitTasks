//
//  AddViewController.swift
//  SplitTasks
//
//  Created by Abdulazim on 02/08/21.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var titleField: DefaultTextfield!
    @IBOutlet weak var descriptionField: DefaultTextfield!
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var expiryDate:Date? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
        dataPicker.addTarget(self, action: #selector(dataPickerAction(_:)), for: .valueChanged)
        self.saveButton.addTarget(self, action: #selector(saveButtonAction(_:)), for: .touchUpInside)
    }
    
    
    @objc func saveButtonAction(_ sender:UIButton) {
        let newData = TasksModel(context: self.context)
        newData.title = titleField.textField.text
        newData.desc = descriptionField.textField.text
        newData.status = "0"
        newData.data = expiryDate
        
        do {
            try self.context.save()
        } catch {
            
        }

        self.navigationController?.popViewController(animated: true)
    }
}
extension AddViewController {
    private func appearanceSettings() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.titleField.topLabel.text = "title"
        self.descriptionField.topLabel.text = "description"
        dataPicker.datePickerMode = .date
        dataPicker.locale = .current
        dataPicker.date = Date()
    }
    
    
    @objc func dataPickerAction(_ sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let dateString = dateFormatter.string(from: dataPicker.date)
        let expiryDate = dateFormatter.date(from: dateString)
        
        self.expiryDate = expiryDate
    }
}
