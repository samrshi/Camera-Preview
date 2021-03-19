//
//  AlertView.swift
//  Camera-Preview
//
//  Created by Samuel Shi on 3/8/21.
//

import SwiftUI

struct CameraNameView: View {
  @ObservedObject var publisher: CameraPublisher
  @Binding var isPresented: Bool
  
  var body: some View {
    Text(publisher.currentCamera.rawValue)
      .bold()
      .foregroundColor(.white)
      .padding()
      .background(Capsule().fill(Color(.systemGray)).opacity(0.5))
      .offset(x: 0, y: isPresented ? 0 : -225)
      .padding(.top, publisher.isLandscape ? 5 : 0)
      .animation(.default)
  }
}

extension View {
  func cameraNameView(_ publisher: CameraPublisher, isPresented: Binding<Bool>) -> some View {
    ZStack(alignment: .top) {
      self
      
      CameraNameView(publisher: publisher, isPresented: isPresented)
    }
  }
}
