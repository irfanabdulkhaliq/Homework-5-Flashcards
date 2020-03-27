//
//  Flashcard.swift
//  HeinAlexHW5
//
//  Created by Irfan and Irfan on 3/11/20.
//  Copyright © 2020 Irfan 00923009608775. All rights reserved.
//

import Foundation

struct Flashcard:Equatable{
    private var question : String
    private var answer : String
    public var isFavorite : Bool
    
    init(question: String, answer: String, isFavorite: Bool=false){
        self.question = question
        self.answer = answer
        self.isFavorite = isFavorite
    }
    
    func getQuestion() -> String {
        return question
    }
    func getAnswer() -> String {
        return answer
    }
}
