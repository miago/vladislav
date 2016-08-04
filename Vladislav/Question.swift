//
//  Question.swift
//  Vladislav
//
//  Created by Mirco Gysin on 31/07/16.
//  Copyright © 2016 Mirco Gysin. All rights reserved.
//

import UIKit

class Question {
    var muscleName: String
    var origos = [String]()
    var insertios = [String]()
    static let placeholderText = "Nemo Plus"
    var totalTrueAnswers: Int
    var randomizedAnswers = [String]()
    
    // contains nrOfAnswers elements
    // the inserted wrong answers are marked with -1
    // 0 represents the 0th element of origos+insertions
    // 1 the first element, and so on
    // Example:
    // [2,-1,1,0]
    // The first possible answer is the 2nd element,
    // The second possible answer is a wrong answer
    // The third possible answer is the 1nd element,
    // The fourth possible answerd is the 0th element.
    var randomCode = [Int]()
    
    init(muscleName: String, origos: [String], insertios: [String]) {
        self.muscleName = muscleName
        self.origos = origos
        self.insertios = insertios
        
        self.totalTrueAnswers = origos.count + insertios.count
        
        self.randomCode =  Question.generateRandomCode(self.totalTrueAnswers, nrOfAnswers: Constants.numberOfPossibleAnswers)
    }
    
    static func getNthElement(elementNumber: Int, origos: [String], insertios: [String]) -> String? {
        if (elementNumber == -1) {
            return self.placeholderText
        }
        
        if elementNumber >= (origos.count + insertios.count) {
            return nil
        }
        
        if elementNumber < origos.count {
            return origos[elementNumber]
        } else {
            return insertios[elementNumber-origos.count]
        }
    }
    
    static func generateRandomCode(totalTrueAnswers: Int, nrOfAnswers: Int) -> [Int]{
        // Returns something like [2,-1,1,0]
        // every number from 0...totalTrueAnswers
        // is present only once
        // -1 is in the other cells
        var rndCode = [Int](count: nrOfAnswers, repeatedValue: -1)
        
        var position: Int = 0
        var firstTime = true
        
        for i in 0..<totalTrueAnswers {
            while (rndCode[position] != -1) || firstTime {
                position = Int(arc4random_uniform(UInt32(nrOfAnswers)))
                firstTime = false
            }
            rndCode[position] = i
        }
        
        return rndCode
    }
    
    func getRandomizedStrings() -> [String] {
        for i in 0..<Constants.numberOfPossibleAnswers {
            self.randomizedAnswers.append(Question.getNthElement(self.randomCode[i], origos: self.origos, insertios: self.insertios)!)
        }
        
        return self.randomizedAnswers
    }
}