//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Tatiana Carvajal on 15/04/24.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .blue, .white], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                VStack(spacing: 6) {
                    
                    Text("Medellin")
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
                            Text("40º")
                                .font(.system(size: 64))
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("H:20º  L:30º")
                                    .font(.system(size: 20))
                            }
                        }
                        
                        Spacer()
                        
                        VStack (alignment: .trailing, spacing: 0) {
                            
                            Image(systemName: "cloud.sun.fill")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .padding(.trailing, 20)
                            
                            Text("clear")
                                .font(.system(size: 18))
                                .padding(.trailing, 26)
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
    }
}

#Preview {
    WeatherView()
}
