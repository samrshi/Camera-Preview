//
//  Helper+Orientation.swift
//  CameraApp
//
//  Created by Samuel Shi on 3/8/21.
//

import SwiftUI
import AVFoundation

extension UIDevice {
  /// Converts UIDeviceOrientation to AVCaptureVideoOrientation
  /// Landscape cases need to be reversed because UIDeviceOrientation has reversed left/right
  /// - Returns: the converted orientation
  func avOrientation() -> AVCaptureVideoOrientation? {
    switch orientation {
    case .portrait:         return .portrait
    case .landscapeLeft:    return .landscapeRight
    case .landscapeRight:   return .landscapeLeft
    default:                return nil
    }
  }
}
