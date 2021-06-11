//
//  CellView.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 07/06/2021.
//

import Foundation
import UIKit

class CellView: UIView {

  
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    
    let xibName = "CellView"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(xibName, owner: self, options: nil)
        contentView.fixInView(self)
        
    }
}
