//
//  StoryboardTableViewCell.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 31/05/2021.
//

import UIKit

@objc protocol StoryboardTableViewCellDelegate { //1
    func showPopUp()
    @objc optional func demo()
}


class StoryboardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    
    var delegate: StoryboardTableViewCellDelegate? //2
    var index = 0
    
    // Closure
    var callbackIndex: ((_ ind: Int?, _ in: Int?) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillData(item: Contact) {
        lblName.text = item.name
        lblPhoneNumber.text = "\(item.phone ?? 0)"
    }
    
    
    @IBAction func didTapAction(_ sender: Any) {
        delegate?.showPopUp() //3
    }
    
    
    @IBAction func handleClosre(_ sender: Any) {
        if (callbackIndex != nil) {
            self.callbackIndex!(self.index, self.index)
        }
    }
    
}
