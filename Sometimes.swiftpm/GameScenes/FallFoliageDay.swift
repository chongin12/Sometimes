import SwiftUI
import SpriteKit

class FallFoliageDayGameScene: SKScene {
    
    let random: () -> CGFloat = Util.random
    let randomBetween: (CGFloat, CGFloat) -> CGFloat = Util.randomBetween
    
    private let images: [String] = ["ginkgo_yellow_leaf", "maple_yellow_leaf", "maple_leaf", "maple_red_leaf"]
    
    private let nuts: [String] = ["acorn", "almond", "chestnut", "walnut"]
 
    override func didMove(to view: SKView) {
        size = Util.ScreenSize
        scene?.anchorPoint = .zero
        backgroundColor = .black
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(addLeaf), SKAction.wait(forDuration: 0.02)])))
    }
    
    private func addLeaf() {
        let randomIndex = Int(random() * CGFloat(images.count))
        let leafNode = SKSpriteNode(imageNamed: images[randomIndex])
        leafNode.yScale = -1
        let side: CGFloat = randomBetween(40, 70)
        leafNode.size = CGSize(width: side, height: side)
        leafNode.alpha = 0.0
        
        let actualX = randomBetween(leafNode.size.width / 2, size.width - leafNode.size.width / 2)
        leafNode.position = CGPoint(x: actualX, y: size.height - leafNode.size.height / 2 - randomBetween(1, size.height / 10))
        
        addChild(leafNode)
        
        let actionFadeIn = SKAction.fadeIn(withDuration: 5.0)
        
        let actualDuration = randomBetween(3.0, 4.0)
        
        let actionMove = SKAction.move(to: CGPoint(x: actualX + randomBetween(-5, 5), y: leafNode.size.height / 2), duration: TimeInterval(actualDuration))
        
        
        let actionFadeOut = SKAction.fadeOut(withDuration: 12.5)
        
        let actionRemove = SKAction.removeFromParent()
        
        leafNode.run(SKAction.sequence([actionFadeIn, actionMove, actionFadeOut, actionRemove]))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location = touches.first?.location(in: self) else { return }
        touchesAt(location)
    }
    
    public func touchesAt(_ point: CGPoint) {
        addNut(point) 
    }
    
    private func addNut(_ point: CGPoint) {
        let randomNutNum = Int(random() * CGFloat(nuts.count))
        let node = SKSpriteNode(imageNamed: nuts[randomNutNum])
        let side: CGFloat = randomBetween(30, 50)
        node.size = .init(width: side, height: side)
        addChild(node)
        node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2.0) 
        node.physicsBody?.restitution = 0.4
        node.position = CGPoint(x: point.x + random(), y: size.height - node.size.height)
        node.alpha = 1.0
        
        let actionFadeOut = SKAction.fadeOut(withDuration: 1.5)
        
        let actionRemove = SKAction.removeFromParent()
        
        node.run(SKAction.sequence([.wait(forDuration: 12.0), actionFadeOut, actionRemove]))
    }
 
}

