//
//  SummaryViewController.swift
//  Trivia App
//
//  Created by Mohammad Yunus on 10/10/19.
//  Copyright © 2019 taptap. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
    
    let moc = AppDelegate.moc! // managedobjectcontext
    
    @IBOutlet weak var hello: UILabel!
    
    var name: String!
    
    var que: [String]!
    
    var an: [[String]]!
    
    @IBOutlet weak var summaryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hello.text = "hello \(name!)"
        summaryTable.dataSource = self
        summaryTable.delegate = self
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "save", style: .plain, target: self, action: #selector(saveit))
    }
    // save data to core data and pop to root view controller
    @objc func saveit(){
        let newu = User(context: moc)
        newu.gameNumber = 1
        newu.time = Date()
        newu.name = name
        newu.question = que
        newu.answers = an
        do{
            try moc.save()
        }catch{
            fatalError()
        }
        navigationController?.popToRootViewController(animated: true)
    }
}
// shows question and answer to those questino by the user as a summary in a table view
extension SummaryViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return que.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = summaryTable.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath)
        cell.textLabel?.text = que[indexPath.row]
        cell.detailTextLabel?.text = an[indexPath.row].joined(separator: ",")
        return cell
    }
    
    
}
