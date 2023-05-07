import SpriteKit

class SnowyDayIntroScene: SKScene {
    let gameScene = SnowyDayGameScene(size: Util.ScreenSize)
    
    override func didMove(to view: SKView) {
        size = Util.ScreenSize
        anchorPoint = .zero
        self.view?.presentScene(gameScene, transition: .crossFade(withDuration: 1.0))
    }
    
    public func touchesAt(point: CGPoint) {
        gameScene.touchesAt(CGPoint(x: point.x * size.width, y: point.y * size.height))
    }
}
