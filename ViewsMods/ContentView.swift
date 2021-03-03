//
//  ContentView.swift
//  ViewsMods
//
//  Created by student on 3/3/21.
//  Copyright © 2021 IN185 BS. All rights reserved.
//

import SwiftUI

struct CapsuleText: View {
    var givenText: String
    
    var body: some View {
        Text(givenText)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(20)
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.yellow)
            .clipShape(RoundedRectangle(cornerRadius: 50))
    }
}
// changing ".modifier(Title())" to ".titleStyle()"
extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}


// Creating custom container
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }// END-OF-HSTACK FOREACH
            }// END-OF-FOREACH
        }// END-OF-STACK
    }// END-OF-SOME VIEW
}// END-OF-STRUCT


struct ContentView: View {
    @State private var useRedText = false
    @State private var blurAmount: CGFloat = 0
    
    var motto1 = Text("Carpe Diem")
    
    var body: some View {
        VStack(spacing: 10){
            
            
            GridStack(rows: 3, columns: 3) {
                row, col in Text("R\(row), C\(col)  ")
            }
            
            CapsuleText(givenText: "Jared")
            
            motto1
                .titleStyle()
            
            Button("Hello World"){
                self.useRedText.toggle()
                self.blurAmount += 1
                
                if self.blurAmount > 5 {
                    self.blurAmount = 5
                }
            }
            .accentColor(.white)
            .padding()
            // ternary operator: a condensed if statement
            // test ? do this if true : do this if false
            .background(useRedText ? Color.red : Color.blue)
            .blur(radius: blurAmount)
        } //END-OF-VSTACK
        
//        Button("Hello Apple") {
//        }
//        .accentColor(Color.white)
//        .frame(width: 200, height: 100, alignment: .center)
//        .background(Color.green)
//        .frame(width: 250, height: 150, alignment: .center)
//        .background(Color.blue)
//        .cornerRadius(20)
        
        
//        Text("Views and Modifiers")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.red)
//            .edgesIgnoringSafeArea(.all)
        
        
    } //END-OF-SOMEVIEW
} //END-OF-CONTENTVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
