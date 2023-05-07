import SwiftUI
import SpriteKit

class FloweryDayGameScene: SKScene {
    
    let random: () -> CGFloat = Util.random
    let randomBetween: (CGFloat, CGFloat) -> CGFloat = Util.randomBetween
    
    private let flowers = [0,1,2,3,4,5].map { num in
        "spring_flower_\(num)"
    }
    
    override func didMove(to view: SKView) {
        scene?.scaleMode = .aspectFill
        backgroundColor = .black
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(addPetal), SKAction.wait(forDuration: 0.03)])))
    }
    
    private func addPetal() {
        let petalNode = SKSpriteNode(imageNamed: "sakura.png")
        let side: CGFloat = randomBetween(0.02, 0.04)
        petalNode.size = CGSize(width: side, height: side)
        petalNode.alpha = 0.0
        
        let actualX = randomBetween(petalNode.size.width / 2, size.width - petalNode.size.width / 2)
        petalNode.position = CGPoint(x: actualX, y: size.height - petalNode.size.height / 2 - randomBetween(0.001, 0.200))
        
        addChild(petalNode)
        
        let actionFadeIn = SKAction.fadeIn(withDuration: 5.0)
        
        let actualDuration = randomBetween(3.0, 4.0)
        
        let actionMove = SKAction.move(to: CGPoint(x: actualX + randomBetween(-0.05, 0.05), y: petalNode.size.height / 2), duration: TimeInterval(actualDuration))
        
        
        let actionFadeOut = SKAction.fadeOut(withDuration: 12.5)
        
        let actionRemove = SKAction.removeFromParent()
        
        petalNode.run(SKAction.sequence([actionFadeIn, actionMove, actionFadeOut, actionRemove]))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location = touches.first?.location(in: self) else { return }
        touchesAt(location)
    }
    
    public func touchesAt(_ point: CGPoint) {
        let side: CGFloat = randomBetween(0.04, 0.06)
        
        let randomFlowerNum = Int(random() * CGFloat(flowers.count))
        let node = SKSpriteNode(imageNamed: flowers[randomFlowerNum])
        node.position = point
        node.size = .init(width: side, height: side)
        node.alpha = 0.0
        
        let angle: CGFloat = random() > 0.5 ? 2.0 : -2.0
        
        let actionFadeIn = SKAction.fadeIn(withDuration: 5.0)
        let actionRotate = SKAction.rotate(byAngle: angle, duration: TimeInterval(5))
        let actionFadeOut = SKAction.fadeOut(withDuration: 12.5)
        let actionRemove = SKAction.removeFromParent()
        
        node.run(SKAction.repeatForever(SKAction.sequence([actionRotate, SKAction.wait(forDuration: 0.1)])))
        node.run(SKAction.sequence([actionFadeIn, actionFadeOut, actionRemove]))
        addChild(node)
    }
}

