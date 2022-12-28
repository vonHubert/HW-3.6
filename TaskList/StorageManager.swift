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
    private var taskList: [Task] = []
    private let viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
    
//    func save(_ taskName: String) {
//
//        let task = Task(context: viewContext)
//
//        task.title = taskName
//        taskList.append(task)
//
//        let cellIndex = IndexPath(row: taskList.count - 1, section: 0)
//        tableView.insertRows(at: [cellIndex], with: .automatic)
//
//        if viewContext.hasChanges {
//            do {
//                try viewContext.save()
//            } catch let error {
//                print(error)
//            }
//        }
//
//    }
}
