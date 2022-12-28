//
//  StorageManager.swift
//  TaskList
//
//  Created by MacBook Air 13 on 28.12.2022.
//

import Foundation
import CoreData
import UIKit

class StorageManager {
    static let shared = StorageManager()
    var taskList: [Task] = []
    let viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private init() {}
    
    func fetchData(from fetchRequest: NSFetchRequest<Task>) -> [Task] {
        let fetchRequest = Task.fetchRequest()
        
        do {
            taskList = try viewContext.fetch(fetchRequest)
        } catch let error {
            print("No fetch data", error)
        }
        return taskList
    }
    
    func save(task: Task) {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch let error {
                print(error)
            }
        }
    }
}
