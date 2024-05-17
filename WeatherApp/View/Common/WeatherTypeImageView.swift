//
//  WeatherTypeImageView.swift
//  WeatherApp
//
//  Created by Tatiana Carvajal on 17/05/24.
//

import SwiftUI

struct WeatherTypeImageView: View {
    var weatherImage: String
    
    var body: some View {
        Image(systemName: weatherImage)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
    }
}

#Preview {
    WeatherTypeImageView(weatherImage: "cloud.sun.fill")
}
