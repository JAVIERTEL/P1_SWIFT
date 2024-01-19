
import Foundation

@Observable class QuizzesModel {
    // Los datos
    private(set) var quizzes = [QuizItem]()
    
    func load() { //Para cargar los ficheros de un JSON
        do {
            guard let jsonURL = Bundle.main.url(forResource: "quizzes", withExtension: "json") else {
                throw "Internal error: No encuentro quizzes.json"
            }
            let data = try Data(contentsOf: jsonURL)
            
            guard let quizzes = try? JSONDecoder().decode([QuizItem].self, from: data)  else {
                throw "Error: recibidos datos corruptos."
            }        
            self.quizzes = quizzes
            
            print("Quizzes cargados")
        } catch {
            print(error.localizedDescription)
        }}}
