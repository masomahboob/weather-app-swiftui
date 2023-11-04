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
            LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                Text("Kabul, AF")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("12°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                
                
                HStack(spacing: 30) {
                    WeatherDayView(dayOfWeek: "TUE", iconName: "cloud.sun.fill", temprature: "10°")
                    WeatherDayView(dayOfWeek: "WED", iconName: "sun.max.fill", temprature: "15°")
                    WeatherDayView(dayOfWeek: "THU", iconName: "wind", temprature: "13°")
                    WeatherDayView(dayOfWeek: "FRI", iconName: "sunset.fill", temprature: "17°")
                    WeatherDayView(dayOfWeek: "SAT", iconName: "snow", temprature: "-2°")
                }
                
                Spacer()
                
                Button {
                    print("tapped")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10 )
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
    let temprature: String
    
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
            
            Text(temprature)
                .font(.system(size: 28, weight: .medium ))
                .foregroundColor(.white)
        }
    }
}
