//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Bakhrom Usmanov on 17/01/26.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: Subviews
    
    var body: some View {
        ZStack {
            backgroundView
            weatherView
        }
    }
    
    var weatherView: some View {
        VStack(
            alignment: .center,
            spacing: 32
        ) {
            locationTextView
            VStack(spacing: 16) {
                locationImageView
                degreeTextView
            }
            Spacer()
        }
    }
    
    var locationTextView: some View {
        Text("Cupertino, CA")
            .font(.system(.title, design: .monospaced, weight: .semibold))
            .foregroundColor(.white)
            .padding(.top, 16)
    }
    
    var locationImageView: some View {
        Image(systemName: "cloud.sun.fill")
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 140)
    }
    
    var degreeTextView: some View {
        Text("76°")
            .font(.system(size: 64, weight: .bold, design: .monospaced))
            .foregroundColor(.white)
    }
    
    var backgroundView: some View {
        LinearGradient(
            gradient: .init(colors: [.blue, .white]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
