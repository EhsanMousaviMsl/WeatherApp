import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            
            VStack {
                Text("Moscow, RU")
                    .font(.system(size:32, weight: .medium, design: .default))
                    .foregroundStyle(.white)
                    .padding()
                Spacer()
            }
        }
        
    }
}


#Preview {
    ContentView()
}
