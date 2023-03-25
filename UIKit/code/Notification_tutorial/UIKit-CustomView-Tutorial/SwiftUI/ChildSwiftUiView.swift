//
//  ChildSwiftUiView.swift
//  UIKit-CustomView-Tutorial
//
//  Created by Jeff Jeong on 2023/01/25.
//

import Foundation
import SwiftUI
import Combine

struct ChildSwiftUiView: View {
    
    @State var userInput: String = ""
    
    let titleText: String
    let placeholder: String
    
    var onBtnAClicked : (() -> Void)? = nil
    var onBtnBClicked : ((String) -> Void)? = nil
    var onUserInputChanged : ((String) -> Void)? = nil
    
    init(titleText: String,
         placeholder: String,
         userInput: String,
         onBtnAClicked : (() -> Void)? = nil,
         onBtnBClicked : ((String) -> Void)? = nil,
         onUserInputChanged : ((String) -> Void)? = nil
    ){
        self.titleText = titleText
        self.placeholder = placeholder
        self._userInput = State(initialValue: userInput)
        self.onBtnAClicked = onBtnAClicked
        self.onBtnBClicked = onBtnBClicked
        self.onUserInputChanged = onUserInputChanged
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(titleText)
            TextField(placeholder, text: $userInput)
                .textFieldStyle(.roundedBorder)
            HStack{
                Button(action: {
                    self.onBtnAClicked?()
                }, label: {
                    Text("버튼 A").frame(maxWidth: .infinity)
                }).buttonStyle(.borderedProminent)
                Button(action: {
                    self.onBtnBClicked?(userInput)
                }, label: {
                    Text("버튼 B").frame(maxWidth: .infinity)
                }).buttonStyle(.borderedProminent)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .background(Color.yellow)
        .onReceive(NotificationCenter.default.publisher(for: .sendInputEvent), perform: { noti in
            print(#fileID, #function, #line, "⭐️ - noti: \(noti)")
            guard let userInput : String = noti.userInfo?["userInput"] as? String else {
                return
            }
            self.userInput = userInput
        })
        .onChange(of: userInput, perform: { (changedInput : String) in
            self.onUserInputChanged?(changedInput)
        })
        
    }
    
}
//
//struct ChildSwiftUiView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChildSwiftUiView()
//            .previewLayout(.sizeThatFits)
//    }
//}
