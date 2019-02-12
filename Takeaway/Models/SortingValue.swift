//
//	SortingValue.swift
//
//	Create by Ahmed Tawfik on 11/2/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct SortingValue : Codable {

	let averageProductPrice : Int?
	let bestMatch : Float?
	let deliveryCosts : Int?
	let distance : Int?
	let minCost : Int?
	let newest : Float?
	let popularity : Float?
	let ratingAverage : Float?


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
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		averageProductPrice = try values.decodeIfPresent(Int.self, forKey: .averageProductPrice)
		bestMatch = try values.decodeIfPresent(Float.self, forKey: .bestMatch)
		deliveryCosts = try values.decodeIfPresent(Int.self, forKey: .deliveryCosts)
		distance = try values.decodeIfPresent(Int.self, forKey: .distance)
		minCost = try values.decodeIfPresent(Int.self, forKey: .minCost)
		newest = try values.decodeIfPresent(Float.self, forKey: .newest)
		popularity = try values.decodeIfPresent(Float.self, forKey: .popularity)
		ratingAverage = try values.decodeIfPresent(Float.self, forKey: .ratingAverage)
	}


}