//
//  LocationDetailsViewController.swift
//  Za Hunter
//
//  Created by Parker Wokwicz on 3/12/19.
//  Copyright © 2019 Parker Wokwicz. All rights reserved.
//

import UIKit
import MapKit
import SafariServices

class LocationDetailsViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var selectedMapItem = MKMapItem()

    @IBAction func onDirectionsButtonTapped(_ sender: UIButton) {
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
        MKMapItem.openMaps(with: [selectedMapItem], launchOptions: launchOptions)
    }
    
    @IBAction func onWebsiteButtonTapped(_ sender: Any) {
        if let url = selectedMapItem.url {
            present(SFSafariViewController(url: url), animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedMapItem.name!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = selectedMapItem.placemark.name
        var address = selectedMapItem.placemark.subThoroughfare! + ""
        address += selectedMapItem.placemark.thoroughfare! + "/n"
        address += selectedMapItem.placemark.locality! + ","
        address += selectedMapItem.placemark.administrativeArea! + ""
        address += selectedMapItem.placemark.postalCode!
    }
}
