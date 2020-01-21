//
//  Api.swift
//  ISS
//
//  Created by William Tomas on 30/10/2019.
//  Copyright © 2019 William Tomas. All rights reserved.
//

import Foundation
import Moya

public enum ISS{
    case position
}

extension ISS: TargetType{
    public var path: String {
        return ""
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var baseURL: URL {
        return URL(string: Constants.Requete.BaseURL)!
    }
}
