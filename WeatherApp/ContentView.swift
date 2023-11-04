//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mosawer Mahboob on 11/4/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundColorView(topColor: .blue, bottomColor: Color("lightBlue"))
            
            VStack() {
                CityTextView(cityName: "Kabul, AF")
                
                MainWeatherStatusView(iconName: "cloud.sun.fill", temprature: 12)
                
                HStack(spacing: 30) {
                    WeatherDayView(dayOfWeek: "TUE", iconName: "cloud.sun.fill", temprature: 10)
                    WeatherDayView(dayOfWeek: "WED", iconName: "sun.max.fill", temprature: 15)
                    WeatherDayView(dayOfWeek: "THU", iconName: "wind", temprature: 13)
                    WeatherDayView(dayOfWeek: "FRI", iconName: "sunset.fill", temprature: 17)
                    WeatherDayView(dayOfWeek: "SAT", iconName: "snow", temprature: -2)
                }
                
                Spacer()
                
                Button {
                    print("tapped")
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
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
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
