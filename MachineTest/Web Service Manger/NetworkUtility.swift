//
//  NetworkUtility.swift
//  MachineTest
//
//  Created by Sourabh Sharotri  on 05/04/19.
//  Copyright © 2019 mac min . All rights reserved.
//

import Foundation
import SystemConfiguration

class NetworkUtility
{
    var BaseUrl:String = "http://sd2-hiring.herokuapp.com/api/"
    
    static let shareInstance = NetworkUtility()
    private init(){}
    
    enum JSONError: String, Error{
        case NoData = "No data"
    }
    enum ReqestType:String{
        case post = "POST"
        case get = "GET"
    }
    
    func callData(requestType: ReqestType ,jsonInputData: Data?, path:String, completion: @escaping (_ result: Data) -> Void){
        if isInternetAvailable() {
            let urlPath = BaseUrl + path
            guard let endpoint = NSURL(string: urlPath)
                else {
                    Helper.showAlert(title: "Error", subtitle:"Error creating endpoint")
                    return
            }
            var request = URLRequest(url:endpoint as URL)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = requestType.rawValue
            if requestType == .post && jsonInputData != nil{
                request.httpBody = jsonInputData!
            }
            URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
                do{
                    guard let data = data else{
                        throw JSONError.NoData
                    }
                    completion(data)
                }
                catch let error as JSONError{
                    Helper.showAlert(title: "Error", subtitle: error.localizedDescription)
                    return
                }
                catch let error as NSError {
                    Helper.showAlert(title: "Error", subtitle: error.localizedDescription)
                    return
                }
                }.resume()
        }else{
            Helper.showAlert(title: "Error", subtitle: "Please check your internet connection")
            return
        }
    }
    private func isInternetAvailable() -> Bool{
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
}
