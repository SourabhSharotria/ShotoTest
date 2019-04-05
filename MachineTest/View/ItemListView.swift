//
//  ItemListView.swift
//  MachineTest
//
//  Created by Sourabh Sharotri  on 05/04/19.
//  Copyright © 2019 mac min . All rights reserved.
//

import UIKit
protocol ItemListViewDelegate:class {
    func itemListViewDidFetchData(_ view: ItemListView, offset:Int)
}

class ItemListView: UIView {
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    var itemArry = [UserDataModel]()
    var hasMore = true
    var isLoading = false
    weak var delegate:ItemListViewDelegate?
    
    override func awakeFromNib() {
        self.registerCell()
    }
    
    func updateItemList(data:InnerDataModel) {
        isLoading = false
        itemArry.append(contentsOf: data.users!)
        hasMore = data.has_more!
        DispatchQueue.main.sync {
            self.itemCollectionView.reloadData()
        }
    }
    
    private func registerCell(){
        let nibHeader:UINib = UINib(nibName: "HeaderCell", bundle: nil)
        let nibFooter:UINib = UINib(nibName: "FooterCell", bundle: nil)
        self.itemCollectionView.register(nibHeader, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerCell")
        self.itemCollectionView.register(nibFooter, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footerCell")
    }
}
