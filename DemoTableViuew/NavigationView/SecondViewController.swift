//
//  SecondViewController.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 04/06/2021.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "SecondViewController"
        
        
    }
    
    
    @IBAction func btnBack(_ sender: Any) {
        //        self.navigationController?.popViewController(animated: true)
        //        self.navigationController?.popToRootViewController(animated: true)
        
        if let navController = self.navigationController, navController.viewControllers.count >= 2 {
             let viewController = navController.viewControllers[1]
            self.navigationController?.popToViewController(viewController, animated: true)
        }
    }
    

}
