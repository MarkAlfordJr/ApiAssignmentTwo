//
//  UserInfoTableViewCell.swift
//  AssignmentTwo
//
//  Created by Mark Alford on 7/22/21.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {

    //setup the UI elements
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var address: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
