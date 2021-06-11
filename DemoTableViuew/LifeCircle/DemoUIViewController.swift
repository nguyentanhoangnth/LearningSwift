//
//  DemoUIViewController.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 02/06/2021.
//

import UIKit

class DemoUIViewController: UIViewController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        print("viewDidLoad ")
        self.navigationItem.title = "DemoUIViewController"
    }
    
    // Life circle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .red
        print("viewWillAppear ")
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor = .yellow
        print("viewDidAppear ")
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear ")
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear ")
    }
    
    @IBAction func btnPush(_ sender: Any) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "PushViewController") as! PushViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
