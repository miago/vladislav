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
    var origins = [String]()
    var insertios = [String]()
    
    init(muscleName: String, origins: [String], insertios: [String]) {
        self.muscleName = muscleName
        self.origins = origins
        self.insertios = insertios
    }
}