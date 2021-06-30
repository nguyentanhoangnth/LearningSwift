//
//  ViewController.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 31/05/2021.
//

import UIKit

class DashboardViewController: UIViewController {
    
    
    @IBOutlet weak var btnStoryboard: UIButton!
    
    let viewModel = ApiViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.login()
        
    }
    
    
    @IBAction func moveToStoryboardViewController(_ sender: Any) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "StoryboardTableViewController") as! StoryboardTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @IBAction func moveToTableViewController(_ sender: Any) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "TableViewController") as! HandCodeTableViewViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func moveToDemoUI(_ sender: Any) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "DemoUIViewController") as! DemoUIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func moveToScrollView(_ sender: Any) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "HandCodeScrollViewController") as! HandCodeScrollViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func moveToCollectionView(_ sender: Any) {
        let st = UIStoryboard.init(name: "Home", bundle: nil)
        let vc = st.instantiateViewController(identifier: "GalleryViewController") as! GalleryViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func moveToScrollViewController(_ sender: Any) {
        let st = UIStoryboard.init(name: "Home", bundle: nil)
        let vc = st.instantiateViewController(identifier: "TopViewController") as! TopViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func moveToDemoModel(_ sender: Any) {
        let st = UIStoryboard.init(name: "Home", bundle: nil)
        let vc = st.instantiateViewController(identifier: "DemoModelViewController") as! DemoModelViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func moveToCheckInternet(_ sender: Any) {
        let st = UIStoryboard.init(name: "Home", bundle: nil)
        let vc = st.instantiateViewController(identifier: "ManagerInternetViewController") as! ManagerInternetViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

