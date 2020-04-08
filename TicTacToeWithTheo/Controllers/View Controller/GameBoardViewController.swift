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
    
    //MARK: - Label Outlets
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var gameInfo: UILabel!
    
    //MARK: - StackView Outlets
    @IBOutlet weak var gameBoardStackView: UIStackView!
    @IBOutlet weak var playerLegendStackView: UIStackView!
    
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
            gameInfo.text = "\(currentPlayer.name)'s turn"
        }
        
    }
    
    
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        
    }
    
    //MARK: - HelperFunc's
    func updateCurrentPlayer() {
        currentPlayer =  GameController.shared.player1Turn ? GameController.shared.player1 : GameController.shared.player2
    }
    
    func setUpUI() {
        
        //MARK: - GameBoardStackView
        gameBoardStackView.axis = .horizontal
        gameBoardStackView.alignment = .center
        gameBoardStackView.distribution = .fillEqually
        
        //MARK: - PlayerLegendStackView
        playerLegendStackView.axis = .vertical
        playerLegendStackView.alignment = .center
        
        
        //MARK: - GameInfoLabel
        
        //MARK: - ClearButton
        
    }
    
}

