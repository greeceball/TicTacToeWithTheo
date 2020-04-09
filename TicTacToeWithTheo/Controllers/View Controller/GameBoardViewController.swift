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
        setUpUI()
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
        
        //MARK: - ViewStackView
        viewStackView.translatesAutoresizingMaskIntoConstraints = false
        viewStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        viewStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        viewStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 15).isActive = true
        viewStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 15).isActive = true
        viewStackView.distribution = .fillEqually

        //MARK: - GameBoardStackView

        
        //MARK: - PlayerLegendStackView
        player1Label.textColor = .green
        player2Label.textColor = .green
        
        recoilImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        recoilImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        treeImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        treeImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        
        //MARK: - GameInfoLabel
        gameInfo.textColor = .green
        //MARK: - ClearButton
        clearButton.setTitleColor(.green, for: .normal)
    }
    
}

