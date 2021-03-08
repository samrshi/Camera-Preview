//
//  ControlsView.swift
//  Camera-Preview
//
//  Created by Samuel Shi on 3/8/21.
//

import SwiftUI

struct ControlsView: View {
  @ObservedObject var publisher: CameraPublisher
  
  var body: some View {
    HStack {
      Button(action: publisher.toggleFrontBack) {
        Image(systemName: "arrow.clockwise")
          .padding(.horizontal, 10)
      }
      
      Button(action: publisher.toggleWide) {
        Image(systemName: "camera.metering.center.weighted.average")
          .padding(.horizontal, 10)
      }
    }
    .padding(.top, 10)
    .font(.title)
  }
}
