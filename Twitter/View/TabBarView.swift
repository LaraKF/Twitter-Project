//
//  TabBarView.swift
//  Twitter
//
//  Created by Lara K on 15/11/1444 AH.
//

import SwiftUI


struct TabBarView: View {
    var body: some View {
        TabView {

            MainPageView()
                .tabItem {
                    Image(systemName: "house")

                }
                
            
            TwitterView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }

            
            Text("")
                .tabItem {
                    Image(systemName: "person.2")
                        .environment(\.symbolVariants, .none)
                }
            
            Text("")
                .tabItem {
                    Image(systemName: "bell")
                        .environment(\.symbolVariants, .none)
                }
            
            Text("")
                .tabItem {
                    Image(systemName: "envelope")
                        .environment(\.symbolVariants, .none)
                }
        }
        .accentColor(.primary)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
