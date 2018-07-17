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
}

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var fio: UITextField!
    var taskArr = [Task]()
    var task: Task!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func createReport(_ sender: UIButton) {
        task = Task()
        task.name = fio.text ?? ""
        task.date = "\(Date())"
        taskArr.append(task!)
        creatCSV()
    }
    
    // MARK: CSV file creating
    func creatCSV() -> Void {
        let fileName = "Report.csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        var csvText = "Дата,ФИО\n"
        
        for task in taskArr {
            let newLine = "\(task.date),\(task.name)\n"
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


