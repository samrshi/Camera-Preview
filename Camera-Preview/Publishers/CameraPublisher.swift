//
//  CamearPublisher.swift
//  CameraApp
//
//  Created by Samuel Shi on 3/8/21.
//

import SwiftUI

class CameraPublisher: ObservableObject {
  @Published var currentCamera: CameraType = .front
  @Published var hideStatusBar: Bool = true
  @Published var isLandscape: Bool = false
  
  init() {
    let nc = NotificationCenter.default
    let name = UIDevice.orientationDidChangeNotification
    nc.addObserver(self, selector: #selector(didRotate), name: name, object: nil)
  }

  func toggleFrontBack() {
    if currentCamera == .wide || currentCamera == .back {
      currentCamera = .front
    } else {
      currentCamera = .back
    }
  }
  
  func toggleWide() {
    if currentCamera == .wide {
      currentCamera = .back
    } else {
      currentCamera = .wide
    }
  }
  
  func toggleStatusBar() {
    let orientation = UIDevice.current.orientation
    if orientation != .landscapeLeft && orientation != .landscapeRight {
      hideStatusBar.toggle()
    }
  }
  
  @objc func didRotate() {
    isLandscape = UIDevice.current.orientation.isLandscape
  }
}
