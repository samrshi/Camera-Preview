//
//  ContentView.swift
//  CameraApp
//
//  Created by Samuel Shi on 3/5/21.
//

import SwiftUI

struct ContentView: View {
  @StateObject var publisher = CameraPublisher()
  @State private var showing: Bool = false
  
  var isLandscape: Bool {
    !UIDevice.current.orientation.isPortrait
  }
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      CameraWrapper(publisher: publisher)
        .edgesIgnoringSafeArea(.all)
      
      ControlsView(publisher: publisher)
    }
    .onTapGesture(count: 2, perform: publisher.toggleWide)
    .statusBar(hidden: publisher.hideStatusBar)
    .cameraUpdateView($publisher.currentCamera, showing: $showing)
    .onChange(of: publisher.currentCamera) { _ in
      showing = true
      Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
        showing = false
      }
    }
  }
}
