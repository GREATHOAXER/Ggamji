//
//  CoredataView.swift
//  Ggamji
//
//  Created by Hyung Seo Han on 2022/05/05.
//

import SwiftUI

struct CoredataView: View {
    let coreDM: CoreDataManager
    @State private var nameTest: String = ""
    @State private var needsRefresh: Bool = false
    @State private var names: [Entity] = [Entity]()
    @State private var test: String = ""
    private func populateNames(){
        names = coreDM.getAllNames()
    }
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Enter name",text: $nameTest)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save"){
                    coreDM.saveMode(name: nameTest)
                    self.populateNames()
                }
                
                List{
                    ForEach(names, id: \.self){name in
                        NavigationLink(
                            destination: NameDetailView(names: name, coreDM: coreDM, needsRefresh: self.$needsRefresh),
                            label: {
                                Text(name.name ?? "")
                            })
                    }.onDelete(perform: { indexSet in
                        indexSet.forEach{index in
                            let name = names[index]
                            // delete it using Core Data Manager
                            coreDM.deleteName(name: name)
                            populateNames()
                        }
                    })
                }.listStyle(PlainListStyle())
                    .accentColor(needsRefresh ? .blue : .white)
                
                
                Spacer()
            }
            .padding()
            .navigationTitle("Shibal")
            .onAppear(perform: {
                names = coreDM.getAllNames()
            })
        }
    }
}

struct CoredataView_Previews: PreviewProvider {
    static var previews: some View {
        CoredataView(coreDM: CoreDataManager() )
    }
}
