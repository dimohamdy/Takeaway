//
//	SortingValue.swift
//
//	Create by Ahmed Tawfik on 11/2/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import RealmSwift

class SortingValue : Object,Decodable {

	@objc dynamic var averageProductPrice: Int = 0
	@objc dynamic var bestMatch: Float = 0.0
	@objc dynamic var deliveryCosts: Int = 0
	@objc dynamic var distance: Int = 0
	@objc dynamic var minCost: Int = 0
	@objc dynamic var newest: Float = 0.0
	@objc dynamic var popularity: Float = 0.0
	@objc dynamic var ratingAverage: Float = 0.0


	enum CodingKeys: String, CodingKey {
		case averageProductPrice = "averageProductPrice"
		case bestMatch = "bestMatch"
		case deliveryCosts = "deliveryCosts"
		case distance = "distance"
		case minCost = "minCost"
		case newest = "newest"
		case popularity = "popularity"
		case ratingAverage = "ratingAverage"
	}
    convenience required init(from decoder: Decoder) throws  {
        self.init()
		let values = try decoder.container(keyedBy: CodingKeys.self)
        averageProductPrice = try values.decodeIfPresent(Int.self, forKey: .averageProductPrice) ?? 0
		bestMatch = try values.decodeIfPresent(Float.self, forKey: .bestMatch) ?? 0.0
		deliveryCosts = try values.decodeIfPresent(Int.self, forKey: .deliveryCosts) ?? 0
		distance = try values.decodeIfPresent(Int.self, forKey: .distance) ?? 0
		minCost = try values.decodeIfPresent(Int.self, forKey: .minCost) ?? 0
		newest = try values.decodeIfPresent(Float.self, forKey: .newest) ?? 0.0
		popularity = try values.decodeIfPresent(Float.self, forKey: .popularity) ?? 0.0
		ratingAverage = try values.decodeIfPresent(Float.self, forKey: .ratingAverage) ?? 0.0
	}


}
