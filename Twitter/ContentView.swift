//
//  ContentView.swift
//  Twitter
//
//  Created by Lara K on 15/11/1444 AH.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            TabBarView()
                .navigationBarTitle("", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(uiImage: sampleUser.profileImage)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Image("twitterLogo")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "star")
                            .foregroundColor(.primary)
                    }
                }
        }
        .navigationViewStyle(DefaultNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
