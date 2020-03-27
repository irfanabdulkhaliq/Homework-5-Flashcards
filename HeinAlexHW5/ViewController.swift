//
//  ViewController.swift
//  HeinAlexHW5
//
//  Created by Irfan and Irfan on 3/11/20.
//  Copyright © 2020 Irfan 00923009608775. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    var answerShown:Bool = false
    var model = FlashcardsModel.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
      let  leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
     let   rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        leftSwipeGesture.direction = UISwipeGestureRecognizer.Direction.left
        rightSwipeGesture.direction = UISwipeGestureRecognizer.Direction.right
        view.addGestureRecognizer(leftSwipeGesture)
        view.addGestureRecognizer(rightSwipeGesture)
        
      let  singleTap = UITapGestureRecognizer(target: self, action: #selector(doSingleTap(_:)))
        singleTap.numberOfTapsRequired = 1
        view.addGestureRecognizer(singleTap)

     let   doubleTap = UITapGestureRecognizer(target: self, action: #selector(doDoubleTap(_:)))
        doubleTap.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTap)

        singleTap.require(toFail: doubleTap)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if   model.numberOfFlashcards() < 0 {
            questionLabel.text = ""
          let  singleTap = UITapGestureRecognizer(target: self, action: #selector(doSingleTapNoCards(_:)))
            singleTap.numberOfTapsRequired = 1
            view.addGestureRecognizer(singleTap)
         let   doubleTap = UITapGestureRecognizer(target: self, action: #selector(doDoubleTapNoCards(_:)))
            doubleTap.numberOfTapsRequired = 2
            view.addGestureRecognizer(doubleTap)
        }

    }
    func animateFade(in str: String?) {
        questionLabel.text = str

        // switch colors
        if questionLabel.textColor == UIColor.black || questionLabel.textColor == UIColor.white {
            questionLabel.textColor = UIColor(red: 153.0 / 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
        } else {
            questionLabel.textColor = UIColor.black
        }

        // proceed with animation
        UIView.animate(withDuration: 2.0, animations: {
            self.questionLabel.alpha = 1
        })
    }
    func animateFadeOut(_ str: String?) {
        UIView.animate(withDuration: 2.0, animations: {
            // Fade out the old text of label
            self.questionLabel.alpha = 0
        }) { finished in
            // Upon completion, call animateFadeIn
            self.animateFade(in: str)
        }
    }

//MARK:- Obj Methods
  @objc  func handleSwipes(_ sender: UISwipeGestureRecognizer?) {
        if sender?.direction == .left {
            print(String(format: "\nSwiped left, current index %i\n", model.currentIndex!))

            if model.currentIndex == model.numberOfFlashcards() - 1 {
                questionLabel.text = model.flashcard(at: 0)?.getQuestion()
            } else {
                questionLabel.text = model.nextFlashcard()?.getQuestion()
                    //model.nextFlashcard.question
            }
        }
        if sender?.direction == .right {
            if model.currentIndex == 0 {
                questionLabel.text = model.flashcard(at: model.numberOfFlashcards() - 1)?.getQuestion()
                   // model.flashcard(at: model.numberOfFlashcards - 1).question
            } else {
                questionLabel.text = model.previousFlashcard()?.getQuestion()
                    //model.prevFlashcard.question
            }
        }
    }
      @objc func doSingleTap(_ sender: UITapGestureRecognizer?) {
        print(String(format: "\nSwiped left, current index %i\n", model.currentIndex!))
        if sender?.state == .recognized {
            questionLabel.text = model.randomFlashcard()?.getQuestion()
        }
    }
      @objc  func doDoubleTap(_ sender: UITapGestureRecognizer?) {
        if sender?.state == .recognized {
            let curFlash = model.flashcard(at: model.currentIndex!)
            print("Start animating fade out and fade in.")
            print(String(format: "Boolean value is %i", answerShown))

            if answerShown == false {
                print("\n should show answer")
                animateFadeOut(curFlash?.getAnswer())
                answerShown = true
            } else if answerShown == true {
                print("\n should show question")
                animateFadeOut(curFlash?.getAnswer())
                answerShown = false
            }
        }
    }
   @objc  func doSingleTapNoCards(_ sender: UITapGestureRecognizer?) {
        if sender?.state == .recognized {
            questionLabel.text = "There are no more flashcards."
            questionLabel.textColor = UIColor(red: 153.0 / 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }
    }
    @objc  func doDoubleTapNoCards(_ sender: UITapGestureRecognizer?) {
        if sender?.state == .recognized {
            questionLabel.text = "Please add some flashcards."
            questionLabel.textColor = UIColor.white
        }
    }
    
}

