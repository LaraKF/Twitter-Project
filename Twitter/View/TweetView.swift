//
//  TweetView.swift
//  Twitter
//
//  Created by Lara K on 15/11/1444 AH.
//

import SwiftUI

struct TweetView: View {
    let tweet: Tweet
    
    var body: some View {
        HStack(alignment: .top) {
            
            Image(uiImage: tweet.user.profileImage)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                
            VStack(alignment: .leading, spacing: 10) {

                HStack(alignment: .top) {
                    Text(tweet.user.displayName)
                        .fontWeight(.bold)
                    
                    HStack {
                        Text(tweet.user.username)
                        Text("-")
                        Text(tweet.postedAt)
                        Spacer()
                        Button {

                        } label: {
                            Image(systemName: "ellipsis")
                        }
                    }
                    .foregroundColor(.gray)
                }
                

                VStack(alignment: .leading) {
                    Text(tweet.message)

                }


                HStack(alignment: .bottom) {
                    
                    Button {
                    } label: {
                        
                        HStack {
                            Image(systemName: "chart.bar.xaxis")
                            Text(tweet.statsCount)
                        }
                    }

                    Spacer()
                    
                    Button {

                    } label: {
                        HStack {
                            Image(systemName: "bubble.left")
                            Text(tweet.commentsCount)
                        }
                    }

                    Spacer()
                    

                    Button {

                    } label: {
                        HStack {
                            Image(systemName: "arrow.2.squarepath")
                            Text(tweet.retweetCount)
                        }
                    }
                    
                    Spacer()
                    
                    Button {

                    } label: {
                        HStack {
                            Image(systemName: "heart")
                            Text(tweet.likesCount)
                        }
                    }
                    
                    Spacer()
                    
                    Button {

                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
                .font(.system(size: 14))
                .foregroundColor(.black.opacity(0.6))
            }
        }
        .padding()
    }
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        TweetView(tweet: sampleTweet)
    }
}
