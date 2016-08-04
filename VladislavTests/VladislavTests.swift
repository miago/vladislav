//
//  VladislavTests.swift
//  VladislavTests
//
//  Created by Mirco Gysin on 31/07/16.
//  Copyright © 2016 Mirco Gysin. All rights reserved.
//

import XCTest
@testable import Vladislav

class VladislavTests: XCTestCase {
    
    // MARK: Question Test
    func testGetNthElement() {
        var muscleName = "M. Deltoideus"
        var origos = ["Clavicula", "Acromion"]
        var insertios = ["Humerus"]
        
        let q0 = Question(muscleName: muscleName, origos: origos, insertios: insertios)

        XCTAssert(Question.getNthElement(0, origos: origos, insertios: insertios) == "Clavicula")

        
        XCTAssert(Question.getNthElement(1, origos: origos, insertios: insertios) == "Acromion")
        XCTAssert(Question.getNthElement(2, origos: origos, insertios: insertios) == "Humerus")
        
        XCTAssertNil(Question.getNthElement(3, origos: origos, insertios: insertios))
    }
    
    func testRandomCodeGeneration() {
        var rndCode = Question.generateRandomCode(3, nrOfAnswers: 6)
        XCTAssert(rndCode.count == 6)
        
        XCTAssert(rndCode.contains(0))
        rndCode.removeAtIndex(rndCode.indexOf(0)!)
        XCTAssert(rndCode.count == 5)
        
        XCTAssert(rndCode.contains(1))
        rndCode.removeAtIndex(rndCode.indexOf(1)!)
        XCTAssert(rndCode.count == 4)
        
        XCTAssert(rndCode.contains(2))
        rndCode.removeAtIndex(rndCode.indexOf(2)!)
        XCTAssert(rndCode.count == 3)
        
        XCTAssert(rndCode[0] == -1)
        XCTAssert(rndCode[1] == -1)
        XCTAssert(rndCode[2] == -1)
    }
    
    func testGetRandomizedString() {
        let muscleName = "M. Deltoideus"
        let origos = ["Clavicula", "Acromion"]
        let insertios = ["Humerus"]
        
        let q0 = Question(muscleName: muscleName, origos: origos, insertios: insertios)
        
        
        q0.randomCode = [Int](count: Constants.numberOfPossibleAnswers, repeatedValue: -1)
        
        let rndStrings = q0.getRandomizedStrings()
        
        for i in 0..<Constants.numberOfPossibleAnswers {
            XCTAssert(rndStrings[i] == Question.placeholderText)
        }

        
    }
}
