
import Foundation

struct Question {
    let text: String
    let answers: [String]
    let actualAnswer: String
    
    init(q: String, a: [String], aa: String) {
        text = q
        answers = a
        actualAnswer = aa
    }
}
