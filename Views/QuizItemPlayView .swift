
import SwiftUI
struct QuizItemPlayView: View {
       
    @ObservedObject  var scoresModel = ScoresModel()
    @Environment(\.verticalSizeClass) var vsc
     
    var quizItem: QuizItem
 
    @State var answer : String = ""
    @State var showCheckAlert = false
    
    var body: some View {
        VStack{
            if (vsc == .compact){
                VStack{                 
                titulo
                Spacer()
                    HStack{
                        adjunto
                        Spacer()
                        VStack{
                            Spacer()
                            pregunta
                           Spacer()
                            puntos
                            Spacer()
                            autor
                            
                        }
                                           
                    }
                }
            }
                else{
                    VStack{
                        titulo
                        Spacer()
                        pregunta
                        Spacer()
                        adjunto
                        Spacer()
                        Spacer()
                        HStack{
                            puntos
                            Spacer()
                            autor
                        }
                    }
            }          
            
        }
        .padding()
        .navigationTitle("Playing")
    }
    private var titulo: some View{
         HStack{
                    Text(quizItem.question)
                    Spacer()
                    Image(quizItem.favourite ? "estrella-amarilla" : "estrella-gris").resizable().frame(width: 40,height: 40)
                }
    } 
    private var pregunta: some View{
        VStack{
            TextField("Introduzca la respuesta", text: $answer)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    showCheckAlert = true
                    checkAnswer()
                }       
            Button("Comprobar") {
                showCheckAlert = true
                checkAnswer()
                            }
            .buttonStyle(MyButtonStyle())
            .padding()
        }
        .alert("Resultado", isPresented: $showCheckAlert){
        }message : {
            Text(answer =+-= quizItem.answer ? "Bien" : "Mal")
        }
        }
    private var adjunto : some View{
        GeometryReader { g in
            FacilAsyncImage(url: quizItem.attachment?.url)
                .frame(width: g.size.width, height: g.size.height)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .overlay {
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(Color.blue, lineWidth:2)
                    
                }
                .shadow(color: .yellow, radius: 2)

            
        }
    }    
    private var autor: some View{
        HStack{
            Spacer()
            Text(quizItem.author?.username ?? quizItem.author?.profileName ?? "Anónimo")
            FacilAsyncImage(url: quizItem.author?.photo?.url)
                .frame(width:30, height: 30)
                .scaledToFill()
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(Color.blue, lineWidth: 2)
                    
                }
                .shadow(color: .yellow, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)         
        }
        
    }   
    private var puntos : some View {
        
            Text("Puntos = \(scoresModel.score)")
            .font(.title)
            .foregroundStyle(.mint)
            .fontDesign(.serif)
        }
    private func checkAnswer() {
           scoresModel.checkAnswer(quizItem: quizItem, answer: answer)
       }
    struct MyButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(configuration.isPressed ? Color.blue.opacity(0.8) : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        }
    }  
    }

#Preview {
    var model:QuizzesModel = {
        var m = QuizzesModel()
        m.load()
        return m
    } ()
    return NavigationStack {
        QuizItemPlayView(quizItem: model.quizzes[0])
    }
}


