//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Tatiana Carvajal on 15/04/24.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel = WeatherViewModel(service: ServiceFacade())
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .blue, .white], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            if let weather = viewModel.weather {
                VStack {
                    VStack(spacing: 6) {
                        
                        Text(weather.name)
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text("Monday, Apr 15, 4:35pm")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                    }
                    .padding()
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .trim(from: 0.0, to: 0.62)
                            .foregroundColor(.white)
                            .opacity(0.3)
                            .frame(width: 342, height: 174, alignment: .bottom )
                        
                        
                        HStack (alignment: .bottom) {
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(weather.temperature)
                                    .font(.system(size: 64))
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(weather.latitude)
                                    Text(weather.longitude)
                                    
                                }
                                .font(.system(size: 20))
                            }
                            
                            Spacer()
                            
                            VStack (alignment: .trailing, spacing: 0) {
                                
                                switch weather.weatherType {
                                case .clouds:
                                    Image(systemName: "cloud.sun.fill")
                                        .renderingMode(.original)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .padding(.trailing, 20)
                                case .rain:
                                    Image(systemName: "cloud.rain.fill")
                                        .renderingMode(.original)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .padding(.trailing, 20)
                                case .clear:
                                    Image(systemName: "sun.max.fill")
                                        .renderingMode(.original)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .padding(.trailing, 20)
                                }
                                
                                Text(weather.weatherDescription)
                                    .font(.system(size: 18))
                                    .padding(.trailing, 26)
                            }
                        }
                        .foregroundColor(.black)
                        .padding(.leading, 26)
                    }
                    Spacer()
                    WeatherInformationView()
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchCityWeather()
            }
        }
    }
}

#Preview {
    WeatherView()
}
