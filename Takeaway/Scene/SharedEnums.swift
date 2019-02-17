//
//  SharedEnums.swift
//  Takeaway
//
//  Created by BinaryBoy on 2/17/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import Foundation
enum ResturantState: String {
    case closed = "closed"
    case canOrderAhead =  "order ahead"
    case open = "open"
    
    var value: Int {
        switch self {
        case .closed:
            return 0
        case .canOrderAhead:
            return 1
        case .open:
            return 2
        }
    }
}


enum SortOptions : Int {
    case bestMatch = 0
    case newest
    case ratingAverage
    case distance
    case popularity
    case averageProductPrice
    case deliveryCosts
    case minimumCost
    
    static var allCases: [String] {
        return ["Best match", "Newest",
                "Rating average", "Distance", "Popularity", "Average product price", "Delivery costs","Minimum cost"]
    }
}
