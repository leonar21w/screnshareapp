//
//  dark_background.swift
//  screnshareapp
//
//  Created by Leonard Wibowo on 3/30/25.
//



import SwiftUI

struct Background: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.black, Color.black.opacity(0.6)]),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea() // Ensures the background covers the entire screen.
    }
}
