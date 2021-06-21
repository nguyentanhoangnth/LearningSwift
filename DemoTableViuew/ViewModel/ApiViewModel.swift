//
//  ApiViewModel.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 21/06/2021.
//

import Foundation
import Alamofire
import Codextended

class ApiViewModel: NSObject {
    let url = "http://a2b.vn/api/v1/user/login"
    let param = ["phone":"0123456781", "password":"123456"]
  
    func login() {
        BaseRequestService.shared.requestWith(url: url, method: .post, parameters: param, objectType: BaseModel<DataModel>.self, encoding: JSONEncoding.default) { success, response, code in
            
            guard let data = response else {
                print("Error")
                return
            }
            
            print("data" , data)
            
        }
    }
    
}
