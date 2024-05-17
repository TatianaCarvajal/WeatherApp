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
                    Text(weather.name)
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 60)
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .trim(from: 0.0, to: 0.62)
                            .foregroundColor(.white)
                            .opacity(0.3)
                            .frame(width: 342, height: 174, alignment: .bottom)
                        
                        HStack(alignment: .bottom) {
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(weather.temperature)
                                    .font(.system(size: 64))
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(weather.latitude)
                                    Text(weather.longitude)
                                }
                                .font(.system(size: 20))
                            }
                            .padding(.horizontal)
                            
                            Spacer()
                            
                            VStack(spacing: 4) {
                                switch weather.weatherType {
                                case .clouds:
                                    WeatherTypeImageView(weatherImage: "cloud.sun.fill")
                                case .rain:
                                    WeatherTypeImageView(weatherImage: "cloud.rain.fill")
                                case .clear:
                                    WeatherTypeImageView(weatherImage: "sun.max.fill")
                                case .snow:
                                    WeatherTypeImageView(weatherImage: "cloud.snow.fill")
                                }
                                
                                Text(weather.weatherDescription)
                                    .font(.system(size: 16))
                            }
                            .padding(.trailing, 30)
                        }
                        .foregroundColor(.black)
                        .padding(.leading, 26)
                    }
                    Spacer()
                    WeatherInformationView(minTemperature: weather.minTemperature, maxTemperature: weather.maxTemperature, pressure: weather.pressure, humidity: weather.humidity)
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
