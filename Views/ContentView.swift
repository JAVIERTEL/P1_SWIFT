
import SwiftUI

extension String: LocalizedError {
    public var errorDescription: String? {
        return self
    }
}
struct ContentView: View {
    
    var quizzesModel = QuizzesModel()
    @StateObject var scoresModel = ScoresModel()
    
        var body: some View {
        NavigationStack{
            List{          
                ForEach(quizzesModel.quizzes) {quizItem in
                    NavigationLink{
                        QuizItemPlayView(quizItem: quizItem )
                    }label :{
                        QuizItemRowView(quizItem: quizItem)
                   }} }
            .listStyle(.plain)
            .navigationTitle("P4 QUIZZES")           
        }       
        .onAppear(perform: {
            quizzesModel.load()
        })
        .padding()
    }
}
#Preview {
    ContentView()
}

