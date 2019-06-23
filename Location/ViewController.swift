//
//  ViewController.swift
//  Location
//
//  Created by SWUCOMPUTER on 11/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var latitude: UILabel!
    @IBOutlet var latitudeAccuracy: UILabel!
    @IBOutlet var longitude: UILabel!
    @IBOutlet var longitudeAccuracy: UILabel!
    @IBOutlet var toggle: UISwitch!
    
    let locManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        if sender.isOn {
            self.locManager.startUpdatingLocation()
        }
            
        else {
            self.locManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 가장 최근의 위치 값
        let location: CLLocation = locations[locations.count-1]
        latitude.text = String(format: "%.6f", location.coordinate.latitude)
        latitudeAccuracy.text = String(format: "%.6f", location.horizontalAccuracy)
        longitude.text = String(format: "%.6f", location.coordinate.longitude)
        longitudeAccuracy.text = String(format: "%.6f", location.verticalAccuracy)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if CLLocationManager.locationServicesEnabled() {
            if CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .restricted {
                let alert = UIAlertController(title: "오류 발생",
                                              message: "위치서비스 기능이 꺼져있음", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                self.toggle.isOn = false }
            else {
                locManager.desiredAccuracy = kCLLocationAccuracyBest
                locManager.delegate = self
                locManager.requestWhenInUseAuthorization()
            } }
        else {
            let alert = UIAlertController(title: "오류 발생", message: "위치서비스 제공 불가",
                                          preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil) }
    }

}

