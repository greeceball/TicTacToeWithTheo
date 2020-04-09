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
    
    var turnsTaken: Int {
        get {
            player1.moves.count + player2.moves.count
        }
    }
    
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
    
    func playerMoved(player: Player, move: Int) -> GameState {
        // update Game Board
        currentBoardState[move] = player.token
        
        // insert move to player moves
        player.moves.insert(move)
        
        // did this player win?
        if didWin(player) {
            return player == player1 ? .Player1Won : .Player2Won
        } else if turnsTaken < 9 {
            // change players
            togglePlayer()
            return player1Turn ? .Player1Turn : .Player2Turn
        } else {
            // tie
            return .tie
        }
    }
    
    func resetBoard() {
        // reset board
        self.currentBoardState = cleanBoard
        
        // reset players
        self.player1 = Player(name: "Player 1", token: .X)
        self.player2 = Player(name: "Player 2", token: .O)
        self.player1Turn = true
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


enum GameState {
    case Player1Turn
    case Player2Turn
    case Player1Won
    case Player2Won
    case tie
}
