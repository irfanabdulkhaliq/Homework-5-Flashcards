//
//  FlashcardsModel.swift
//  HeinAlexHW5
//
//  Created by Irfan and Irfan on 3/11/20.
//  Copyright © 2020 Irfan 00923009608775. All rights reserved.
//

import Foundation

class FlashcardsModel: NSObject, FlashcardsDataModel{
                 var flashcards = [Flashcard]()
    private(set)  var currentIndex: Int?
    var questionDisplayed:Bool!
    
    override init() {
        flashcards = []
        flashcards.append(Flashcard(question: "What is Alex Hein's middle name?", answer: "Joseph", isFavorite: false))
        flashcards.append(Flashcard(question: "How many features did J. Cole have on his double platinum album, 2014 Forest Hills Drive?", answer: "None", isFavorite: false))
        flashcards.append(Flashcard(question: "Who is the most talented music producer in EDM?", answer: "Flume", isFavorite: false))
        flashcards.append(Flashcard(question: "What is another name for COVID-19?", answer: "Coronavirus", isFavorite: false))
        flashcards.append(Flashcard(question: "Why did the chicken cross the road?", answer: "To get to the other side", isFavorite: false))
        currentIndex = 0
    }
    
    // Swift Singleton pattern
    static let sharedInstance = FlashcardsModel()
    
    // Returns number of flashcards in model
    func numberOfFlashcards() -> Int{
        return flashcards.count
    }
    // Returns a flashcard – sets currentIndex appropriately
    func randomFlashcard() -> Flashcard?{
        let randomNum = Int(arc4random_uniform(UInt32(flashcards.count)))
    
        currentIndex = randomNum
        return flashcards[randomNum]
    }
    
    
    func nextFlashcard() -> Flashcard? {
        let currentIndex = self.currentIndex
           if currentIndex == flashcards.count - 1 {
               print("This is the last element of the array. No next nodes.")
               return nil
           }

        let newIndex = currentIndex! + 1
        self.currentIndex = newIndex

        return flashcards[newIndex]
    }
    
    func previousFlashcard() -> Flashcard? {

        let currentIndex = self.currentIndex
        if currentIndex == 0 {
            print("This is the first element of the array. No previous nodes.")
            return nil
        }

        let newIndex =  currentIndex! - 1
        self.currentIndex = newIndex

        return flashcards[newIndex]

        
    }
    
    func insert(question: String, answer: String, favorite: Bool) {
        flashcards.append(Flashcard(question: question, answer: answer, isFavorite: favorite))
    }
       
    func currentFlashcard() -> Flashcard? {
        return flashcards[currentIndex!]
    }
    //Returns a card at a given index
    func flashcard(at index: Int) -> Flashcard? {
        if index > (flashcards.count - 1) {
               print("Wrong index. Should be between 0 and 4")
               return nil
           } else {
               currentIndex = index
               return flashcards[index]
           }
    }
      // Removes a flashcard – sets currentIndex appropriately when removing from certain positionss
    func removeFlashcard(at index: Int) {
        if index < flashcards.count {
            flashcards.remove(at: index)
        }
        
    }
    
    func toggleFavorite() {
        var counterIndex = 0
         for flash in flashcards {
             if currentIndex == counterIndex {
                 if flash.isFavorite == true {
                    flashcards[currentIndex!].isFavorite = false
                 } else {
                    flashcards[currentIndex!].isFavorite = true
                 }
             }
             counterIndex += 1
         }
        
    }
    
    func favoriteFlashcards() -> [Flashcard] {
        var arrayOfFlashcards: [Flashcard] = []
          var tempMutArray: [Flashcard] = []

          for flashcard in flashcards {
              if flashcard.isFavorite {
                tempMutArray.append(flashcard)
              }
          }

          arrayOfFlashcards = tempMutArray

          return arrayOfFlashcards
        
    }
    
//    func nextFlashcard() -> Flashcard?
//    func previousFlashcard() -> Flashcard?
//    // Inserts a flashcard to the end – sets currentIndex appropriately in certain situations
//    func insert(question: String,
//    answer: String,
//     favorite: Bool)
//    // Returns the current flashcard at currentIndex
//    func currentFlashcard() -> Flashcard?
//    //Returns a card at a given index
//    func flashcard(at index: Int) -> Flashcard?
//    // Removes a flashcard – sets currentIndex appropriately when removing from certain positionss
//    func removeFlashcard(at index: Int)
//    // Favorite/unfavorite the current flashcard
//    func toggleFavorite()
//    // Returns the favorite flashcards from your flashcards
//    func favoriteFlashcards() -> [Flashcard]
}
