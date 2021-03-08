//
//  CustomCameraControllerViewController.swift
//  CameraApp
//
//  Created by Samuel Shi on 3/5/21.
//

import SwiftUI

struct CameraWrapper: UIViewControllerRepresentable {
  @ObservedObject var publisher: CameraPublisher

  func makeUIViewController(context: Context) -> CameraVC {
    return CameraVC()
  }
  
  func updateUIViewController(_ uiViewController: CameraVC, context: Context) {
    uiViewController.updateCamera(to: publisher.currentCamera)
  }
}
