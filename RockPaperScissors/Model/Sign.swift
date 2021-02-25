//
//  Sign.swift
//  RockPaperScissors
//
//  Created by Владислав on 01.10.2020.
//

import Foundation
import GameplayKit
//производство рандомного числа!
let randomChoise = GKRandomDistribution(lowestValue: 0, highestValue: 2)
// метод присваивания рандомного числа к значениею Sign!
func randomSign() -> Sign {
    let sign = randomChoise.nextInt()
    if sign == 0{
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}



//набор имволов
enum Sign {
    case rock
    case paper
    case scissors
    
    //калькуляция возвращаемых значений в виде текстового типа
    var emoji: String {
        switch self {
        case .rock:
            return "✊🏻"
        case .paper:
            return "✋🏻"
        case .scissors:
            return "✌🏻"
        }
    }
        
//функция должна возвращать результат из файла GameStat после чего мы можем взаимодействовать с нимии-смена статуса
    func returnTitle(_ opposite: Sign) -> GameState {
        switch (self, opposite) {
        case (.rock, .rock),
             (.paper, .paper),
             (.scissors, .scissors):
            return .draw
        case (.paper, .rock),
             (.rock, .scissors),
             (.scissors, .paper):
            return .win
        default:
            return .lose
        }
    }
}
