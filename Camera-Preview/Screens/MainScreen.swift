//
//  ContentView.swift
//  CameraApp
//
//  Created by Samuel Shi on 3/5/21.
//

import SwiftUI

struct MainScreen: View {
  @StateObject var publisher = CameraPublisher()
  @State private var showingCameraName: Bool = false
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      CameraWrapper(publisher: publisher)
        .edgesIgnoringSafeArea(.all)
      
      ControlsView(publisher: publisher)
    }
    .cameraNameView(publisher, isPresented: $showingCameraName)
    .onTapGesture(count: 2, perform: publisher.toggleWide)
    .onChange(of: publisher.currentCamera, perform: showCameraName)
    .statusBar(hidden: publisher.hideStatusBar)
  }
  
  func showCameraName<T>(_: T) where T: Equatable {
    showingCameraName = true
    Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
      showingCameraName = false
    }
  }
}
