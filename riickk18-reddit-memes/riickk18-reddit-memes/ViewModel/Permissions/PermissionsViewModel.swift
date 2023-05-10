//
//  PermissionsViewModel.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/10/23.
//

import AVFoundation
import SwiftUI

enum PermissionType {
    case camera, pushNotification, location
}

class PermissionsViewModel: ObservableObject {
    @Published var currentState: PermissionType {
        didSet {
            updateUIForCurrentState()
        }
    }
    @Published var image: String = ""
    @Published var title: String = ""
    @Published var subTitle: String = ""

    init(currentState: PermissionType = .camera) {
        self.currentState = currentState
        updateUIForCurrentState()
    }

    private func updateUIForCurrentState() {
        DispatchQueue.main.async { [unowned self] in
            switch currentState {
            case .camera:
                self.image = Asset.Assets.cameraAccess.name
                self.title = Strings.Camera.Permission.title
                self.subTitle = Strings.Camera.Permission.subtitle
            case .pushNotification:
                self.image = Asset.Assets.pushNotifications.name
                self.title = Strings.PushNotification.Permission.title
                self.subTitle = Strings.PushNotification.Permission.subtitle
            case .location:
                self.image = Asset.Assets.locationAccess.name
                self.title = Strings.Location.Permission.title
                self.subTitle = Strings.Location.Permission.subtitle
            }
        }
    }
    
    func principalButtonAction() {
        switch currentState {
        case .camera:
            verifyCameraPermission()
        case .pushNotification:
            verifyPushNotificationPermission()
        case .location:
            verifyLocationPermission()
        }
    }
    
    private func verifyCameraPermission() {
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
            DispatchQueue.main.async { [unowned self] in
                if response {
                    self.currentState = .pushNotification
                } else {
                    print("rejected")
                }
            }
        }
    }
    
    private func verifyPushNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            if let error = error {
                // Handle the error here.
            }
            
            DispatchQueue.main.async { [unowned self] in
                if granted {
                    self.currentState = .location
                } else {
                    print("not granted")
                }
            }
        }
    }
    
    private func verifyLocationPermission() {
        LocationManager.shared.requestLocationAuthorization()
    }
}
