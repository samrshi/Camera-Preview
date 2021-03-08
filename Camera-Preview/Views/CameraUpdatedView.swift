//
//  AlertView.swift
//  Camera-Preview
//
//  Created by Samuel Shi on 3/8/21.
//

import SwiftUI

extension View {
  func cameraUpdatedView(_ publisher: CameraPublisher, isPresented: Binding<Bool>) -> some View {
    ZStack(alignment: .top) {
      self
      
      CameraUpdatedView(publisher: publisher, isPresented: isPresented)
    }
  }
}

struct CameraUpdatedView: View {
  @ObservedObject var publisher: CameraPublisher
  @Binding var isPresented: Bool
  
  var body: some View {
    Text(publisher.currentCamera.rawValue)
      .bold()
      .foregroundColor(.white)
      .padding()
      .background(Color(UIColor.systemGray))
      .clipShape(Capsule())
      .opacity(0.5)
      .offset(x: 0, y: isPresented ? 0 : -225)
      .animation(.default)
      .padding(.top, publisher.isLandscape ? 5 : 0)
  }
}
