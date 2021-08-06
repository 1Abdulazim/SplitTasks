//
//  MainViewController.swift
//  SplitTasks
//
//  Created by Abdulazim on 02/08/21.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    weak var centerLabel:UILabel!

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    var data:[TasksModel]?
    
    let dataProvider = HomeViewDataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
        setupUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
        
        if data?.count == 0 {
            self.tableView.isHidden = true
            self.centerLabel.isHidden = false
            self.centerLabel.text = "Press + button"
        }else{
            self.tableView.isHidden = false
            self.centerLabel.isHidden = true
        }
    }
    

    
    func fetchData() {
        do {
            self.data = try context.fetch(TasksModel.fetchRequest())
            self.dataProvider.tasks = self.data ?? []
        } catch {

        }
    }
    
    @objc func addTapped(_ sender:Any) {
        let vc = AddViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension MainViewController {
    
    private func setupUI() {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        label.text = "Press + button"
        let constraints = [
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(constraints)
        self.centerLabel = label
    }
    private func appearanceSettings() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        
        self.dataProvider.tableView = self.tableView
        self.dataProvider.ixResponder = self
        
    }
}
extension MainViewController: MainIxResponder {
    func processButtonTapped(_ index: Int) {
        self.data?[index].status = "1"
        
        do {
            try self.context.save()
        } catch {
            
        }
        self.fetchData()
    }
    
    func editTapped(_ index: Int) {

        let customAlert = EditTasksViewController()
        
        customAlert.modalTransitionStyle = .crossDissolve
        customAlert.modalPresentationStyle = .currentContext
        customAlert.titleText = data?[index].title
        customAlert.desc = data?[index].desc
        
        customAlert.confirmButtonTapped = { ()
            
            let titleTextfield = customAlert.titleField.textField
            self.data?[index].title = titleTextfield.text
            
            let descriptionTextfield = customAlert.descField.textField
            self.data?[index].desc = descriptionTextfield.text
            
            do {
                try self.context.save()
            } catch {
                
            }
            self.fetchData()
            
        }
        
        self.present(customAlert, animated: true, completion: nil)
    }
    
    func deleteButtonActionTap(_ index: Int) {
        let tasksToRemove = self.data![index]
        
        self.context.delete(tasksToRemove)
        
        do {
            try self.context.save()
        } catch {
            
        }
        self.fetchData()
    }

}
