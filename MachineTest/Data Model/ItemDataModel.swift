//
//  ItemDataModel.swift
//  MachineTest
//
//  Created by Sourabh Sharotri on 05/04/19.
//  Copyright © 2019 mac min . All rights reserved.
//

import Foundation

struct DataModel: Codable {
    var data: InnerDataModel?
    var status: Bool?
}
struct InnerDataModel: Codable {
    var users: [UserDataModel]?
    var has_more: Bool?
}
struct UserDataModel: Codable {
    var name: String?
    var image: String?
    var items: [String]?
}
