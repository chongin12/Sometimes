import SwiftUI

public class Util {
    static func random() -> CGFloat { // random float between 0 ~ 1
        return CGFloat(Float(arc4random()) / Float(0xFFFFFFFF))  
    }
    static func randomBetween(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max-min) + min
    }
    static let screenSide = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
    static let ScreenSize = CGSize(width: screenSide, height: screenSide)
}
