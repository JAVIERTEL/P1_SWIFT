import Foundation
class ScoresModel: ObservableObject{
    @Published var score : Int = 0
    init() {
        // Cargar los datos guardados previamente, si existen
        if let savedScore = UserDefaults.standard.value(forKey: "score") as? Int {
            score = savedScore
        }
    }
    func checkAnswer(quizItem: QuizItem, answer : String){
        if answer =+-= quizItem.answer{
            score += 1
            saveScore()
        }
    }        
        private func saveScore() {
            // Guardar la puntuación actualizada en UserDefaults
            UserDefaults.standard.set(score, forKey: "score")

            }
             
}
