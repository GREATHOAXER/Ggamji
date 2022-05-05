//
//  CustomButtonStyle.swift
//  Ggamji
//
//  Created by Hyung Seo Han on 2022/05/03.
//

import SwiftUI

struct CustomButtonStyle : ButtonStyle{
    
    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        CustomButtonStyleView(configuration: configuration)
    }
}

private extension CustomButtonStyle{
    struct CustomButtonStyleView: View{
        let configuration: ButtonStyle.Configuration
        @State var test = false
        
        var body : some View{
            return configuration.label
                .foregroundColor(Color.blue)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .onTapGesture {
                    self.test.toggle()
            }
        }
    }
}
