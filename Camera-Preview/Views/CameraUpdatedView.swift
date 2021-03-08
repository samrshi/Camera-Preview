//
//  AlertView.swift
//  Camera-Preview
//
//  Created by Samuel Shi on 3/8/21.
//

import SwiftUI

extension View {
  func cameraUpdateView(_ cameraType: Binding<CameraType>, showing: Binding<Bool>) -> some View {
    ZStack(alignment: .top) {
      self
      
      CameraUpdatedView(cameraType: cameraType, presented: showing)
    }
  }
}

struct CameraUpdatedView: View {
  @Binding var cameraType: CameraType
  @Binding var presented: Bool
  
  var body: some View {
    Text(cameraType.rawValue)
      .bold()
      .foregroundColor(.white)
      .padding()
      .background(Color(UIColor.systemGray))
      .clipShape(Capsule())
      .opacity(0.5)
      .offset(x: 0, y: presented ? 0 : -225)
      .animation(.default)
      .padding(.top, 10)
  }
}
