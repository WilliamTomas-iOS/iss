//
//  ServiceApi.swift
//  ISS
//
//  Created by William Tomas on 30/10/2019.
//  Copyright © 2019 William Tomas. All rights reserved.
//

import Foundation
import Moya

protocol ChargementDelegate {
    func chargementTermine()
}

public class ServiceApi {
    
    var delegate: ChargementDelegate?
    
    let provider = MoyaProvider<ISS>()
    
    let decoder = JSONDecoder()
    
    public func getElem() {
        provider.request(.position) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    self.setElem(moyaResponse.data)
                }
            case .failure(_):
                print("Erreur de contact API")
            }
        }
    }
    
    public func setElem(_ myData: Data) {
        let tmp = try! self.decoder.decode(Station.self, from: myData)
        StationHelpers.shared.add(tmp)
        if let delegateObject = delegate {
            delegateObject.chargementTermine()
        }
    }
}
