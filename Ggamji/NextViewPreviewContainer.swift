//
//  NextViewPreviewContainer.swift
//  Ggamji
//
//  Created by Hyung Seo Han on 2022/05/04.
//

import SwiftUI

struct NextViewPreviewContainer: View {
    @State var btn1 = false
    @State var btn2 = true
    @State var btn3 = false
    
    var body: some View {
        NextView(button1: $btn1, button2: $btn2, button3: $btn3)
    }
}


struct NextViewPreviewContainer_Previews: PreviewProvider {
    static var previews: some View {
        NextViewPreviewContainer()
    }
}
