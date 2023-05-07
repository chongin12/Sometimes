import SpriteKit

class RainyDayIntroScene: SKScene {
    let gameScene = RainyDayGameScene()
    override func didMove(to view: SKView) {
        self.view?.presentScene(gameScene, transition: .crossFade(withDuration: 1.0))
    }
    
    public func touchesAt(point: CGPoint) {
        gameScene.touchesAt(point)
    }
}
