//
//  QandA.swift
//  Trivia App
//
//  Created by Mohammad Yunus on 10/10/19.
//  Copyright © 2019 taptap. All rights reserved.
//

import UIKit

class QandA: UIViewController {
    
    var username: String! //this store username passed from previos view controller
    
    var game = Game() // initializing game
    var selectedQuestion = 0 // initial game question
    var ques = [String]() // array to store questions which will be saved in core data
    var anss: [[String]] = [] // array to store answers which wil be stored in core data
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var optionTable: UITableView!
    
    @IBOutlet weak var noteLabel: UILabel!
    
    @IBOutlet weak var nextOutlet: UIButton!
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        ques.append(game.questions[selectedQuestion].question) // new question appends to question array
        let x = optionTable.indexPathsForSelectedRows!
        var ans: [String] = []
        for i in x{
            print(i.row)
            ans.append(game.questions[selectedQuestion].options[i.row]) //append answer to answer array
        }
        anss.append(ans)
        // if selected question is less than number of question available we move to next question
        if selectedQuestion < game.questions.count - 1{
            selectedQuestion = selectedQuestion + 1
            questionLabel.text = game.questions[selectedQuestion].question
            noteLabel.text = "note: \(game.questions[selectedQuestion].type) option type question"
            if game.questions[selectedQuestion].type == "multiple"{ // question type is mutliple then table is allowed to select multiple row
                optionTable.allowsMultipleSelection = true
            }else{ // else only multiple row selection is not allowed
                optionTable.allowsMultipleSelection = false
            }
            optionTable.reloadData()
        }else{ // else we move to next view controller passing user name and questions and answers array
            if let dvc = storyboard?.instantiateViewController(identifier: "summary") as? SummaryViewController{
                dvc.que = ques
                dvc.an = anss
                dvc.name = username
                navigationController?.pushViewController(dvc, animated: true)
            }
        }
        nextOutlet.isEnabled = false
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true) // hide back button so that user can only get one chance to answer the question
        nextOutlet.isEnabled = false // initially button is disabled
        questionLabel.text = game.questions[selectedQuestion].question //question label is assing first question text
        noteLabel.text = "note: \(game.questions[selectedQuestion].type) option type question" // note label is assign type of question
        if game.questions[selectedQuestion].type == "multiple"{
            optionTable.allowsMultipleSelection = true
        }else{
            optionTable.allowsMultipleSelection = false
        }
        optionTable.dataSource = self
        optionTable.delegate = self
    }

}

// using table view to show options to the question and based on the number of rows selected enabling and disabling the next button
extension QandA: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return game.questions[selectedQuestion].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = optionTable.dequeueReusableCell(withIdentifier: "optionCell", for: indexPath)
        cell.textLabel!.text = game.questions[selectedQuestion].options[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nextOutlet.isEnabled = true
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        optionTable.reloadData()
        nextOutlet.isEnabled = false
    }
    
    
    
}
