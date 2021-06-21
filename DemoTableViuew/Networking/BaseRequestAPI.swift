//
//  BaseRequestAPI.swift
//  DemoTableViuew
//
//  Created by Hoang Nguyen on 21/06/2021.
//

import Foundation
import Alamofire
import NVActivityIndicatorView


typealias CompleteHandleJSONCode = (_ isSuccess: Bool, _ json: Any?, _ statusCode: Int?)->()

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

struct BaseRequestService {
    static let shared = BaseRequestService()
    
    
    func requestWith<T: Codable>(_ url: String,_ method: HTTPMethod, _ parameters: [String: Any]?,_ header: [String: String]?, objectType: T.Type,  encoding: ParameterEncoding, _ animated : Bool = true,_ complete: @escaping CompleteHandleJSONCode) {
        if !Connectivity.isConnectedToInternet() {
            print("!Connectivity.isConnectedToInternet")
            
            
            complete( false, nil, nil)
        } else {
            let manager = Alamofire.SessionManager.default
            var headers = header
            let token = Token()
            
            if token.tokenExists {
                headers = ["authorization": "Bearer \(token.token ?? "")",
                           "Content-Type": "application/json"]
            } else {
                headers = ["Content-Type": "application/json"]
            }
            
            if animated {
                DispatchQueue.main.async {
                    NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData(), nil)
                }
            }
            
            let (_url, _parameters) = self.generateUrl(url, method, parameters)
            
            manager.request(_url, method: method, parameters: _parameters, encoding: encoding, headers: headers).responseJSON(completionHandler: { (response) in
                print("URL: \(_url)")
                print("METHOD: \(method.rawValue)" )
                print("PRAM: \(_parameters ?? [:])")
                print("HEADER: \(headers ?? [:])")
                print("RESPONE: \(response.result.value ?? [:])")
                
                self.handleStatusCode(statusCode: response.response?.statusCode)
                switch response.result {
                case .success:
                    NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
                    guard let json = response.result.value as? [String : Any] else {
                        complete(false, nil, response.response?.statusCode)
                        return
                    }
                    if let model = json.toCodableObject() as T? {
                        if let _model = model as? BaseResponse {
                            complete(true, _model, response.response?.statusCode)
                        } else {
                            complete(true, model, response.response?.statusCode)
                        }
                        
                    } else {
                        complete(false, json, response.response?.statusCode)
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
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
