//
//  weatherButton.swift
//  firstWeatherApp
//
//  Created by Nikhil Bajpai on 14/04/25.
//
import SwiftUI
import Foundation


struct WeatherButton: View {
    
    var title: String
    var textColor : Color
    var backgorundColor : Color
    
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgorundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size : 20 , weight: .bold))
            .cornerRadius(10)
    }
}

