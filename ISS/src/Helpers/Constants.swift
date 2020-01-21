//
//  Constants.swift
//  ISS
//
//  Created by William Tomas on 30/10/2019.
//  Copyright © 2019 William Tomas. All rights reserved.
//

import Foundation

public class Constants{
    struct Requete {
        static let BaseURL = "https://api.wheretheiss.at/v1/satellites/25544"
    }
    
    struct UserDefaults {
        static let notFirstLaunch = "not-first-launch"
        static let station = "previous-position"
    }
    
    struct stream {
        static let url = "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
    }
}
