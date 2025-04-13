//
//  ContentView.swift
//  firstWeatherApp
//
//  Created by Nikhil Bajpai on 13/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNightModeOn: Bool = false
    
    var body: some View {
        ZStack{
            BackGroundView(isNight: isNightModeOn)
            VStack{
                CityTextView(cityName: "Mumbai , India")
            
                MainWeatherStatusView(imageName: isNightModeOn ? "moon.stars.fill"
                                      : "cloud.sun.fill", temperature: isNightModeOn ? -20: 24)
                
                HStack(spacing:20){
                    
                    WeatherDayView(
                        dayOFWeek: "Tue",
                        imageName: "cloud.sun.fill",
                        temperature: 24)
                    WeatherDayView(
                        dayOFWeek: "Wed",
                        imageName: "cloud.sun.fill",
                        temperature: 24)
                    WeatherDayView(
                        dayOFWeek: "Thus",
                        imageName: "cloud.sun.fill",
                        temperature: 24)
                    WeatherDayView(
                        dayOFWeek: "Fri",
                        imageName: "cloud.sun.fill",
                        temperature: 24)
                    WeatherDayView(
                        dayOFWeek: "Sat",
                        imageName: "cloud.sun.fill",
                        temperature: 24)
                    
                }
                Spacer()
                
                Button{
                    print("tapped")
                    isNightModeOn.toggle()
                } label: {
                    WeatherButton(title: "Change day time",
                                  textColor: .blue,
                                  backgorundColor: .white)
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
    var dayOFWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOFWeek)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
            
            Text("\(temperature)")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

struct BackGroundView: View {
//    let topColor : Color
//    let bottomColor : Color
    
    var isNight : Bool
    
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue
//                                                   ,isNight ? .gray :  Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .edgesIgnoringSafeArea(.all)
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView : View {
    var cityName : String
    var body: some View {
        Text(cityName)
            .font(.system(size: 36, weight: .bold))
            .foregroundColor(.white)
    }
}

struct MainWeatherStatusView: View {
    
    var imageName : String
    var temperature : Int
    
    var body : some View {
        VStack(spacing:8){
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
//                .foregroundStyle(.pink,.orange,.green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
                .foregroundColor(.white)
            
            Text("\(temperature)°C")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
        }
        .padding(.bottom,40)
    }
}
