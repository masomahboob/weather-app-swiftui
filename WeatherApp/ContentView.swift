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
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), 
                           startPoint: .topLeading, 
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
