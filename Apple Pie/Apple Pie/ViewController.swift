//
//  ViewController.swift
//  Apple Pie
//
//  Created by Aaron Chen on 2020-04-21.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    let incorrectMovesAllowed = 7
    var listOfWords = ["names", "house", "objects", "piano", "violin", "game", "swift", "radio", "vedio", "bug", "score", "new", "hello", "this", "app", "is" ,"made", "by", "aaron", "chen"]
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    var currentGame: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /**Made the questions random*/
        listOfWords.shuffle()
        newRound()
    }
    
    @IBAction func letterButtonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    func newRound(){
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord,
                               incorrectMovesRemaining: incorrectMovesAllowed,
                               guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
    
    func updateUI() {
        correctWordLabel.text = currentGame.formattedWord.map{String($0)}.joined(separator: " ")
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
}

