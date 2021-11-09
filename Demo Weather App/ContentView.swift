//
//  ContentView.swift
//  Demo Weather App
//
//  Created by Steve Plavetzky on 11/9/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 10){
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                HStack(spacing: 25){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temp: 74)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "cloud.sun.rain.fill",
                                   temp: 78)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind",
                                   temp: 68)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.fog.fill",
                                   temp: 65)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "sun.max.fill",
                                   temp: 80)
                }
                Spacer()
                Button {
                    print("tapped")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack{
            Text (dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 28))
        }
        .foregroundColor(.white)
    }
}
