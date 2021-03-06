//
//	Restaurant.swift
//
//	Create by Ahmed Tawfik on 11/2/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import RealmSwift

class Restaurant : Object,Decodable {

	@objc dynamic var name : String? = ""
	@objc dynamic var sortingValues : SortingValue?
	@objc dynamic var status : String?  = ""
    @objc dynamic var isFavorite : Bool  = false
    var resturantState : ResturantState {
        return ResturantState(rawValue: status!) ?? .closed
    }


	enum CodingKeys: String, CodingKey {
		case name = "name"
		case sortingValues
		case status = "status"
        case isFavorite = "isFavorite"
	}
    convenience required init(from decoder: Decoder) throws  {
        self.init()
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
        sortingValues = try values.decodeIfPresent(SortingValue.self, forKey: .sortingValues)
		status = try values.decodeIfPresent(String.self, forKey: .status)
        isFavorite = try values.decodeIfPresent(Bool.self, forKey: .isFavorite) ?? false
	}

    override static func primaryKey() -> String? {
        return "name"
    }
}
