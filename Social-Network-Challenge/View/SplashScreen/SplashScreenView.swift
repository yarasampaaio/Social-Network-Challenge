import SwiftUI

struct SplashScreenView: View {
    @State private var animationText: Bool = false
    
    @State private var isActive: Bool = false
    
    var body: some View {
        
        if isActive{
            LoginView()
        }else{
            mySplash
            .ignoresSafeArea()
            .task {
                withAnimation(.linear(duration: 2)) {
                    animationText.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isActive.toggle()
                }
            }
        }
        
    }
    
    var mySplash: some View{
        ZStack{
            Color(uiColor: .darkGray)
            
            Image("Perfil")
                .resizable()
                .opacity(animationText ? 1 : 0)
                .shadow(
                    color: Color(uiColor: .brown),
                    radius: 4,
                    x: 0,
                    y: 4
                )
                .frame(
                    width: SizesComponents.widthSecond,
                    height: SizesComponents.heightScreen*0.5
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
