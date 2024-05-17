//
//  WeatherInformationView.swift
//  WeatherApp
//
//  Created by Tatiana Carvajal on 15/05/24.
//

import SwiftUI

struct WeatherInformationView: View {
    var minTemperature: String
    var maxTemperature: String
    var pressure: String
    var humidity: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Weather now")
                .bold()
                .font(.system(size: 20))
            
            HStack {
                WeatherInformationItemView(title: "Temp min", imageName: "thermometer.low", information: minTemperature)
                Spacer()
                WeatherInformationItemView(title: "Temp max", imageName: "thermometer.high", information: maxTemperature)
            }
            HStack {
                WeatherInformationItemView(title: "Pressure", imageName: "gauge.medium", information: pressure)
                Spacer()
                WeatherInformationItemView(title: "Humidity", imageName: "humidity.fill", information: humidity)
            }
        }
        .padding()
        .padding(.bottom)
        .background(.white)
        .cornerRadius(20)
    }
}

#Preview {
    WeatherInformationView(
        minTemperature: "14",
        maxTemperature: "40",
        pressure: "60",
        humidity: "30"
    )
}
