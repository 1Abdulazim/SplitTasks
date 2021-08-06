//
//  ProcessDataProvider.swift
//  SplitTasks
//
//  Created by Abdulazim on 06/08/21.
//

import Foundation
import UIKit

protocol ProcessIxResponder:class {
    func doneButtonTapped(_ index:Int)
}
final class ProcessDataProvider:NSObject,UITableViewDataSource,UITableViewDelegate {
    weak var tableView:UITableView! {
        didSet {
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.tableFooterView = UIView()
            let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        }
    }
    internal var processTasks = [TasksModel]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    weak var ixResponder:ProcessIxResponder?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return processTasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.selectionStyle = .none
        cell.processButton.backgroundColor = .green
        cell.processButton.setTitle("Done", for: .normal)
        cell.processButton.tag = indexPath.row
        cell.processButton.addTarget(self, action: #selector(doneButtonPressed(_:)), for: .touchUpInside)
        cell.statusView.backgroundColor = UIColor.orange
        
        let params = processTasks[indexPath.row]
        cell.titleLabel.text = params.title
        cell.descriptionLabel.attributedText = prepareAttributedTextString(indexPath.row)

        
        return cell
    }
    
    @objc func doneButtonPressed(_ sender: UIButton) {
        self.ixResponder?.doneButtonTapped(sender.tag)
    }
    
    func prepareAttributedTextString(_ index: Int) -> NSMutableAttributedString {
        
        let paymentTypeString = "description: " + "\(self.processTasks[index].desc ?? "")"
        
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
