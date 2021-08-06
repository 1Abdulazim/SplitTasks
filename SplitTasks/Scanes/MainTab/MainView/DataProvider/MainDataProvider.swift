//
//  MainDataProvider.swift
//  SplitTasks
//
//  Created by Abdulazim on 02/08/21.
//

import Foundation
import UIKit
protocol MainIxResponder:class {
    func deleteButtonActionTap(_ index: Int)
    func editTapped(_ index: Int)
    func processButtonTapped(_ index:Int)
}

final class HomeViewDataProvider:NSObject,UITableViewDataSource,UITableViewDelegate {
    weak var tableView:UITableView! {
        didSet {
            self.tableView.dataSource = self
            self.tableView.delegate = self
            
            self.tableView.tableFooterView = UIView()
            
            let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        }
    }
    internal var tasks = [TasksModel]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    weak var ixResponder: MainIxResponder?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        let params = tasks[indexPath.row]
        cell.titleLabel.text = params.title
        cell.descriptionLabel.attributedText = prepareAttributedTextString(indexPath.row)
        cell.selectionStyle = .none
        cell.deleteButton.tag = indexPath.row
        cell.processButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(deleteButtonAction(_:)), for: .touchUpInside)
        cell.processButton.addTarget(self, action: #selector(processButtonAction(_:)), for: .touchUpInside)
        if tasks[indexPath.row].status == "0" {
            cell.statusView.backgroundColor = .red
        } else if tasks[indexPath.row].status == "1" {
            cell.processButton.isHidden = true
            cell.statusView.backgroundColor = .orange
        } else {
            cell.processButton.isHidden = true
            cell.statusView.backgroundColor = .green
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.ixResponder?.editTapped(indexPath.row)
    }
    
    @objc func deleteButtonAction(_ sender:UIButton) {
        self.ixResponder?.deleteButtonActionTap(sender.tag)
    }
    @objc func processButtonAction(_ sender:UIButton) {
        self.ixResponder?.processButtonTapped(sender.tag)
    }
    
    
    func prepareAttributedTextString(_ index: Int) -> NSMutableAttributedString {
        
        let paymentTypeString = "description: " + "\(self.tasks[index].desc ?? "")"
        
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
