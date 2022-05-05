//
//  ContentView.swift
//  Ggamji
//
//  Created by Hyung Seo Han on 2022/04/29.
//

import SwiftUI

struct test: View {
    @State private var button1 = false
    @State private var button2 = false
    @State private var button3 = false
    @State var shouldHide = true
    
    var body: some View {
        
        NavigationView{
            VStack(spacing:50){
                //context part
                VStack(alignment: .leading,spacing: 10){
                    Text("보고싶은")
                    Text("강아지 사진의")
                        .foregroundColor(Color("GgamjiColor"))
                    Text("종류를 선택해주세요!")
                }.frame(maxWidth: 300, alignment: .leading)
                .font(.system(size: 27, weight: .bold, design: .rounded))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                //버튼 파트
                VStack(spacing: 25){
                    
                    //first button
                    Button(action: {
                        }){
                            Text("잠자는 모습")
                                .frame(width: 280, height: 60, alignment: .topLeading)
                                .font(.system(size: 24, weight: .semibold))
                                .padding()
                                .foregroundColor(button1 ? Color.white : Color.black)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                .background(button1 ? Color("GgamjiColor") : Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(button1 ? Color("GgamjiColor") : Color("SelectBorderColor"), lineWidth: 2)
                                )
                                .onTapGesture {
                                    button1.toggle()
                                    print("button 1")
                                    test()
                                }
                        }
                    
                    //second button
                    Button(action: {
                        }){
                            Text("혀내미는 모습")
                                .frame(width: 280, height: 60, alignment: .topLeading)
                                .font(.system(size: 24, weight: .semibold))
                                .padding()
                                .foregroundColor(button2 ? Color.white : Color.black)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                .background(button2 ? Color("GgamjiColor") : Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(button2 ? Color("GgamjiColor") : Color("SelectBorderColor"), lineWidth: 2)
                                )
                                .onTapGesture {
                                    button2.toggle()
                                    print("button 3")
                                    test()
                                }
                        }
                    
                    //thrid button
                    Button(action: {
                        }){
                            Text("평상시 모습")
                                .frame(width: 280, height: 60, alignment: .topLeading)
                                .font(.system(size: 24, weight: .semibold))
                                .padding()
                                .foregroundColor(button3 ? Color.white : Color.black)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                .background(button3 ? Color("GgamjiColor") : Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(button3 ? Color("GgamjiColor") : Color("SelectBorderColor"), lineWidth: 2)
                                )
                                .onTapGesture {
                                    button3.toggle()
                                    print("button 3")
                                    test()
                                }
                        }
                }.padding(EdgeInsets(top: 0, leading: 0 , bottom: 70, trailing: 0))
            
                //Finish Button
                NavigationLink(destination: NextView(button1: $button1, button2: $button2, button3: $button3))
                {
                    Text("Finish")
                        .frame(width: 180, height: 50, alignment: .center)
                        .font(.system(size:26, weight: .bold))
                        .foregroundColor(Color.white)
                        .background(Color("GgamjiColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                }.hiddenConditionally(isHidden: shouldHide)
            }
        }
    }
    
    //hiding finish button
    func test(){
        if button1 || button2 || button3{
            shouldHide = false
            print(shouldHide)
        }
        else{
            shouldHide = true
            print(shouldHide)
        }
    }
}

extension View{
    //Finish 버튼에 hidden 요소 부여하기
    func hiddenConditionally(isHidden: Bool) -> some View{
        isHidden ? AnyView(self.hidden()) : AnyView(self)
    }
}
struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}

