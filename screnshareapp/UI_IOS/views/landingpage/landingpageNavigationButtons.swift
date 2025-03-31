//
//  landingpageNavigationButtons.swift
//  screnshareapp
//
//  Created by Leonard Wibowo on 3/31/25.
//

import SwiftUI

struct TabPreferenceData: Equatable {
    let index: Int
    let frame: CGRect
}

struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: [TabPreferenceData] = []
    
    static func reduce(value: inout [TabPreferenceData], nextValue: () -> [TabPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}

struct SimpleTabBar: View {
    let tabs: [String]
    @Binding var selectedIndex: Int
    @State private var tabFrames: [Int: CGRect] = [:]
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            HStack(spacing: 20) {
                ForEach(0..<tabs.count, id: \.self) { index in
                    Button {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selectedIndex = index
                        }
                    } label: {
                        Text(tabs[index])
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .fixedSize()
                            .background(
                                GeometryReader { geo in
                                    Color.clear
                                        .preference(key: TabPreferenceKey.self,
                                                    value: [TabPreferenceData(index: index,
                                                                              frame: geo.frame(in: .named("TabBar")))])
                                }
                            )
                            .padding(.vertical, 8)
                    }
                }
            }
            .padding(.horizontal, 20)
            
            if let frame = tabFrames[selectedIndex] {
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.white)
                    .frame(width: frame.width, height: 3)
                    .offset(x: frame.minX)
                    .animation(.easeInOut(duration: 0.3), value: selectedIndex)
            }
        }
        .coordinateSpace(name: "TabBar")
        .onPreferenceChange(TabPreferenceKey.self) { preferences in
            for pref in preferences {
                tabFrames[pref.index] = pref.frame
            }
        }
    }
}

struct AppMainNavigation: View {
    @Binding var selectedTab: Int
    let tabTitles = ["Home", "Following"] //If we need to reuse this just replace this with a state []
    
    var body: some View {
        SimpleTabBar(tabs: tabTitles, selectedIndex: $selectedTab)
    }
}
//Selected tab will be a range of numbers (depending on how much tabs there are)
//make a state var in the view youre using this and navigate with a checker if selectedtab == 1 { go to this view etc}

#Preview {
    ZStack {
        Background()
        AppMainNavigation(selectedTab: .constant(0)) // Slider wont work here
            
    }
}
