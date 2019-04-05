//
//  ViewController.swift
//  MachineTest
//
//  Created by Sourabh Sharotri  on 05/04/19.
//  Copyright © 2019 mac min . All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    private var itemListView : ItemListView?
    private let serviceManager = ItemListViewControllerServiceManager()
    
    private var offset = 0
    private var limit = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serviceManager.delegate = self
        itemListView = self.view as? ItemListView
        itemListView?.delegate = self
        self.getAllUserList()
    }

    private func getAllUserList() {
        serviceManager.getItemListData(offset: offset, limit: limit)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ItemListViewController:ItemListViewDelegate {
    func itemListViewDidFetchData(_ view: ItemListView, offset:Int){
        self.offset = offset
        self.getAllUserList()
    }
}

extension ItemListViewController: ItemListViewControllerServiceManagerDelegate{
    func itemListViewControllerServiceManagerDelegate(serviceManger: ItemListViewControllerServiceManager, didFetchingData data: InnerDataModel?) {
        if let innerData = data{
            self.itemListView?.updateItemList(data: innerData)
        }
    }
}

