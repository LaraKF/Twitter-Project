//
//  TwitterModel.swift
//  Twitter
//
//  Created by Lara K on 16/11/1444 AH.
//

import Foundation

struct Comment: Identifiable, Codable {
    let id: Int
    let body: String
}


struct DeleteCommentApiResponse: Codable {
    let success: Bool
    let newComment: [Comment]
    let message: String
}
