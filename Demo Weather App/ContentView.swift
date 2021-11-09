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
//            LinearGradient(gradient: [Color.blue, Color.white], startPoint: .top, endPoint: .bottom)
            LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
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
