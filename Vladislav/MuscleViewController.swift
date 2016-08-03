//
//  MuscleViewController.swift
//  Vladislav
//
//  Created by Mirco Gysin on 31/07/16.
//  Copyright © 2016 Mirco Gysin. All rights reserved.
//

import UIKit

class MuscleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    
    
    @IBOutlet var possibleAnswersTable: UITableView!
    @IBOutlet weak var muscleName: UILabel!
    
    let cellIdentifier = "AnswerCandidateTableViewCell"
    
    @IBOutlet weak var verify: UIButton!
    
    var questions = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let q0 = Question(muscleName: "M. Sternocleidomastodeus", origos: ["Sternum", "Clavicula"], insertios: ["Mastoideus"])
    
        questions.append(q0)
        
        setQuestion(questions[0])

        possibleAnswersTable.delegate = self
        possibleAnswersTable.dataSource = self
    }
    
    // MARK: methods for table
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (questions[0].origos.count + questions[0].insertios.count)
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! AnswerCandidateTableViewCell
        
        let row = indexPath.row
        cell.partName.text = questions[0].muscleName
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        print(questions[row].muscleName)
    }
    
    func setQuestion(question: Question){
        self.muscleName.text = question.muscleName
    }
    
    @IBAction func verifyAnswer(sender: AnyObject) {
        print("Verify Buttton Pressed")
        
    }
}
