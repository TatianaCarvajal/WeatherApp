//
//  WeatherInformationItemView.swift
//  WeatherApp
//
//  Created by Tatiana Carvajal on 15/05/24.
//

import SwiftUI

struct WeatherInformationItemView: View {
    var title: String
    var imageName: String
    var information: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(.black)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.system(size: 14))
                Text(information)
                    .font(.system(size: 26))
                    .bold()
            }
        }
    }
}

#Preview {
    WeatherInformationItemView(
        title: "Humedity",
        imageName: "thermometer.medium",
        information: "30"
    )
}
