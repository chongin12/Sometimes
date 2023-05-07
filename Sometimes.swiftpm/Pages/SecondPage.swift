import SwiftUI

struct SecondPage: View {
    @State private var phase = 0
    @State private var isPresented = false
    var body: some View {
        VStack {
            Text("Every day we are trapped inside our screens.")
                .font(.largeTitle)
                .padding(.bottom, 40)
                .task {
                    await delayButton()
                }
                .animation(.easeInOut, value: phase)
                .transition(.identity)
            
            if phase >= 1 {
                Text("In busy daily life, modern people's attention is focused on the small screen.")
                    .font(.title)
                    .padding(.bottom, 40)
                    .task {
                        await delayButton()
                    }
                    .animation(.easeInOut, value: phase)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }
            
            if phase >= 2 {
                Group {
                    Text("According to statistics, the average person worldwide spends")
                        .font(.title2)
                    Text("\"6 hours and 37 minutes\"")
                        .font(.largeTitle)
                        .padding(.vertical, 10)
                    Text("looking at the screen of their electronic device every day.")
                        .font(.title2)
                        .padding(.bottom, 40)
                }
                .multilineTextAlignment(.center)
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
                    ThirdPage()
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

struct SecondPage_Previews: PreviewProvider {
    static var previews: some View {
        SecondPage()
    }
}
