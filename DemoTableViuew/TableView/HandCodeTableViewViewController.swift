//
//  TableViewController.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 31/05/2021.
//

import UIKit

class HandCodeTableViewViewController: UIViewController {
    
    
    
    let contactList: [Contact] = [Contact.init(name: "Ho Chi Minh", phone: 0973469177),
                                  Contact.init(name: "Ha Noi", phone: 0973469177),
                                  Contact.init(name: "Quang Ninh", phone: 0973469177),
                                  Contact.init(name: "Da Nang", phone: 0973469177),
                                  Contact.init(name: "Quang Ngai", phone: 0973469177),
                                  Contact.init(name: "Binh Dinh", phone: 0973469177),
                                  Contact.init(name: "Khanh Hoa", phone: 0973469177),
                                  Contact.init(name: "Binh Thuan", phone: 0973469177),
                                  Contact.init(name: "Vung Tau", phone: 0973469177),
                                  Contact.init(name: "Can Tho", phone: 0973469177)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initlayout()
    }
    
    func initlayout() {
        self.navigationItem.title = "TableView"
        
        let contactTableView = UITableView()
        contactTableView.frame = self.view.bounds
        self.view.addSubview(contactTableView)
        
        contactTableView.delegate = self
        contactTableView.dataSource = self
        contactTableView.register(UINib.init(nibName: "DemoTableViewCell", bundle: nil), forCellReuseIdentifier: "DemoTableViewCell")
        contactTableView.separatorStyle = .none
        
    }
}

extension HandCodeTableViewViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = contactList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        cell.fillData(item: item)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexpath : ", indexPath.row)
    }
}
