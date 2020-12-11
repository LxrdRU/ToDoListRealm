//
//  AlertController.swift
//  RealmApp
//
//  Created by Andrey Markov on 2020-12-06.
//

import UIKit
class AlertController: UIAlertController {
    
    var doneButtonTitle = "Save"
    
    func action(with taskList: TaskList?,completion: @escaping (String) -> Void){
        
        if taskList != nil{
            doneButtonTitle = "Update"
        }
        let saveAction = UIAlertAction(title: doneButtonTitle, style: .default){_ in
            guard let newValue = self.textFields?.first?.text else{return}
            guard !newValue.isEmpty else {return}
            completion(newValue)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        addAction(saveAction)
        addAction(cancelAction)
        addTextField { (textField) in
            textField.placeholder = "List name"
            textField.text = taskList?.name
        }
    }
    func action(with task: Task?, completion: @escaping (String,String) -> Void){
        
        if task != nil{
            doneButtonTitle = "Update"
        }
        
        let saveAction = UIAlertAction(title: doneButtonTitle, style: .default){_ in
            guard let newTask = self.textFields?.first?.text else {return}
            guard !newTask.isEmpty else{return}
            
            if let note = self.textFields?.first?.text, !note.isEmpty {
                completion(newTask, note)
            }else{
                completion(newTask, "")
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        addAction(saveAction)
        addAction(cancelAction)
        
        addTextField { (textField) in
            textField.placeholder = "New Task"
            textField.text = task?.name
        }
        
        addTextField { (textField) in
            textField.placeholder = "Note"
            textField.text = task?.note
        }
    }
}
