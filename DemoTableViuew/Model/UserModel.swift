//
//  UserModel.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 16/06/2021.
//

import Foundation
import Codextended


class BaseModel<T: Codable>: Codable {
    var message: String?
    var result: Bool?
    var data: T?
    
    required init(from decoder: Decoder) throws {
        message = try? decoder.decode("message")
        result = try? decoder.decode("result")
        data = try? decoder.decode("data")
    }
}


struct DataModel: Codable {
    var id: Int?
    var customer_type: Int?
    var name: String?
    var token: String?
    
    init(from decoder: Decoder) throws {
        id = try? decoder.decode("id")
        customer_type = try? decoder.decode("customer_type")
        name = try? decoder.decode("name")
        token = try? decoder.decode("token")
    }
}
