//
//  Data.swift
//  Twitter
//
//  Created by Lara K on 15/11/1444 AH.
//

import Foundation
import UIKit
import SwiftUI

let TwitterBlue = Color("TwitterBlue")

let sampleUser = User(username: "@lara", displayName: "لارا", profileImage: UIImage(named: "lara")!)

let sampleTweet = Tweet(user: sampleUser, message: "Good morning!", postedAt: "22h", statsCount: "25k", commentsCount: "11", retweetCount: "64", likesCount: "1k")
