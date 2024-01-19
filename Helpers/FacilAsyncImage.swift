
import SwiftUI
//Para pedir la URL de la imagen de forma asíncrona
struct FacilAsyncImage: View {
    var url: URL?
    var body: some View{
        AsyncImage(url: url){phase in
            if url == nil {
                Color.gray
            }else if let image=phase.image{
                image.resizable()
            }else{
                ProgressView()
            }
            
        }
    }
}
