//
//  MainPageView.swift
//  Twitter
//
//  Created by Lara K on 15/11/1444 AH.
//

import SwiftUI


struct MainPageView: View {
    @State var comments: [Comment] = []
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach((1...50), id: \.self) { _ in
                        TweetView(tweet: sampleTweet)
                        Divider()
                        
                    }
                }
            }
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
