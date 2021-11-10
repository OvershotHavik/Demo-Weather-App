//
//  ContentView.swift
//  Demo Weather App
//
//  Created by Steve Plavetzky on 11/9/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    @State private var weatherArray = [
        WeatherModel(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temp: 74),
        WeatherModel(dayOfWeek: "WED", imageName: "cloud.sun.rain.fill", temp: 78),
        WeatherModel(dayOfWeek: "THU", imageName: "wind", temp: 68),
        WeatherModel(dayOfWeek: "FRI", imageName: "sun.max.fill", temp: 80),
        WeatherModel(dayOfWeek: "SAT", imageName: "sun.max.fill", temp: 81),
        WeatherModel(dayOfWeek: "SUN", imageName: "cloud.sun.fill", temp: 74)
    ]
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            VStack{
                CityTextView(cityName: "Pittsburgh, PA")
                
                MainWeatherView(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill",
                                temp: isNight ? 55: 76)
                
                .padding(.bottom, 40)
                HStack(spacing: 15){
                    ForEach(weatherArray) { day in
                        WeatherDayView(dayOfWeek: day.dayOfWeek,
                                       imageName: day.imageName,
                                       temp: day.temp)
                    }
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Switch View Mode", textColor: .blue, backgroundColor: .white)
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
                //Different sf symbol color options:
            /*
                .symbolRenderingMode(.multicolor)
                .resizable()
              */
            /*
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .foregroundColor(.red)
*/
                .symbolRenderingMode(.palette)
                .resizable()
            //Any color changes have to be after resizable. If we put it before then it will no longer be an image, it will be a view.
                .foregroundStyle(.gray, .yellow, .pink)
                
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 28))
        }
        .foregroundColor(.white)
    }
}
//Color("lightBlue")
struct BackgroundView: View {
    var isNight: Bool

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue") ]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}
struct CityTextView: View{
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View{
    var imageName: String
    var temp: Int
    
    var body: some View{
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

