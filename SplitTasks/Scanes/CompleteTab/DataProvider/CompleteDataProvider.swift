//
//  CompleteDataProvider.swift
//  SplitTasks
//
//  Created by Abdulazim on 06/08/21.
//

import Foundation
import UIKit

final class CompleteDataProvider:NSObject,UITableViewDataSource,UITableViewDelegate {
    weak var tableView:UITableView! {
        didSet {
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.tableFooterView = UIView()
            let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        }
    }
    internal var completeTasks = [TasksModel]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completeTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.statusView.backgroundColor = .green
        cell.processButton.isHidden = true
        cell.titleLabel.text = completeTasks[indexPath.row].title
        cell.descriptionLabel.attributedText = prepareAttributedTextString(indexPath.row)
        
        return cell
    }
    
    
    func prepareAttributedTextString(_ index: Int) -> NSMutableAttributedString {
        
        let paymentTypeString = "description: " + "\(self.completeTasks[index].desc ?? "")"
        
        let formattedString = NSMutableAttributedString(string: paymentTypeString)

        let ShamUseAttribute = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.gray,
        ] as [NSAttributedString.Key : Any]
        
        let descriptionRange = (paymentTypeString as NSString).range(of: "description:")

        formattedString.addAttributes(ShamUseAttribute, range: descriptionRange)
        
        return formattedString
    }

}
