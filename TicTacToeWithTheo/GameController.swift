//
//  GameController.swift
//  TicTacToeWithTheo
//
//  Created by Theo Vora on 4/8/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

import Foundation

struct Player {
    let name: String
    var moves: Set<Int> = []
} // end Player

enum SquareState {
    case empty
    case X
    case O
}

class GameController {
    // MARK: - Shared Instance
    
    static let shared = GameController()
    
    
    // MARK: - Properties
    
    let player1 = Player(name: "Player 1")
    let player2 = Player(name: "Player 2")
    
    var currentBoardState: [Int : SquareState] = [
        1 : .empty,
        2 : .empty,
        3 : .empty,
        4 : .empty,
        5 : .empty,
        6 : .empty,
        7 : .empty,
        8 : .empty,
        9 : .empty
    ]
    
    var player1Turn: Bool = true
    
    private let winningCombos: [Set<Int>] = [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
        [2,5,8],
        [3,6,9],
        [1,5,9],
        [3,5,7]
    ]
    
    
    // Public Methods
    
    func playerMoved(player: Player, move: Int){
        
    }
    
    
    // Helper Functions
    
    private func append(move: Int, toPlayer: Player) {
        
    }
    
    private func togglePlayer() {
        
    }
    
    private func detectWin() {
        
    }
    
    
    
    
} // end class


