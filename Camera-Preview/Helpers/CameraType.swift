//
//  CameraType.swift
//  CameraApp
//
//  Created by Samuel Shi on 3/8/21.
//

import Foundation

enum CameraType: String, Identifiable {
  var id: String { rawValue }
  
  case front = "Front-Facing Camera"
  case back = "Back-Facing Camera"
  case wide = "Ultrawide Camera"
}
