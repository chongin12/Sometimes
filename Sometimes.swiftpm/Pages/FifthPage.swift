import SwiftUI

struct FifthPage: View {
    @State private var phase = 0
    var body: some View {
        VStack {
            Text("So far, we've been experimenting with screens that are smaller than the original screen.")
                .font(.title)
                .padding(.bottom, 40)
                .task {
                    await delayButton()
                }
                .animation(.easeInOut, value: phase)
                .transition(.identity)
            
            if phase >= 1 {
                Text("How are you? Aren't you frustrated?")
                    .font(.largeTitle)
                    .padding(.bottom, 40)
                    .task {
                        await delayButton()
                    }
                    .animation(.easeInOut, value: phase)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }
            
            if phase >= 2 {
                Text("Shall we lift our heads for a second? We were just looking at a small screen in a big world.")
                    .font(.title)
                    .padding(.bottom, 40)
                    .task {
                        await delayButton()
                    }
                    .animation(.easeInOut, value: phase)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }
            
            if phase >= 3 {
                Text("The things we can do with this are limitless, but isn't it confining us within a rather narrow screen?")
                    .font(.title)
                    .padding(.bottom, 40)
                    .task {
                        await delayButton()
                    }
                    .animation(.easeInOut, value: phase)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }
            
            if phase >= 4 {
                Text("How about looking up at the sky and feeling the world sometimes?")
                    .font(.largeTitle)
                    .padding(.bottom, 40)
                    .task {
                        await delayButton()
                    }
                    .animation(.easeInOut, value: phase)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }
            
            if phase >= 5 {
                NavigationLink { 
                    SixthPage()
                } label: { 
                    Text("Let's Feel the Real World!")
                        .font(.largeTitle)
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.blue, lineWidth: 3)
                        }
                        .foregroundColor(.blue)
                        .animation(.easeInOut, value: phase)
                        .transition(AnyTransition.opacity.animation(.easeInOut))
                }
            }
        }
    }
    
    private func delayButton() async {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        phase += 1
    }
}

struct FifthPage_Previews: PreviewProvider {
    static var previews: some View {
        FifthPage()
    }
}
