//
//  GameBoardViewController.swift
//  TicTacToeWithTheo
//
//  Created by Colby Harris on 4/8/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

import UIKit

class GameBoardViewController: UIViewController {
    
    //MARK: - Outlets
    //MARK: - Button Outlets
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    
    //MARK: - TextLabels in stack view
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    
    //MARK: - Label Outlets
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var gameInfo: UILabel!
    
    //MARK: - StackView Outlets
    @IBOutlet weak var gameBoardStackView: UIStackView!
    @IBOutlet weak var playerLegendStackView: UIStackView!
    @IBOutlet weak var viewStackView: UIStackView!
    
    //MARK: - GameBoard StackViews Outlets
    @IBOutlet weak var stack123StackView: UIStackView!
    @IBOutlet weak var stack456StackView: UIStackView!
    @IBOutlet weak var stack789StackView: UIStackView!
    
    
    //MARK: - UIImage Outlets
    @IBOutlet weak var recoilImage: UIImageView!
    @IBOutlet weak var treeImage: UIImageView!
    
    //MARK: - Properties
    
    var currentPlayer: Player = GameController.shared.player1
    var gameActive = true
    
   
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
    }
    
    
    //MARK: - Actions
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard gameActive else { return } // do not accept button taps if the game is over
        
        currentPlayer == GameController.shared.player1 ? sender.setImage(#imageLiteral(resourceName: "Recoil"), for: .normal) : sender.setImage(#imageLiteral(resourceName: "Tree"), for: .normal)
        
        let value: Int = sender.tag
        if GameController.shared.playerMoved(player: currentPlayer, move: value) {
            // current player has won the game
            gameInfo.text = "\(currentPlayer.name) won!"
            
            // game over!
            gameActive = false
        } else {
            updateCurrentPlayer()
        }
    }
    
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        
    }
    
    //MARK: - HelperFunc's
    func updateCurrentPlayer() {
        currentPlayer =  GameController.shared.player1Turn ? GameController.shared.player1 : GameController.shared.player2
        gameInfo.text = "\(currentPlayer.name)'s turn"
    }
    
}

