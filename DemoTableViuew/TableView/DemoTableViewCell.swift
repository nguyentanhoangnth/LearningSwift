//
//  DemoTableViewCell.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 07/06/2021.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellView: CellView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillData(item : Contact) {
        cellView.lblName.text = item.name
        cellView.lblPhone.text = "\(item.phone ?? 0)"
        
    }
    
}
