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
    let gameboardBackground = UIImageView(image: #imageLiteral(resourceName: "TicTakToeBoard"))
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        setUpUI()
        updateCurrentPlayer()
        updateBoard()
    }
    
    
    //MARK: - Actions
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard gameActive else { return } // do not accept button taps if the game is over
        
        currentPlayer == GameController.shared.player1 ? sender.setImage(#imageLiteral(resourceName: "Recoil"), for: .normal) : sender.setImage(#imageLiteral(resourceName: "Tree"), for: .normal)
        
        updateBoard()
        
        let value: Int = sender.tag
        let gameState = GameController.shared.playerMoved(player: currentPlayer, move: value)
        
        
        switch gameState {
        case .Player1Turn, .Player2Turn:
            updateCurrentPlayer()
        case .Player1Won, .Player2Won:
            gameActive = false
            gameInfo.text = "\(currentPlayer.name) won!"
        case .tie:
            gameActive = false
            gameInfo.text = "Tie. Press Clear to play again!"
        }
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        
    }
    
    
    //MARK: - HelperFunc's
    func updateCurrentPlayer() {
        currentPlayer =  GameController.shared.player1Turn ? GameController.shared.player1 : GameController.shared.player2
        gameInfo.text = "\(currentPlayer.name)'s turn"
    }
    
    
    func setUpUI() {
        
        //MARK: - gameInfo
        player1Label.textColor = .green
        player2Label.textColor = .green
        
        recoilImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        recoilImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        treeImage.heightAnchor.constraint(equalToConstant: 75).isActive = true
        treeImage.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        //MARK: - GameInfoLabel
        //        gameInfo.translatesAutoresizingMaskIntoConstraints = false
        //        gameInfo.textColor = .green
        //        gameInfo.font = UIFont(name: "Herculanum.ttf", size: 26)
        
        
        //MARK: - ClearButton
        //clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.setTitleColor(.green, for: .normal)
        
    }
    
    func updateBoard() {
        let squares = GameController.shared.currentBoardState
        
        buttonOne.setTitle(playerToken(squares[1]!), for: .normal)
        buttonTwo.setTitle(playerToken(squares[2]!), for: .normal)
        buttonThree.setTitle(playerToken(squares[3]!), for: .normal)
        buttonFour.setTitle(playerToken(squares[4]!), for: .normal)
        buttonFive.setTitle(playerToken(squares[5]!), for: .normal)
        buttonSix.setTitle(playerToken(squares[6]!), for: .normal)
        buttonSeven.setTitle(playerToken(squares[7]!), for: .normal)
        buttonEight.setTitle(playerToken(squares[8]!), for: .normal)
        buttonNine.setTitle(playerToken(squares[9]!), for: .normal)
    }
    
    func playerToken(_ square: SquareState) -> String {
        switch square {
        case .empty:
            return "-"
        case .O:
            return "O"
        case .X:
            return "X"
        }
    }
    
}

