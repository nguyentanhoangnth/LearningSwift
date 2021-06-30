//
//  BaseViewController.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 26/06/2021.
//

import UIKit
import Network
import Reachability

class BaseViewController: UIViewController {
    
    let reachability = try! Reachability()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initMonitor()
    }
    
//    func initMonitor() {
//        monitor.pathUpdateHandler = { path in
//            if path.status == .satisfied {
//                print("We're connected!")
//            } else {
//                print("No connection.")
//            }
//
//            print(path.isExpensive)
//        }
//
//        let queue = DispatchQueue(label: "Monitor")
//        monitor.start(queue: queue)
//    }
    
    func initMonitor() {
        
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
        }
        reachability.whenUnreachable = { _ in
            print("Not reachable")
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
}
