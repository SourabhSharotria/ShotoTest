//
//  Utility.swift
//  MachineTest
//
//  Created by Sourabh Sharotri  on 05/04/19.
//  Copyright © 2019 mac min . All rights reserved.
//
import Foundation
import UIKit

class Helper{
    static func showAlert(title:String, subtitle:String){
        DispatchQueue.main.async(execute: {
            let alert = UIAlertController(title: title, message: subtitle, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window!.rootViewController?.present(alert, animated: true, completion: nil)
        })
    }
}
