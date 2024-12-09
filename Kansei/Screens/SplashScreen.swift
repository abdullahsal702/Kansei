import SwiftUI

struct SplashScreen: View {
    var body: some View {
        Image("kansei-splash")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
}

#Preview {
    SplashScreen()
}
