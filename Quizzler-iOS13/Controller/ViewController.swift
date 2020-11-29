import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var Option1: UIButton!
    @IBOutlet weak var Option2: UIButton!
    @IBOutlet weak var Option3: UIButton!
    
   var quizBrain = QuizBrain() //wraps QuizBrain struct into a variable
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //changes the questionLabel after launching the app, loads changes as soon as app appears on the screen
        
        updateUI() //launches a function which pulls the question into a view
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //Option1, Option2, Option3
        let userGotItRight = quizBrain.checkAnswer(userAnswer) //wraps into a constant a func when answer was chosen right and got +1 score
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green //changes the button color if the answer is right
        } else {
            sender.backgroundColor = UIColor.red //changes the button color if the answer is wrong
        }
        
        quizBrain.nextQuestion() //displays next question. Func in QuizBrain.swift
    
       Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false) //makes the button color disappear after it's pressed in 0.2 seconds
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText() //pulls the question into a view
        progressBar.progress = quizBrain.getProgress() //shows the progress of questions. QuestionNumber + 1 indicates, that progress bar is already starting from 1.
        scoreLabel.text = "Score: \(quizBrain.getScore())" //inserts actual score
        
        let answerChoices = quizBrain.displayAnswers() //pulls answer questions with func
        
        Option1.setTitle(answerChoices[0], for: .normal) //changes the tittle (text) of the button with an answer from quizBrain
        Option2.setTitle(answerChoices[1], for: .normal)
        Option3.setTitle(answerChoices[2], for: .normal)
        
        Option1.backgroundColor = UIColor.clear //makes the answer buttons clear after the button is pressed
        Option2.backgroundColor = UIColor.clear
        Option3.backgroundColor = UIColor.clear
    }
}
