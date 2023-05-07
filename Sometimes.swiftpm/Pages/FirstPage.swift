import SwiftUI

struct FirstPage: View {
    @State private var hasTimeElapsed = false
    @State private var isPresented = false
    var body: some View {
        VStack {
            Text("When was the last time you looked up at the sky?")
                .font(.system(size: 60))
                .padding(.bottom, 40)
                .task {
                    await delayButton()
                }
                .animation(.easeInOut, value: hasTimeElapsed)
                .transition(.identity)
            
            if hasTimeElapsed {
                Button {
                    isPresented.toggle()
                } label: {
                    Text("Next")
                        .font(.largeTitle)
                        .padding()
                        .padding(.horizontal, 50)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.blue, lineWidth: 3)
                        }
                }
                .transition(AnyTransition.opacity.animation(.easeInOut))
                .fullScreenCover(isPresented: $isPresented, content: {
                    SecondPage()
                        .transition(AnyTransition.opacity.animation(.easeInOut))
                })
            }
        }
    }
    
    private func delayButton() async {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        hasTimeElapsed = true
    }
}
