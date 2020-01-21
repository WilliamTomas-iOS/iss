//
//  Station.swift
//  ISS
//
//  Created by William Tomas on 30/10/2019.
//  Copyright © 2019 William Tomas. All rights reserved.
//

import Foundation

struct Station: Codable {
    var latitude: Double
    var longitude: Double
}

class StationHelpers {
    static let shared = StationHelpers()
    
    private init(){}
    
    private(set) var positions: [Station] = []
    
    func add(_ station: Station) {
        positions.append(station)
    }
    
    func getPositions() -> [Station] {
        return positions
    }
    
    func getPosition() -> Station {
        return positions.last!
    }
}
