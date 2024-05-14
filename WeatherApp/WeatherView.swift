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
            
            VStack {
                VStack(spacing: 6) {
                    if let name = viewModel.name {
                        Text(name)
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(.white)
                    }
                 
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
                            if let temperature = viewModel.temperature {
                                Text(temperature)
                                    .font(.system(size: 64))
                            }
                            
                            VStack(alignment: .leading, spacing: 2) {
                                if let lat = viewModel.lat, let lon = viewModel.lon {
                                    Text(lat)
                                    Text(lon)
                                }
                            }
                            .font(.system(size: 20))
                        }
                        
                        Spacer()
                        
                        VStack (alignment: .trailing, spacing: 0) {
                            if let weatherType = viewModel.weatherType {
                                switch weatherType {
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
                            }
                            if let weatherDescription = viewModel.weatherDescription {
                                Text(weatherDescription)
                                    .font(.system(size: 18))
                                    .padding(.trailing, 26)
                            }
                        }
                    }
                    .foregroundColor(.black)
                    .padding(.leading, 26)
                    
                }
                Spacer()
                
                VStack {
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Weather now")
                            .bold()
                            .font(.system(size: 20))
                            .padding(.bottom)
                        
                        HStack(spacing: 20) {
                            Image("thermometer.medium")
                                .resizable()
                                .background(.black)
                                .font(.title2)
                                .frame(width: 20, height: 20)
                                .padding()
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("name")
                                    .font(.caption)
                                Text("8º")
                                    .font(.title)
                                    .bold()
                            }
                            Spacer()
                            
                            Image("thermometer.medium")
                                .resizable()
                                .background(.black)
                                .font(.title2)
                                .frame(width: 20, height: 20)
                                .padding()
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("name")
                                    .font(.caption)
                                Text("8º")
                                    .font(.title)
                                    .bold()
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom)
                .background(.white)
                .cornerRadius(20)
            }
            .edgesIgnoringSafeArea(.bottom)
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
