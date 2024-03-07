import SwiftUI

struct ContentView: View {
    @State private var isAnimating = false
    let easeGently = Animation.easeOut(duration: 1).repeatForever(autoreverses: true)
    let pulsingColor = Color(.blue)

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color(pulsingColor).gradient)
                    .frame(width: 172, height: 172)
                    .opacity(0.1)
                    .scaleEffect(isAnimating ? 0.5 : 1.2)
                    .zIndex(isAnimating ? 0 : 1)
                    .animation(easeGently.delay(0.1), value: isAnimating)
                
                Circle()
                    .fill(Color(pulsingColor).gradient)
                    .frame(width: 172, height: 172)
                    .opacity(0.2)
                    .scaleEffect(isAnimating ? 0.3 : 0.9)
                    .zIndex(isAnimating ? 0 : 3)
                    .animation(easeGently.delay(0.2), value: isAnimating)

                Circle()
                    .fill(Color(pulsingColor).gradient)
                    .frame(width: 172, height: 172)
                    .opacity(0.3)
                    .zIndex(isAnimating ? 0 : 3)
                    .scaleEffect(isAnimating ? 0.2 : 0.5)
                    .animation(easeGently.delay(0.3), value: isAnimating)
            }
            .onAppear {
                withAnimation {
                    isAnimating.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
