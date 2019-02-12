//
//	Restaurant.swift
//
//	Create by Ahmed Tawfik on 11/2/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Restaurant : Codable {

	let name : String?
	let sortingValues : SortingValue?
	let status : String?
    var isFavorite : Bool?


	enum CodingKeys: String, CodingKey {
		case name = "name"
		case sortingValues
		case status = "status"
        case isFavorite = "isFavorite"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
        sortingValues = try values.decodeIfPresent(SortingValue.self, forKey: .sortingValues)
		status = try values.decodeIfPresent(String.self, forKey: .status)
        isFavorite = try values.decodeIfPresent(Bool.self, forKey: .isFavorite)
	}


}
