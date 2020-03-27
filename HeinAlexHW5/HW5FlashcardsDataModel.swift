//
//  HW5FlashcardModel.swift
//  ITP342 HW5
//
//  Created by Harrison Weinerman on 10/5/18.
//  Copyright © 2018 Harrison Weinerman. All rights reserved.
//

import Foundation

// protocol that checks to make sure you are naming your functions like intended
//failure to follow this protol will result in a 0
protocol FlashcardsDataModel {
    
    // Returns number of flashcards in model
    func numberOfFlashcards() -> Int
    
    // Returns a flashcard – sets currentIndex appropriately
    func randomFlashcard() -> Flashcard?
    func nextFlashcard() -> Flashcard?
    func previousFlashcard() -> Flashcard?
    
    // Inserts a flashcard to the end – sets currentIndex appropriately in certain situations
    func insert(question: String, answer: String, favorite: Bool)
    
    // Returns the current flashcard at currentIndex
    func currentFlashcard() -> Flashcard?
    
    //Returns a card at a given index
    func flashcard(at index: Int) -> Flashcard?
    
    // Removes a flashcard – sets currentIndex appropriately when removing from certain positionss
    func removeFlashcard(at index: Int)
    
    // Favorite/unfavorite the current flashcard
    func toggleFavorite()
    
    // Returns the favorite flashcards from your flashcards
    func favoriteFlashcards() -> [Flashcard]

}


