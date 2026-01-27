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
            Text("Cupertino, CA")
                .font(.system(.title, weight: .semibold))
                .foregroundColor(.white)
                .padding(.top, 16)
            VStack(spacing: 16) {
                WeatherImageView(
                    name: "cloud.sun.fill",
                    size: .init(width: 160, height: 160)
                )
                Text("76°")
                    .font(.system(size: 64, weight: .regular))
                    .foregroundColor(.white)
                forecastView
                    .padding(.top, 32)
                Spacer()
                weatherButton
            }
            Spacer()
        }
    }
    
    var weatherButton: some View {
        Button(
            action: {
                print("HELLO WORLD!")
            }
        ) {
            Text("Change Time of Day")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.blue)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12, style: .circular)
                .fill(Color.white)
        }
    }
    
    var forecastView: some View {
        HStack(spacing: 16) {
            DayView(day: "MON", iconName: "cloud.sun.fill", temperature: 6)
            DayView(day: "TUE", iconName: "sun.max.fill", temperature: 4)
            DayView(day: "WED", iconName: "wind.snow", temperature: 0)
            DayView(day: "THU", iconName: "cloud.snow.fill", temperature: -2)
            DayView(day: "FRI", iconName: "cloud.rain.fill", temperature: -4)
        }
    }
    
    var backgroundView: some View {
        LinearGradient(
            gradient: .init(colors: [.blue, Color("lightBlue")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea(.all)
    }
}

struct WeatherImageView: View {
    let name: String
    let size: CGSize
    
    var body: some View {
        Image(systemName: name)
            .symbolRenderingMode(.multicolor)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size.width, height: size.height)
    }
}

struct DayView: View {
    let day: String
    let iconName: String
    let temperature: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text(day)
                .font(.system(.title3, weight: .semibold))
                .foregroundColor(.white)
            VStack(spacing: 8) {
                WeatherImageView(
                    name: iconName,
                    size: .init(width: 40, height: 40)
                )
                Text("\(temperature)°")
                    .font(.system(size: 32, weight: .regular))
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ContentView()
}
