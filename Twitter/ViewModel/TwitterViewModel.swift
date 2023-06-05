//
//  ViewModel.swift
//  Twitter
//
//  Created by Lara K on 16/11/1444 AH.
//

import Foundation
//
//class TwitterViewModel {
//
//
//    func addNewComment() async {
//        let newComment = Comment(id: UUID().hashValue, body: "New todo")
//        comments.append(newComment)
//        await upsertOneTodo(comment: newComment)
//    }
//
//    func upsertOneTodo(comment: Comment) async {
//        isLoading = true
//        do {
//            try await Task.sleep(nanoseconds: 1_000_000_000)
//            let urlString = "https://jsonplaceholder.typicode.com/comments"
//            let request = try urlString.toRequest(withBody: comment, method: "PUT")
//            let result = try await callApi(request, to: DeleteCommentApiResponse.self)
//            comments = result.newComment
//        } catch {
//            print("Error: \(error)")
//        }
//        isLoading = false
//    }
//
//
//    func deleteOneTodo(commentId: Int) async {
//        isLoading = true
//        do {
//            try await Task.sleep(nanoseconds: 1_000_000_000)
//            let urlString = "https://jsonplaceholder.typicode.com/comments" + "commentId"
//            let request = try urlString.toDeleteRequest()
//            let result = try await callApi(request, to: DeleteCommentApiResponse.self)
//            comments = result.newComment
//            if !result.success {
//                alertMessage = result.message
//                isAlertShown = true
//            }
//
//        } catch {
//            print("Error: \(error)")
//        }
//        isLoading = false
//    }
//
//    func fetchTodos() async {
//        isLoading = true
//        do {
//            try await Task.sleep(nanoseconds: 1_000_000_000)
//            let urlString = "https://jsonplaceholder.typicode.com/comments"
//            let request = try urlString.toRequest()
//            let apiComments = try await callApi(request, to: [Comment].self)
//            comments = apiComments
//        } catch {
//            print("Error: \(error)")
//        }
//        isLoading = false
//    }
//
//}
