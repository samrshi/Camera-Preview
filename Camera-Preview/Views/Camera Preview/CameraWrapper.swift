//
//  CustomCameraControllerViewController.swift
//  CameraApp
//
//  Created by Samuel Shi on 3/5/21.
//

import SwiftUI

struct CameraWrapper: UIViewControllerRepresentable {
  @ObservedObject var publisher: CameraPublisher

  func makeUIViewController(context: Context) -> CameraViewController {
    return CameraViewController()
  }
  
  func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {
    uiViewController.updateCamera(to: publisher.currentCamera)
  }
}
