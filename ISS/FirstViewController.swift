//
//  FirstViewController.swift
//  ISS
//
//  Created by William Tomas on 29/10/2019.
//  Copyright © 2019 William Tomas. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController, ChargementDelegate{
    
    @IBOutlet weak var maCarte: MKMapView!

    let service = ServiceApi()
    
    let position = MKPointAnnotation()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if Storage.fileExists(Constants.UserDefaults.station, in: .documents) {
            let tmp = Storage.retrieve(Constants.UserDefaults.station, from: .documents, as: Station.self)
            let pin = CLLocationCoordinate2D(latitude: tmp.latitude, longitude: tmp.longitude)
            self.position.coordinate = pin
        }

        maCarte.addAnnotation(position)
        maCarte.camera.centerCoordinate = position.coordinate
        service.delegate = self
        _ = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(trouverStation(_:)), userInfo: nil, repeats: true)
    }
    
    @objc func trouverStation(_ sender: UIViewController) {
        service.getElem()
    }
    
    func chargementTermine() {
        let tmp = StationHelpers.shared.getPosition()
        Storage.store(tmp, to: .documents, as: Constants.UserDefaults.station)
        let pin = CLLocationCoordinate2D(latitude: tmp.latitude, longitude: tmp.longitude)
        UIView.animate(withDuration: 1.0, animations: {
            self.position.coordinate = pin
        })
        
    }


}

