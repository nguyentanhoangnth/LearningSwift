//
//  StoryboardTableViewController.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 31/05/2021.
//

import UIKit

struct Contact {
    var name: String?
    var phone: Int?
    
    init(name: String?, phone: Int?) {
        self.name = name
        self.phone = phone
    }
}


class StoryboardTableViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
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
        self.navigationItem.title = "Storyboard TableView"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    // Show popup
    func showAlert() {
        let alert = UIAlertController.init(title: "Thong bao", message: "Demo Delegate", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            print("OK Pressed")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            print("Cancel Pressed")
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}


extension StoryboardTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = contactList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryboardTableViewCell", for: indexPath) as! StoryboardTableViewCell
        cell.fillData(item: item)
        cell.selectionStyle = .none
        cell.delegate = self //5
        cell.index = indexPath.row
        
        cell.callbackIndex = { (ind, indie) in
            print("\(ind ?? 0)")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexpath : ", indexPath.row)
    }
}

extension StoryboardTableViewController: StoryboardTableViewCellDelegate {
    
    //4
    func showPopUp() {
        self.showAlert()
    }
}



