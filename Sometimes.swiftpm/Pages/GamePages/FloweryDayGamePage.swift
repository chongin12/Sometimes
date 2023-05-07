import SwiftUI
import SpriteKit
import AVFoundation

struct FloweryDayGamePage: View {
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    @State private var isShowingHint = true
    var hasWindow: Bool = true
    let introScene = FloweryDayIntroScene()
    
    @State private var audioPlayer: AVAudioPlayer?
    var body: some View {
        GeometryReader { g in
            ZStack {
                SpriteView(scene: introScene)
                if hasWindow {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.black)
                        if isShowingHint {
                            VStack {
                                Text("Chapter 1. Flowery Day")
                                    .font(.largeTitle)
                                Spacer()
                                    .frame(width: .infinity, height: 250, alignment: .center)
                                Text("(1) Drag : You can move the window by dragging.")
                                    .font(.title2)
                                    .padding()
                                Text("(2) Tap : Tap inside the window to generate flowers")
                                    .font(.title2)
                                    .padding()
                            }
                            .foregroundColor(.white)
                            .onAppear(perform: {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 30, execute: {
                                    self.isShowingHint = false
                                })
                            })
                        }
                        Rectangle()
                            .foregroundColor(.black)
                            .blendMode(.destinationOut)
                            .frame(width: 200, height: 100, alignment: .center)
                            .border(.white, width: 3)
                            .offset(x: self.currentPosition.width, y: self.currentPosition.height)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                                    }
                                    .onEnded { value in
                                        self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                                        self.newPosition = self.currentPosition
                                    }
                            )
                            .onTapGesture(count: 1, coordinateSpace: .named("screen")) { location in
                                let frame = g.frame(in: .named("screen"))
                                let newLocation = CGPoint(
                                    x: location.x / frame.width,
                                    y: 1 - location.y / frame.height
                                )
                                introScene.touchesAt(point: newLocation)
                            }
                    }
                    .compositingGroup()
                }
                
            }
            .coordinateSpace(name: "screen")
        }
        .onAppear {
            if let song = NSDataAsset(name: "SpringMusic") {
                do {
                    try self.audioPlayer = AVAudioPlayer(data: song.data, fileTypeHint: "mp3")
                    self.audioPlayer?.numberOfLoops = 10
                    self.audioPlayer?.play()
                    
                } catch {
                    print("Couldn't play audio. Error: \(error)")
                }
                
            } else {
                print("No audio file found")
            }
        }
        .onDisappear {
            if let player = audioPlayer {
                player.setVolume(0, fadeDuration: 1)
                DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                    player.stop()
                }
            }
        }
    }
}

struct FlowerDayGamePage_Previews: PreviewProvider {
    static var previews: some View {
        FloweryDayGamePage(hasWindow: true)
    }
}
