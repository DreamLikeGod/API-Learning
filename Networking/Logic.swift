//
//  Logic.swift
//  Networking
//
//  Created by Егор Ершов on 22.05.2022.
//

import Foundation

struct UrlNetworking : Decodable {
    var rawData: [Country]
}
struct Country : Decodable {
    let name: String
    let confirmed: String
    let deaths: String
    let lastUpdate: String
    var outConDeat: String {
        return "Confirmed: \(confirmed)\n Deaths: \(deaths)"
    }
    enum CodingKeys: String, CodingKey {
        case name = "Combined_Key"
        case confirmed = "Confirmed"
        case deaths = "Deaths"
        case lastUpdate = "Last_Update"
    }
}
