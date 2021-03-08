//
//  CameraController.swift
//  CameraApp
//
//  Created by Samuel Shi on 3/5/21.
//

import UIKit
import SwiftUI
import AVFoundation

class CameraVC: UIViewController {
  let captureSession = AVCaptureSession()
  var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
  
  var currentCamera: CameraType?
  var backFacingCamera: AVCaptureDevice?
  var frontFacingCamera: AVCaptureDevice?
  var ultraWideCamera: AVCaptureDevice?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    
    // Subscribe to deivce orientation change notifications
    let nc = NotificationCenter.default
    nc.addObserver(self, selector: #selector(deviceWasRotated), name: UIDevice.orientationDidChangeNotification, object: nil)
  }
  
  /// Retrieve camera devices and configure camera preview view
  private func configure() {
    // Get the front, back, and ultrawide cameras
    let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera, .builtInUltraWideCamera], mediaType: AVMediaType.video, position: .unspecified)
    
    // set variables to reference later
    for device in deviceDiscoverySession.devices {
      if device.deviceType == .builtInUltraWideCamera {
        ultraWideCamera = device
      } else if device.position == .back {
        backFacingCamera = device
      } else if device.position == .front {
        frontFacingCamera = device
      }
    }
    
    // set back camera as default
    updateCamera(to: .back)
    
    // Create and configure a camera preview
    cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
    view.layer.addSublayer(cameraPreviewLayer!)
    cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
    cameraPreviewLayer?.frame = view.layer.frame
    
    // Set preview orientation to match device orientation
    let deviceOrientation = UIDevice.current.avOrientation()
    cameraPreviewLayer?.connection?.videoOrientation = deviceOrientation ?? .portrait
    
    captureSession.startRunning()
  }
  
  /// Change the current camera device shown in the preview
  /// - Parameter newCamera: the new camera type
  func updateCamera(to newCamera: CameraType) {
    // Remove current inputs
    for input in self.captureSession.inputs {
      self.captureSession.removeInput(input)
    }
      
    // Pick the correct camera device
    let newDevice: AVCaptureDevice
    switch newCamera {
    case .back:
      newDevice = backFacingCamera!
    case .front:
      newDevice = frontFacingCamera!
    case .wide:
      newDevice = ultraWideCamera!
    }
    
    // update camera preview to use new device
    guard let input = try? AVCaptureDeviceInput(device: newDevice) else {
      return
    }
    self.captureSession.addInput(input)
    currentCamera = newCamera
  }
  
  
  /// Rotate the camera preview to match device orientation
  @objc func deviceWasRotated() {
    guard let orientation = UIDevice.current.avOrientation() else {
      return
    }
    cameraPreviewLayer?.connection?.videoOrientation = orientation
    cameraPreviewLayer?.frame = self.view.bounds
  }
}
