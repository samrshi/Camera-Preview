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
}
