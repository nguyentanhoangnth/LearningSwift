//
//  HandCodeScrollViewController.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 09/06/2021.
//

import UIKit

class HandCodeScrollViewController: UIViewController {
    
    var scrollView = UIScrollView()
    var btnDemo = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        initLayout()
    }
    
    
    func initLayout() {
        var pos: CGFloat = 0.0
        
        // ScrollView
        scrollView.frame = self.view.bounds
        scrollView.backgroundColor = .red
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        
        
        // Button
        btnDemo.width = 120
        btnDemo.height = 40
        btnDemo.setTitle("Demo", for: .normal)
        btnDemo.setTitleColor(.black, for: .normal)
        btnDemo.backgroundColor = .yellow
        scrollView.addSubview(btnDemo)
        btnDemo.top = 756
        btnDemo.left = self.view.width/2 - btnDemo.width/2;
        pos = btnDemo.bottom
        
        scrollView.contentSize = CGSize.init(width: self.view.width, height: pos + 50)
    }

}


extension HandCodeScrollViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
}
