//
//  landingpage.swift
//  screnshareapp
//
//  Created by Leonard Wibowo on 3/30/25.
//

import SwiftUI

struct Homepage: View {
    @State var viewState: Int = 0
    let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {
        ZStack {
            Background()
            VStack(alignment: .leading) {
                HStack(alignment: .top, spacing: 0) {
                    homepageNavigation
                    Spacer()
                }
                Spacer()
            }.padding(20)
            
        }
    }
    private var homepageNavigation: some View {
        HStack(alignment: .top) {
            AppMainNavigation(selectedTab: $viewState)
            Spacer()
            signInButtonLandingPage()
            
        }
       
    }
    
    

    
}


#Preview {
    Homepage()
}
