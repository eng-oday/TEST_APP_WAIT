//
//  mapViewController.swift
//  TestApp_WAIT
//
//  Created by Oday Dieg on 22/09/2022.
//

import UIKit
import MapKit
import CoreLocation

class mapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mpaView: MKMapView!
    
    
    let locationManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        
    }
    

    @IBAction func logoutBtnPressed(_ sender: Any) {
        UserAuthService.userData = nil
        Helper.restartApp()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
     {
         let location = locations.last! as CLLocation
         let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
         let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

         self.mpaView.setRegion(region, animated: true)
     }
    
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.denied) {
            locationManager.stopUpdatingLocation()
        } else if (status == CLAuthorizationStatus.authorizedAlways) {
            
        }
    }


}
