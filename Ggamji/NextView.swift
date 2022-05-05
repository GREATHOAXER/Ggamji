//
//  NextView.swift
//  Ggamji
//
//  Created by Hyung Seo Han on 2022/05/04.
//

import SwiftUI

struct NextView: View {
    @Binding var button1 : Bool
    @Binding var button2 : Bool
    @Binding var button3 : Bool
    @State var imageView = false
    let columns = [
            GridItem(.adaptive(minimum: 100))
        ]
                                                     
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 20) {
                Image("GgamjiLogo")
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 0))
            
            VStack(alignment: .leading, spacing: 20){
                HStack(){
                    Button(action:{
                        imageView = false
                    }){
                        Image(!(imageView) ? "OnebyoneImageYes" : "OnebyoneImageNo")
                            
                    }
                    Button(action:{
                        imageView = true
                    }){
                        Image(imageView ? "GridImageYes" : "GridImageNo")
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .topTrailing)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
            
            VStack{
                ScrollView {
                    if(imageView == false){
                        VStack(spacing: 20) {
                            ForEach(0..<30) {
                                    Text("Item \($0)")
                                        .foregroundColor(.white)
                                        .font(.largeTitle)
                                        .frame(maxWidth: .infinity)
                                        .background(imageView ? Color.red : Color.blue)
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
                            .border(Color.black)
                            .frame(maxHeight:.infinity)
                        }
                    else{
                        LazyVGrid(columns: columns) {
                            ForEach(0..<100) {
                                    Text("Item \($0)")
                                        .foregroundColor(.white)
                                        .font(.largeTitle)
                                        .frame(maxWidth: .infinity, maxHeight: 500)
                                        .background(imageView ? Color.red : Color.blue)
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
                        .border(Color.pink)
                        .frame(maxHeight: .infinity)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
        .navigationBarHidden(true)
    }
}


/*
struct NextView_Previews: PreviewProvider {
    @State var button1 = true
    @State var button2 = false
    @State var button3 = true
    static var previews: some View {
        NextView()
    }
}
*/
