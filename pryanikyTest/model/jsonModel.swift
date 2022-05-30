//
//  jsonModel.swift
//  pryanikyTest
//
//  Created by Илья Новиков on 27.05.2022.
//

import Foundation

struct JsonModel: Codable {
    let data: [secondData]
    var view: [String]
}

public struct secondData: Codable {
    let name: String
    let data: DataClass
}

struct DataClass: Codable {
    let text: String?
    let url: String?
    let selectedID: Int?
    let variants: [Variant]?
}

public struct Variant: Codable {
    let id: Int
    let text: String
}

