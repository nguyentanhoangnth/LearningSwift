//
//  TopViewController.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 11/06/2021.
//

import UIKit

class TopViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    var arr : [UIViewController] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLayout()
    }
    
    func initLayout() {
        let home = UIViewController()
        let setting = UIViewController()
        let news = UIViewController()
        
        scrollView.contentSize = CGSize.init(width: self.view.width * 3, height: self.view.height - 40)
        scrollView.isScrollEnabled = false
        scrollView.isPagingEnabled = true
        
        for i in 0...2 {
            scrollView.addSubview( arr[i].view)
            arr[i].view.frame =  CGRect.init(x: self.view.width * CGFloat(i), y: 0, width: self.view.width, height: self.view.height - 40)
        }
        
        home.view.backgroundColor = .red
        setting.view.backgroundColor = .yellow
        news.view.backgroundColor = . purple
    }
    
    
    @IBAction func homeAction(_ sender: Any) {
        scrollView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: true)
    }
    
    @IBAction func settingAction(_ sender: Any) {
        scrollView.setContentOffset(CGPoint.init(x: self.view.width, y: 0), animated: true)
    }
    
    @IBAction func newsAction(_ sender: Any) {
        scrollView.setContentOffset(CGPoint.init(x: self.view.width * 2, y: 0), animated: true)
        
    }
}
