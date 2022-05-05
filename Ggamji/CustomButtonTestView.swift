//
//  CustomButtonTestView.swift
//  Ggamji
//
//  Created by Hyung Seo Han on 2022/05/03.
//

import SwiftUI

struct CustomButtonTestView: View {
    @State private var button1 = false
    @State private var button2 = false
    @State private var button3 = false
    
    
    var body: some View {
        VStack(alignment : .leading){
            
            //first button
            Button(action: {}){
                Text("Button")
                    .padding()
            }
            .foregroundColor(button1 ? Color.black : Color.blue)
            /*
            .overlay(button1 ? (RoundedRectangle(cornerRadius: 30).fill(Color("SelectBorderColor"))) : (RoundedRectangle(cornerRadius: 30).fill(Color.white)))
            */
            
            .onTapGesture {
                self.button1.toggle()
                print("Button 1 State : " + String(button1))
            }
            
            
            
            
            
            //Test Button
            Button(action : {
                test()
            }){
                Text("shibal")
            }
        }
        
    }
    func test(){
        print(button1, button2, button3)
    }
}


struct CustomButtonTestView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonTestView()
    }
}

