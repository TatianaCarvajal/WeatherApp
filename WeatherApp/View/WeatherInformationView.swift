//
//  WeatherInformationView.swift
//  WeatherApp
//
//  Created by Tatiana Carvajal on 15/05/24.
//

import SwiftUI

struct WeatherInformationView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Weather now")
                .bold()
                .font(.system(size: 20))
            
            HStack {
                WeatherInformationItemView()
                Spacer()
                WeatherInformationItemView()
            }
            HStack {
                WeatherInformationItemView()
                Spacer()
                WeatherInformationItemView()
            }
        }
        .padding()
        .padding(.bottom)
        .background(.white)
        .cornerRadius(20)
    }
}

#Preview {
    WeatherInformationView()
}
