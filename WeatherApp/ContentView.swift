//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mosawer Mahboob on 11/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundColorView(isNight: isNight)
            
            VStack() {
                CityTextView(cityName: "Kabul, AF")
                
                MainWeatherStatusView(iconName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temprature: 12)
                
                HStack(spacing: 30) {
                    WeatherDayView(dayOfWeek: "TUE", iconName: "cloud.sun.fill", temprature: 10)
                    WeatherDayView(dayOfWeek: "WED", iconName: "sun.max.fill", temprature: 15)
                    WeatherDayView(dayOfWeek: "THU", iconName: "wind", temprature: 13)
                    WeatherDayView(dayOfWeek: "FRI", iconName: "sunset.fill", temprature: 17)
                    WeatherDayView(dayOfWeek: "SAT", iconName: "snow", temprature: -2)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(label: "Change Day Time",
                                  backgroundColor: .white,
                                  textColor: .blue)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    let dayOfWeek: String
    let iconName: String
    let temprature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: iconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temprature)°")
                .font(.system(size: 28, weight: .medium ))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundColorView: View {
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}


struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var iconName: String
    var temprature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: iconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temprature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
