//
//  WeatherInformationItemView.swift
//  WeatherApp
//
//  Created by Tatiana Carvajal on 15/05/24.
//

import SwiftUI

struct WeatherInformationItemView: View {
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "thermometer.medium")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(.black)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("name")
                    .font(.caption)
                Text("8º")
                    .font(.title)
                    .bold()
            }
        }
    }
}

#Preview {
    WeatherInformationItemView()
}
