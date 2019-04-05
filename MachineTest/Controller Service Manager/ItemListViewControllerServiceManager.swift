//
//  ItemListViewControllerServiceManager.swift
//  MachineTest
//
//  Created by Sourabh Sharotri  on 05/04/19.
//  Copyright © 2019 mac min . All rights reserved.
//

import Foundation

protocol ItemListViewControllerServiceManagerDelegate : class{
    func itemListViewControllerServiceManagerDelegate(serviceManger: ItemListViewControllerServiceManager, didFetchingData data: InnerDataModel?)
}

class ItemListViewControllerServiceManager {
    weak var delegate: ItemListViewControllerServiceManagerDelegate?
     
    func getItemListData(offset:Int, limit:Int){
        NetworkUtility.shareInstance.callData(requestType: .get, jsonInputData: nil, path: "users?offset=\(offset)&limit=\(limit)") { (responseData) in
             
            do {
                let decoder = JSONDecoder()
                let dataModel = try decoder.decode(DataModel.self, from: responseData)
                self.delegate?.itemListViewControllerServiceManagerDelegate(serviceManger: self, didFetchingData: dataModel.data)
                
            } catch let err {
                print("Err", err)
            }
        }
    }
}
