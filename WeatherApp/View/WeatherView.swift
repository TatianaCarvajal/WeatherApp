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
            LinearGradient(
                colors: [.black, .blue, .white],
                startPoint: .topLeading,
                endPoint: .bottomLeading
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    TextField("Search a city", text: $viewModel.text)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .foregroundStyle(.white)
                        .cornerRadius(12)
                    
                    Button(action: {
                        Task {
                            await viewModel.fetchCityWeather()
                        }
                    }, label: {
                        Image(systemName: "magnifyingglass.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(Color.white)
                            .opacity(0.3)
                    })
                }
                .padding(.horizontal)
                
                Spacer()
                
                if viewModel.isLoading {
                    ProgressView()
                } else {
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
                                            WeatherTypeImageView(weatherImage: "cloud.fill")
                                        case .rain:
                                            WeatherTypeImageView(weatherImage: "cloud.rain.fill")
                                        case .clear:
                                            WeatherTypeImageView(weatherImage: "sun.max.fill")
                                        case .snow:
                                            WeatherTypeImageView(weatherImage: "cloud.snow.fill")
                                        case .drizzle:
                                            WeatherTypeImageView(weatherImage: "cloud.drizzle.fill")
                                        case .thunderstorm:
                                            WeatherTypeImageView(weatherImage: "cloud.bolt.rain.fill")
                                        case .mist, .fog:
                                            WeatherTypeImageView(weatherImage: "cloud.fog.fill")
                                        case .smoke:
                                            WeatherTypeImageView(weatherImage: "smoke.fill")
                                        case .haze:
                                            WeatherTypeImageView(weatherImage: "sun.haze.fill")
                                        case .dust, .sand:
                                            WeatherTypeImageView(weatherImage: "sun.dust.fill")
                                        case .squall:
                                            WeatherTypeImageView(weatherImage: "wind")
                                        case .tornado:
                                            WeatherTypeImageView(weatherImage: "tornado")
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
            }
        }
        .alert(isPresented: $viewModel.isShowingError, error: viewModel.error) { error in
            
        } message: { error in
            Text(error.failureReason ?? "")
        }
    }
}

#Preview {
    WeatherView()
}
