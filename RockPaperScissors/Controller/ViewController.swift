//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Владислав on 01.10.2020.
//

import UIKit

class ViewController: UIViewController {
    //звуковые константы
let chikClickSound = SimpleSound(named: "chik")
let playAgainSound = SimpleSound(named: "resetButton")
let loseSound = SimpleSound(named: "loseMan")
let roborHeadSound = SimpleSound(named: "roboSound")
let winSound = SimpleSound(named: "winwin")
let drawSound = SimpleSound(named: "drawSound")
let absolutlyWinner = SimpleSound(named: "absolutlyWinner")
    
//подключены розетки с объектами!
    
    @IBOutlet weak var robotHead: UIButton!
    @IBOutlet weak var statusGame: UILabel!
    @IBOutlet weak var rockPalyerChoice: UIButton!
    @IBOutlet weak var scissorsPlayerChoice: UIButton!
    @IBOutlet weak var paperPlayerChoise: UIButton!
    @IBOutlet weak var playAgainChoise: UIButton!
    
    
    
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var computerScore: UILabel!
    
    var computerScoreResult = 0
    var playerScoreResult = 0
    
    override func viewDidLoad() { //функция загрузки со старта только только вкл приложение
        super.viewDidLoad()
        playAgainChoise.isHidden = true
    }
    
    func play(_ sign: Sign) { //берем значение игрока - выбор игрока
        let computerSign = randomSign()
        robotHead.setTitle(computerSign.emoji, for: .normal) //меняем голову робота на эмодзи сделанный в Sign
        switch sign { //играем кейсы выбора и прячем не нужные символы!
        case .rock:
            rockPalyerChoice.isHidden = false
            paperPlayerChoise.isHidden = true
            scissorsPlayerChoice.isHidden = true
        case .scissors:
            rockPalyerChoice.isHidden = true
            scissorsPlayerChoice.isHidden = false
            paperPlayerChoise.isHidden = true
        case .paper:
            rockPalyerChoice.isHidden = true
            scissorsPlayerChoice.isHidden = true
            paperPlayerChoise.isHidden = false
        }
        
        let resultGame = sign.returnTitle(computerSign) // смена статуса поражение или победа! берем статусы и энума
        switch resultGame {
        case .win:
            playerScoreResult += 1
            self.playerScore.text = "📱\(computerScoreResult):\(playerScoreResult)👤"
            if playerScoreResult == 15 {
                self.view.backgroundColor = UIColor.yellow
                playerScoreResult = 0
                computerScoreResult = 0
                statusGame.text = "Абсолютная победа!!!"
                absolutlyWinner.play()
            }
            winSound.play()
            statusGame.text = "🎉Победа!" //меняеп текст
            self.view.backgroundColor = UIColor.green //меняем цвет обоев в случаи выигрыша
        case .lose:
            computerScoreResult += 1
            self.playerScore.text = "📱\(computerScoreResult):\(playerScoreResult)👤"
            if computerScoreResult == 15 {
                self.view.backgroundColor = UIColor.brown
                computerScoreResult = 0
                playerScoreResult = 0
                statusGame.text = "Полностью уничтожен!"
            }
            loseSound.play()
            statusGame.text = "☠️Поражение"
            self.view.backgroundColor = UIColor.red
        case .draw:
            drawSound.play()
            statusGame.text = "🤝Ничья"
            self.view.backgroundColor = UIColor.gray
        case .start:
            reset()
            statusGame.text = "ошибка"
            self.view.backgroundColor = UIColor.yellow
        }
        
        playAgainChoise.isHidden = false //пишем в функции play
    }
    
    func reset() { //сброс игры до начального состояния! возврат значений ладошек + сокрытие кнопки
        
        
        statusGame.text = "Камень, ножницы или бумага?" //возвращаем статус после надания на ресет
        self.view.backgroundColor = UIColor.black //возвращаем цвет обоем после нажатия на ресет
        robotHead.setTitle("🤖", for: .normal)
        rockPalyerChoice.isHidden = false
        scissorsPlayerChoice.isHidden = false
        paperPlayerChoise.isHidden = false
        playAgainChoise.isHidden = false
        
        playAgainChoise.isHidden = true //мы еще раз пишем спрятаться после того как нажали на нее при оконеной игре!
    }
    
//действия с кнопками камень, ножницы, бумага и сыграть снова!
    @IBAction func ronorButtonPress(_ sender: Any) {
        roborHeadSound.play()
    }
    @IBAction func rockButtonPress(_ sender: Any) {
        play(.rock)
        chikClickSound.play()
    }
    
    @IBAction func scissorsButtonPress(_ sender: Any) {
        play(.scissors)
        chikClickSound.play()
    }
    @IBAction func paperButtonPress(_ sender: Any) {
        play(.paper)
        chikClickSound.play()
    }
    
    @IBAction func playAgainButtonPress(_ sender: Any) {
        reset()
        playAgainSound.play()
    }
}


