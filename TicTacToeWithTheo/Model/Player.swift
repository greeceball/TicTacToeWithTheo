//
//  Player.swift
//  TicTacToeWithTheo
//
//  Created by Theo Vora on 4/8/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

import Foundation

class Player {
    let name: String
    let token: SquareState
    var moves: Set<Int>
    
    init(name: String, token: SquareState, moves: Set<Int> = []) {
        self.name = name
        self.token = token
        self.moves = moves
    }
} // end Player

enum SquareState {
    case empty
    case X
    case O
}
