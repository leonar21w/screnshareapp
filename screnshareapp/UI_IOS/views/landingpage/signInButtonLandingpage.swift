//
//  signInButton.swift
//  screnshareapp
//
//  Created by Leonard Wibowo on 3/31/25.
//

import SwiftUI

struct signInButtonLandingPage: View {
    let isIpad: Bool = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {
        NavigationLink {
            dummynode()
        }
        label : {
            Text("Sign In")
                .foregroundStyle(.white)
                .font(isIpad ? fontIpad : fontIphone)
                .padding(.vertical, 5)
                .padding(.horizontal, 20)
                .background(RoundedRectangle(cornerRadius: 20).fill(.clear).stroke(.white.opacity(0.7), lineWidth: 2.5))
                .padding(.vertical, 4)
        }
    }
}

#Preview {
    signInButtonLandingPage()
}
