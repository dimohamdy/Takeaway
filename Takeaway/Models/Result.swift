//
//	Result.swift
//
//	Create by Ahmed Tawfik on 11/2/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Result : Decodable {

	let restaurants : [Restaurant]?


	enum CodingKeys: String, CodingKey {
		case restaurants = "restaurants"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		restaurants = try values.decodeIfPresent([Restaurant].self, forKey: .restaurants)
	}


}
