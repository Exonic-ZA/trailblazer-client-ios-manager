//
//  SettingsViewController.swift
//  TraccarClient
//
//  Created by Balleng on 2024/11/12.
//  Copyright © 2024 Traccar. All rights reserved.
//

import UIKit

protocol settingsDelegate {
    func updateIdentifier()
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var vehicleRegistration: UITextField!
    @IBOutlet weak var serverURLField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var cancelSettings: UIButton!
    @IBOutlet weak var saveSettings: UIButton!
    
    var vehicleIdentifier: String?
    var serverURL: String?
    var locationAccuracy: String?
    
    var settingsDelegate: settingsDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        saveSettings.layer.cornerRadius = 16
        
        vehicleRegistration.text = vehicleIdentifier!
        serverURLField.text = serverURL
        locationField.text = locationAccuracy?.capitalized
    }

    @IBAction func cancelSettings(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveSettings(_ sender: UIButton) {
        if let identifier = vehicleRegistration.text, vehicleRegistration.text != "" {
            saveUser(identifier)
            settingsDelegate.updateIdentifier()
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func saveUser(_ identifier: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(identifier, forKey: "device_id_preference")
        userDefaults.synchronize()
    }
}
