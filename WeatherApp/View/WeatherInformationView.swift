//
//  WeatherInformationView.swift
//  WeatherApp
//
//  Created by Tatiana Carvajal on 15/05/24.
//

import SwiftUI

struct WeatherInformationView: View {
    var body: some View {
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
}

#Preview {
    WeatherInformationView()
}
