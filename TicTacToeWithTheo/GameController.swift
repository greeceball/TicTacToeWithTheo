//
//  GameController.swift
//  TicTacToeWithTheo
//
//  Created by Theo Vora on 4/8/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

import Foundation

class GameController {
    // MARK: - Shared Instance
    
    static let shared = GameController()
    
    
    // MARK: - Private Properties
    private var cleanBoard: [Int : SquareState] = [
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
    
    
    // MARK: - Properties
    
    var player1 = Player(name: "Player 1", token: .X)
    var player2 = Player(name: "Player 2", token: .O)
    
    var currentBoardState: [Int : SquareState]
    
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
    
    // Initializer
    
    init() {
        self.currentBoardState = cleanBoard
    }
    
    
    // Public Methods
    
    func playerMoved(player: Player, move: Int) -> Bool {
        // update Game Board
        currentBoardState[move] = player.token
        
        // insert move to player moves
        player.moves.insert(move)
        
        // did this player win?
        if didWin(player) {
            return true
        } else {
            // change players
            togglePlayer()
            
            return false
        }
    }
    
    func resetBoard() {
        self.currentBoardState = cleanBoard
        player1Turn = true
    }
    
    
    // Helper Functions
    
    private func togglePlayer() {
        player1Turn = !player1Turn
    }
    
    private func didWin(_ player: Player) -> Bool {
        let playerMoves = player.moves
        guard playerMoves.count >= 3 else { return false }
        
        for combo in winningCombos {
            if playerMoves.intersection(combo).count == 3 {
                print("Winner! winning move: \(playerMoves.intersection(combo))")
                return true
            }
        }
        print("\(player.name): no winning moves yet")
        return false
    }
    
    
} // end class


