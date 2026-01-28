//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Bakhrom Usmanov on 17/01/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack(spacing: 32) {
                CityTextView(city: "Cupertino, CA")
                WeatherStatusView(
                    temperature: 76,
                    icon: isNight ? "moon.stars.fill" : "cloud.sun.fill"
                )
                HStack(spacing: 16) {
                    DayView(day: "MON", iconName: "cloud.sun.fill", temperature: 6)
                    DayView(day: "TUE", iconName: "sun.max.fill", temperature: 4)
                    DayView(day: "WED", iconName: "wind.snow", temperature: 0)
                    DayView(day: "THU", iconName: "cloud.snow.fill", temperature: -2)
                    DayView(day: "FRI", iconName: "cloud.rain.fill", temperature: -4)
                }
                Spacer()
                WeatherButton(
                    title: "Change Time of Day",
                    textColor: .blue,
                    backgroundColor: .white,
                    action: {
                        isNight.toggle()
                    }
                )
                Spacer()
            }
        }
    }
}

struct WeatherButton: View {
    let title: String
    let textColor: Color
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .padding()
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(textColor)
                .background(backgroundColor)
                .clipShape(.rect(cornerRadius: 12))
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
        LinearGradient(
            gradient: .init(
                colors: isNight
                ? [.black, .white]
                : [.blue, Color("lightBlue")]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea(.all)
    }
}

struct WeatherStatusView: View {
    let temperature: Int
    let icon: String
    
    var body: some View {
        VStack(spacing: 16) {
            WeatherImageView(
                name: icon,
                size: .init(width: 160, height: 160)
            )
            Text("\(temperature)°")
                .font(.system(size: 64, weight: .regular))
                .foregroundColor(.white)
        }
    }
}

struct CityTextView: View {
    let city: String
    
    var body: some View {
        Text(city)
            .font(.system(.title, weight: .semibold))
            .foregroundColor(.white)
            .padding(.top, 16)
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
