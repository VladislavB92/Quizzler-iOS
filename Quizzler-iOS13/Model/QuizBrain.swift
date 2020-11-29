
import Foundation

struct QuizBrain {
    
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], aa: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], aa: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], aa: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], aa: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], aa: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], aa: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], aa: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], aa: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], aa: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], aa: "Australia")
    ] //Structure from file Question.swift. No need to initialize, since it's a constant(let) and never will change.
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].actualAnswer {
            score += 1 //score +1 if question is right
            return true
        } else {
            return false
        }
    }
    
    func getScore() -> Int {
        return score
    } //counts total score
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    } //gets question text, func is used in viewcontroller.swift
    
    func displayAnswers() -> [String] {
        return quiz[questionNumber].answers
    } //get answer text, func is used in vievcontroller.swift
    
    func getProgress() -> Float {
        let progress = Float(questionNumber) / Float(quiz.count)
        return progress
    } //gets progress bar working
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1 //prevents app crashing when question reaches 3 in array
        } else {
            questionNumber = 0 //starts showing questions from the beginning
            score = 0 //resets the score after questions restart
        }
    }
}
