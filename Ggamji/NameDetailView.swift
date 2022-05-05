//
//  NameDetailView.swift
//  Ggamji
//
//  Created by Hyung Seo Han on 2022/05/05.
//

import SwiftUI

struct NameDetailView: View {
    
    let names : Entity
    let coreDM: CoreDataManager
    
    @State private var detailName: String = ""
    @Binding var needsRefresh : Bool
    
    var body: some View {
        VStack{
            TextField(names.name ?? "", text: $detailName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Update"){
                if !detailName.isEmpty{
                    names.name = detailName
                    coreDM.updateName()
                    needsRefresh.toggle()
                }
            }
        }
        
    }
}

struct NameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let name = Entity()
        let coreDM = CoreDataManager()
        NameDetailView(names: name, coreDM: coreDM,needsRefresh: .constant(false))
    }
}
