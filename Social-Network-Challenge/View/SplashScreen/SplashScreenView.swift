import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        
        if isActive{
            LoginView()
        }else{
            mySplash
            .ignoresSafeArea()
            .task {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isActive.toggle()
                }
            }
        }
        
    }
    
    var mySplash: some View{
        ZStack{
            
            Image("Logo")
                .resizable()
                .frame(
                    width: SizesComponents.widthFirst,
                    height: SizesComponents.widthFirst
                )
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SplashScreenView()
        }
    }
}
