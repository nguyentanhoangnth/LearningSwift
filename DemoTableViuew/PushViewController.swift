//
//  PushViewController.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 04/06/2021.
//

import UIKit

class PushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "PushViewController"
    }
    
    
    @IBAction func btnBack(_ sender: Any) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
