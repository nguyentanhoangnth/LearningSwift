//
//  StoryboardTableViewCell.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 31/05/2021.
//

import UIKit

class StoryboardTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillData(item: Contact) {
        lblName.text = item.name
        lblPhoneNumber.text = "\(item.phone ?? 0)"
    }

}
