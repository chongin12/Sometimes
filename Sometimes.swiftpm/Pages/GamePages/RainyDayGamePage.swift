import SwiftUI
import SpriteKit
import AVFoundation

struct RainyDayGamePage: View {
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    @State private var isShowingHint = true
    @State private var height: Double = 1.0
    let introScene = RainyDayIntroScene()
    var hasWindow: Bool = true
    @State private var audioPlayer: AVAudioPlayer?
    var body: some View {
        GeometryReader { g in
            ZStack {
                SpriteView(scene: introScene)
                WaveView(height: $height)
                    .task {
                        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                            self.height += 0.001
                        }
                    }
                    .onTapGesture(count: 1, coordinateSpace: .named("screen")) { location in
                        let frame = g.frame(in: .named("screen"))
                        let newLocation = CGPoint(
                            x: location.x / frame.width,
                            y: 1 - location.y / frame.height
                        )
                        introScene.touchesAt(point: newLocation)
                    }
                if hasWindow {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.black)
                        if isShowingHint {
                            VStack {
                                Text("Chapter 2. Rainy Day")
                                    .font(.largeTitle)
                                Spacer()
                                    .frame(width: .infinity, height: 250, alignment: .center)
                                Text("(1) Drag : You can move the window by dragging.")
                                    .font(.title2)
                                    .padding()
                                Text("(2) Tap : Tap inside the window to change wind direction")
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
            if let song = NSDataAsset(name: "SummerMusic") {
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


struct WaveView: View {
    @Binding var height: Double
    var rgbColor1 = Color.init(red: 102/255, green: 102/255, blue: 204/255)
    var rgbColor2 = Color.init(red: 102/255, green: 102/255, blue: 221/255)
    var rgbColor3 = Color.init(red: 102/255, green: 102/255, blue: 238/255)
    var rgbColor4 = Color.init(red: 102/255, green: 102/255, blue: 255/255)
    var body: some View {
        ZStack {
            FilledWave(height: $height, color: rgbColor1.opacity(1), isReversed: false)
            FilledWave(height: $height, rate: 7.0, color: rgbColor2.opacity(0.5), isReversed: false)
            FilledWave(height: $height, rate: 8.0, color: rgbColor3.opacity(0.2), isReversed: true)
            FilledWave(height: $height, rate: 7.0, color: rgbColor4.opacity(0.5), isReversed: true)
        }
    }
}


struct FilledWave: View {
    @Binding var height: Double
    var rate: Double = 8.0
    var color: Color
    var isReversed: Bool
    var body: some View {
        TimelineView(.animation){ timeline in
            Canvas { context, size in
                let timeNow = timeline.date.timeIntervalSinceReferenceDate
                let remain = timeNow.remainder(dividingBy: rate)
                let offset = remain * size.width * 1 / rate
                context.translateBy(x: isReversed ? -offset: offset, y: 0)
                context.fill(getPath(size: size, height : height), with: .color(color))
                
                context.translateBy(x: -size.width, y: 0)
                context.fill(getPath(size: size, height : height), with: .color(color))
                
                context.translateBy(x: size.width * 2, y: 0)
                context.fill(getPath(size: size, height : height), with: .color(color))
            }
        }
    }
    
    func getPath(size: CGSize, height: Double) -> Path {
        
        return Path { path in
            
            let reversedHeight = size.height / height
            let width = size.width + 0.3  
            
            path.move(to: CGPoint(x: 0, y: reversedHeight))
            
            path.addCurve(
                to: CGPoint(x: width, y: reversedHeight),
                control1: CGPoint(x: width * 0.4, y: reversedHeight + 60),
                control2: CGPoint(x: width * 0.65, y: reversedHeight - 60)
            )
            
            path.addLine(to: CGPoint(x:width, y: size.height))
            path.addLine(to: CGPoint(x:0, y: size.height))
        }
    }
}

struct RainyDayGamePage_Previews: PreviewProvider {
    static var previews: some View {
        RainyDayGamePage(hasWindow: true)
    }
}
