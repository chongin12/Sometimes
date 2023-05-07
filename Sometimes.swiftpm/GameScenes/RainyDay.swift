import SwiftUI
import SpriteKit

class RainyDayGameScene: SKScene {
    let random: () -> CGFloat = Util.random
    let randomBetween: (CGFloat, CGFloat) -> CGFloat = Util.randomBetween
    
    private var windStrength: CGFloat = 0.0
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .black
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(addRaindrops), SKAction.wait(forDuration: 0.007)])))
    }
    
    private func addRaindrops() {
        let raindropNode = SKSpriteNode(imageNamed: "raindrop.png")
        let side: CGFloat = randomBetween(0.02, 0.03)
        raindropNode.size = CGSize(width: side/4, height: side*2)
        raindropNode.zRotation = windStrength
        
        let actualX = randomBetween(-size.width / 2, size.width + size.width / 2)
        raindropNode.position = CGPoint(x: actualX, y: size.height)
        
        addChild(raindropNode)
        
        let actualDuration = randomBetween(0.4, 0.6)
        
        let actionMove = SKAction.move(to: CGPoint(x: actualX + randomBetween(-0.08, 0.08) + windStrength, y: raindropNode.size.height / 2), duration: TimeInterval(actualDuration))
        
        let actionMoveDone = SKAction.removeFromParent()

        raindropNode.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location = touches.first?.location(in: self) else { return }
        touchesAt(location)
    }
    
    public func touchesAt(_ point: CGPoint) {
        reRandomizeWindStrength()
    }
    
    private func reRandomizeWindStrength() {
        let side: CGFloat = 0.07
        let arrowNode = SKSpriteNode(imageNamed: "arrow")
        arrowNode.size = CGSize(width: side, height: side)
        arrowNode.position = .init(x: side / 2, y: size.height - side / 2)
        arrowNode.zRotation = windStrength + .pi / 2 * 3
        arrowNode.zPosition = 33
        arrowNode.alpha = 0.0
        addChild(arrowNode)
        windStrength = randomBetween(-0.5, 0.5)
        
        let actionFadeIn = SKAction.fadeIn(withDuration: 0.2)
        let actionRotate = SKAction.rotate(toAngle: windStrength + .pi / 2 * 3, duration: 0.3)
        let actionFadeOut = SKAction.fadeOut(withDuration: 0.2)
        let actionRotateDone = SKAction.removeFromParent()
        arrowNode.run(.sequence([actionFadeIn, actionRotate, actionFadeOut, actionRotateDone]))
    }
}

