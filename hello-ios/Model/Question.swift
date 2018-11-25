import Foundation

class Question {
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnwser: Bool) {
        questionText = text;
        answer = correctAnwser;
    }
}
