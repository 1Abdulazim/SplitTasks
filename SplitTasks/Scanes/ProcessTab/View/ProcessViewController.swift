//
//  ProcessViewController.swift
//  SplitTasks
//
//  Created by Abdulazim on 02/08/21.
//

import UIKit
import CoreData

class ProcessViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let dataProvider = ProcessDataProvider()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var data:[TasksModel]?


    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    private func fetchData() {
        do {
            let request = TasksModel.fetchRequest() as NSFetchRequest<TasksModel>
            let pred = NSPredicate(format: "status CONTAINS 1")
            request.predicate = pred
            self.data = try context.fetch(request)
            self.dataProvider.processTasks = self.data ?? []
            
        } catch {
            
        }
    }
}

extension ProcessViewController:ProcessIxResponder {
    func doneButtonTapped(_ index: Int) {
        self.data?[index].status = "2"
        
        do {
           try self.context.save()
        } catch {
            
        }
        self.fetchData()
    }
    
    private func appearanceSettings() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.dataProvider.tableView = self.tableView
        self.dataProvider.ixResponder = self
    }
}
