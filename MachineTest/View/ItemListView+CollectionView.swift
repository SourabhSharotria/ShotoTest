//
//  ItemListView.swift
//  MachineTest
//
//  Created by Sourabh Sharotri  on 05/04/19.
//  Copyright © 2019 mac min . All rights reserved.
//

import UIKit

extension ItemListView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return itemArry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (itemArry[section].items?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! ItemCollectionViewCell
        cell.updateCell(itemArry[indexPath.section].items![indexPath.row])
        if indexPath.section == (itemArry.count-1) && hasMore && !isLoading{
            isLoading = true
            self.delegate?.itemListViewDidFetchData(self, offset: itemArry.count)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (itemArry[indexPath.section].items?.count)! % 2 == 0 || indexPath.row > 0{
            let width = (collectionView.frame.size.width-21)/2
            return CGSize.init(width: width, height: width)
        }
        let width = (collectionView.frame.size.width-14)
        return CGSize.init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerCell", for: indexPath) as! HeaderCell
            headerView.updateCell(itemArry[indexPath.section])
            return headerView
        case UICollectionElementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footerCell", for: indexPath) as! FooterCell
            return footerView
        default:
            return UICollectionReusableView()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        return CGSize.init(width: collectionView.frame.size.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: collectionView.frame.size.width, height: 18)
    }
}
