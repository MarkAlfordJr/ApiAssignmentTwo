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
        
        //switch to set width of content, depending on device
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
                // It's an iPhone
                address.widthAnchor.constraint(equalToConstant: 350).isActive = true
                fullName.widthAnchor.constraint(equalToConstant: 350).isActive = true
                fullName.sizeToFit()
                address.sizeToFit()
            case .pad:
                // It's an iPad (or macOS Catalyst)
                address.widthAnchor.constraint(equalToConstant: 700).isActive = true
                fullName.widthAnchor.constraint(equalToConstant: 700).isActive = true
                fullName.sizeToFit()
                address.sizeToFit()
        @unknown default:
                // Uh, oh! What could it be?
                print("Device Unknown")
            }
        
       

     
        
     
    }
    
}
