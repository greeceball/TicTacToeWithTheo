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
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    
    
    
    //MARK: - Properties
    
    var currentPlayer: Player = GameController.shared.player1
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Actions
    @IBAction func buttonTapped(_ sender: UIButton) {
        let value: Int = sender.tag
        if GameController.shared.playerMoved(player: currentPlayer, move: value) {
    }
    
    
    //MARK: - HelperFunc's
    
}
