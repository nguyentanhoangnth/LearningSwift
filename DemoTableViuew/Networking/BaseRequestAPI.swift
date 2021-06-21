//
//  BaseRequestAPI.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 21/06/2021.
//

import Foundation
import Alamofire
import NVActivityIndicatorView


typealias CompleteHandleJSONCode = (_ isSuccess: Bool, _ json: Any?, _ statusCode: Int?) -> ()

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

struct BaseRequestService {
    static let shared = BaseRequestService()
    
    func requestWith<T: Codable>(url: String, method: HTTPMethod, parameters: [String: Any]?, objectType: T.Type,  encoding: ParameterEncoding,_ complete: @escaping CompleteHandleJSONCode) {
        // show indicator
        if !Connectivity.isConnectedToInternet() {
            print("!Connectivity.isConnectedToInternet")
            // off
            complete( false, nil, nil)
            
        } else {
            let manager = Alamofire.SessionManager.default
            let headers = ["Content-Type": "application/json"]
            
            manager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON(completionHandler: { (response) in
                print("RESPONE: \(response.result.value ?? [:])")
                
                switch response.result {
                case .success:
                    guard let json = response.result.value as? [String : Any] else {
                        complete(false, nil, response.response?.statusCode)
                        return
                    }
                    
                    if let model = json.toCodableObject() as T? {
                        if let _model = model as? BaseResponse {
                            complete(true, _model, response.response?.statusCode)
                            
                        } else {
                            complete(false, json, response.response?.statusCode)
                        }
                        
                    } else {
                        complete(false, json, response.response?.statusCode)
                    }
                    
                case .failure(let error):
                    if let err = error as? URLError, err.code == .notConnectedToInternet {
                        print("notConnectedToInternet")
                    } else {
                        if error._code == NSURLErrorTimedOut {
                            print("NSURLErrorTimedOut")
                            complete(false, nil, response.response?.statusCode)
                            break
                        }
                    }
                    complete(false, nil, response.response?.statusCode)
                    break
                }
            })
        }
    }
}

extension Dictionary {
    func toCodableObject<T: Codable>() -> T? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            
            if let obj = try? decoder.decode(T.self, from: jsonData) {
                return obj
            }
            
            return nil
        }
        return nil
    }
}
