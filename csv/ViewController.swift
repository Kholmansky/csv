//
//  ViewController.swift
//  csv
//
//  Created by Maxim Kholmansky on 12/07/2018.
//  Copyright © 2018 Maxim Kholmansky. All rights reserved.
//

import UIKit
import MessageUI

class Task: NSObject {
    var date: String = ""
    var name: String = ""
    var startTime: String = ""
    var endTime: String = ""
}

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    var taskArr = [Task]()
    var task: Task!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func createReport(_ sender: UIButton) {
        task = Task()
        for _ in 0..<5 {
            task.name = "Raj"
            task.date = "\(Date())"
            task.startTime = "Start \(Date())"
            task.endTime = "End \(Date())"
            taskArr.append(task!)
        }
        creatCSV()
    }
    
    // MARK: CSV file creating
    func creatCSV() -> Void {
        let fileName = "Report.csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        var csvText = "Date,Task Name,Time Started,Time Ended\n"
        
        for task in taskArr {
            let newLine = "\(task.date),\(task.name),\(task.startTime),\(task.endTime)\n"
            csvText.append(newLine)
        }
        
        do {
            try csvText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Failed to create file")
            print("\(error)")
        }
        print(path ?? "not found")
    }
}


