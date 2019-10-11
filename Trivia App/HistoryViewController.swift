//
//  HistoryViewController.swift
//  Trivia App
//
//  Created by Mohammad Yunus on 10/10/19.
//  Copyright © 2019 taptap. All rights reserved.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController {
    
    let moc = AppDelegate.moc!
    
    var frc: NSFetchedResultsController<User>!
    
    @IBOutlet weak var historyTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTable.delegate = self
        historyTable.dataSource = self
        fetchData()
        title = "History"
    }
    // it fetches the data from core data
    @objc func fetchData(){
        let fr = User.createFetchRequest()
        fr.sortDescriptors = [NSSortDescriptor(key: "time", ascending: false)]
        frc = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        do{
            try frc.performFetch()
        }catch{
            fatalError()
        }
        historyTable.reloadData()
    }

}

//showing the data fetched from core data
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frc.sections?[section].numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
        let obj = frc.object(at: indexPath)
        cell.gameAndTime.text = "Game \(obj.gameNumber): \(obj.time!.DateInString)"
        cell.name.text = "Name: \(obj.name!)"
        cell.questionOne.text = obj.question[0]
        cell.answerOne.text = "Answer: \(obj.answers[0].joined(separator: ","))"
        cell.questionTwo.text = obj.question[1]
        cell.answerTwo.text = "Answers: \(obj.answers[1].joined(separator: ","))" // comma seperated answer
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(360) // giving the height of each cell 360
    }
    
    
}
// formatting the date to get the desirable output
extension Date{
    var DateInString: String{
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM HH:mm a"
        return formatter.string(from: self)
    }
}
