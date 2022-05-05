//
//  CoreDataManager.swift
//  Ggamji
//
//  Created by Hyung Seo Han on 2022/05/05.
//

import Foundation
import CoreData

class CoreDataManager{
    
    let persistentContainer: NSPersistentContainer
    
    init(){
        persistentContainer = NSPersistentContainer(name: "Images")
        persistentContainer.loadPersistentStores {(description, error) in
            if let error = error{
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    func updateName(){
        do{
            try persistentContainer.viewContext.save()
        }catch{
            print("Failed to save movie \(error)")
        }
    }
    
    func deleteName(name: Entity){
        persistentContainer.viewContext.delete(name)
        
        do{
            try persistentContainer.viewContext.save()
        }catch{
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error)")
        }
    }
    
    func getAllNames() -> [Entity] {
        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
        
        do{
            return try  persistentContainer.viewContext.fetch(fetchRequest)
        }catch{
            return []
        }
    }
    
    func saveMode(name: String){
        let object  = Entity(context: persistentContainer.viewContext)
        object.name = name
        object.id = UUID()
        
        do{
            try persistentContainer.viewContext.save()
        }catch{
            print("Failed to save movie \(error)")
        }
    }
    
}
