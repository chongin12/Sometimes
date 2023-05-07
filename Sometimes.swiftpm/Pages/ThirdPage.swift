import SwiftUI

struct ThirdPage: View {
    @State private var phase = 0
    @State private var isPresented = false
    var body: some View {
        VStack {
            Text("Isn't it weird? 🤨")
                .font(.largeTitle)
                .padding(.bottom, 40)
                .task {
                    await delayButton()
                }
                .animation(.easeInOut, value: phase)
                .transition(.identity)
            
            if phase >= 1 {
                Text("We all have no qualms about using a small screen, and we don't think it's uncomfortable.")
                    .font(.title)
                    .padding(.bottom, 40)
                    .task {
                        await delayButton()
                    }
                    .animation(.easeInOut, value: phase)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }
            
            if phase >= 2 {
                Text("And it's no different than looking at the world through a small window.")
                    .font(.largeTitle)
                    .padding(.bottom, 40)
                    .task {
                        await delayButton()
                    }
                    .animation(.easeInOut, value: phase)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }
            
            if phase >= 3 {
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
                    FourthPage()
                        .transition(AnyTransition.opacity.animation(.easeInOut))
                })
            }
        }
    }
    
    private func delayButton() async {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        phase += 1
    }
}

struct ThirdPage_Previews: PreviewProvider {
    static var previews: some View {
        ThirdPage()
    }
}
