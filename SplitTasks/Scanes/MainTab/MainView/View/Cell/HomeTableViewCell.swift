//
//  HomeTableViewCell.swift
//  testApp
//
//  Created by Abdulazim on 02/08/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var staticTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var processButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var statusView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.layer.cornerRadius = 5
    }
    
}
