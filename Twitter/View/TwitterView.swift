//
//  TwitterView.swift
//  Twitter
//
//  Created by Lara K on 16/11/1444 AH.
//

import SwiftUI


struct TwitterView: View {
    @State var alertMessage = ""
    @State var isAlertShown = false
    @State var isLoading = true
    @State var comments: [Comment] = []
    

    func addNewComment() async {
        let newComment = Comment(id: UUID().hashValue, body: "New comment")
        comments.append(newComment)
        await upsertOneTodo(comment: newComment)
    }
    
    func upsertOneTodo(comment: Comment) async {
        isLoading = true
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            let urlString = "https://jsonplaceholder.typicode.com/comments"
            let request = try urlString.toRequest(withBody: comment, method: "PUT")
            let result = try await callApi(request, to: DeleteCommentApiResponse.self)
            comments = result.newComment
        } catch {
            print("Error: \(error)")
        }
        isLoading = false
    }
    
    
    func deleteOneTodo(commentId: Int) async {
        isLoading = true
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            let urlString = "https://jsonplaceholder.typicode.com/comments" + "commentId"
            let request = try urlString.toDeleteRequest()
            let result = try await callApi(request, to: DeleteCommentApiResponse.self)
            comments = result.newComment
            if !result.success {
                alertMessage = result.message
                isAlertShown = true
            }
            
        } catch {
            print("Error: \(error)")
        }
        isLoading = false
    }
 
    func fetchTodos() async {
        isLoading = true
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            let urlString = "https://jsonplaceholder.typicode.com/comments"
            let request = try urlString.toRequest()
            let apiComments = try await callApi(request, to: [Comment].self)
            comments = apiComments
        } catch {
            print("Error: \(error)")
        }
        isLoading = false
    }
    //*******
    var body: some View {
        VStack {
            HStack {
                Button("Add Comment") { Task { await addNewComment() } }
                    .bold()
                    .font(.system(size: 14))
                    .padding(.all, 8)
                    .frame(width: 120, height: 40)
                    .background(Color("TwitterBlue"))
                    .cornerRadius (8)
                    .cornerRadius (8)
                    .foregroundColor(Color.white)
                
                Button("Refresh") { Task { await fetchTodos()
                    } }
                .bold()
                .font(.system(size: 14))
                .padding(.all, 8)
                .frame(width: 120, height: 40)
                .background(Color("TwitterBlue"))
                .cornerRadius (8)
                .cornerRadius (8)
                .foregroundColor(Color.white)
            }
            
            
            if (isLoading) {
                ProgressView()
            }
                
            
            List {
                ForEach(comments) { comment in
                    CommentView(comment: comment, onTitleChange: { newComment in
                        guard let index = comments.firstIndex(where: { $0.id == comment.id }) else {
                            return
                        }
                        
                        let updatedComment = Comment(id: comment.id, body: newComment)
                        
                        comments[index] = updatedComment
                        Task {
                            await upsertOneTodo(comment: updatedComment)
                        }
                    }, onIsCheckedChange: { newCompleted in
                        guard let index = comments.firstIndex(where: { $0.id == comment.id }) else {
                            return
                        }
                        
                        let updatedComment = Comment(id: comment.id, body: comment.body)
                        
                        comments[index] = updatedComment
                        Task {
                            await upsertOneTodo(comment: updatedComment)
                        }
                    })
                }
                .onDelete { index in
                    let deletedCommentId = index.map { comments[$0].id }.first ?? 0
                    comments.remove(atOffsets: index)
                    Task {
                        await deleteOneTodo(commentId: deletedCommentId)
                    }
                }
            }
            .alert(alertMessage, isPresented: $isAlertShown, actions: {})
        }
        
        .task {
            await fetchTodos()
        }
    }
}

struct TwitterView_Previews: PreviewProvider {
    static var previews: some View {
        TwitterView()
    }
}



struct CommentView: View {
    let comment: Comment
    let onTitleChange: (String) -> Void
    let onIsCheckedChange: (Bool) -> Void
    @State var taskTitle = ""
    
    var body: some View  {
        HStack {
            TextField("", text: $taskTitle)
                .onChange(of: taskTitle) {
                    onTitleChange($0)
                }
            
            Spacer()
            

        }.onAppear {
            taskTitle = comment.body
        }
    }
}
