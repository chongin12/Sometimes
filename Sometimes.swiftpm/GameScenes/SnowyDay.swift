import SwiftUI
import SpriteKit

final class SnowyDayGameScene: SKScene {
    
    private let snowmanBodies = ["snowball", "snowball_0"]
    private let snowmanFaces = ["snowman_face_0", "snowman_face_1"]
    
    private let random: () -> CGFloat = Util.random
    private let randomBetween: (CGFloat, CGFloat) -> CGFloat = Util.randomBetween
    
    private var phase: Int = 0

    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "snowbackground")
        size = Util.ScreenSize
        scene?.anchorPoint = .zero
        backgroundColor = .black
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody?.friction = 1.0

        background.size = CGSize(width: size.width + 10, height: size.height / 6)
        background.position = CGPoint(x: size.width/2, y: 0)
        addChild(background)
        background.zPosition = -1
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(addSnowFlake), SKAction.wait(forDuration: 0.01)])))
    }

    private func addSnowFlake() {
        let snowFlakeNode = SKSpriteNode(imageNamed: "snowflake.png")
        let side: CGFloat = randomBetween(20, 40)
        snowFlakeNode.size = CGSize(width: side, height: side)
        
        let actualX = randomBetween(snowFlakeNode.size.width / 2, size.width - snowFlakeNode.size.width / 2)
        snowFlakeNode.position = CGPoint(x: actualX, y: size.height)
        snowFlakeNode.zPosition = -2
        
        addChild(snowFlakeNode)
        
        let actualDuration = randomBetween(3.0, 4.0)
        
        let actionMove = SKAction.move(to: CGPoint(x: actualX + randomBetween(-5, 5), y: snowFlakeNode.size.height / 2), duration: TimeInterval(actualDuration))
        
        let actionRotate = SKAction.rotate(byAngle: CGFloat(6) * (random() - 0.5), duration: TimeInterval(2))
        
        let actionMoveDone = SKAction.removeFromParent()
        
        snowFlakeNode.run(SKAction.repeatForever(SKAction.sequence([actionRotate, SKAction.wait(forDuration: 0.01)])))
        snowFlakeNode.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location = touches.first?.location(in: self) else { return }
        touchesAt(location)
    }
    
    public func touchesAt(_ point: CGPoint) {
        if phase == 0 {
            addSnowmanBody(point)
            phase = 1
        } else {
            addSnowmanFace(point)
            phase = 0
        }
    }
    
    private func addSnowmanBody(_ point: CGPoint) {
        let randomNum = Int(random() * CGFloat(snowmanBodies.count))
        let node = SKSpriteNode(imageNamed: snowmanBodies[randomNum])
        let side: CGFloat = randomBetween(80, 90)
        node.size = .init(width: side, height: side)
        addChild(node)
        node.physicsBody = SKPhysicsBody(polygonFrom: makeHexagon(side/2))
        node.physicsBody?.restitution = 0.2
        node.position = CGPoint(x: point.x, y: size.height - node.size.height / 2)
        node.alpha = 1.0
        
        let actionFadeOut = SKAction.fadeOut(withDuration: 1.5)
        
        let actionRemove = SKAction.removeFromParent()
        
        node.run(SKAction.sequence([.wait(forDuration: 60.0), actionFadeOut, actionRemove]))
    }
    
    private func addSnowmanFace(_ point: CGPoint) {
        let randomNum = Int(random() * CGFloat(snowmanFaces.count))
        let node = SKSpriteNode(imageNamed: snowmanFaces[randomNum])
        let side: CGFloat = randomBetween(70, 80)
        node.size = .init(width: side, height: side)
        addChild(node)
        node.physicsBody = SKPhysicsBody(polygonFrom: makeHexagon(side/3))
        node.physicsBody?.restitution = 0.2
        node.position = CGPoint(x: point.x, y: size.height - node.size.height / 2)
        node.alpha = 1.0
        
        let actionFadeOut = SKAction.fadeOut(withDuration: 1.5)
        
        let actionRemove = SKAction.removeFromParent()
        
        node.run(SKAction.sequence([.wait(forDuration: 60.0), actionFadeOut, actionRemove]))
    }
    
    private func makeHexagon(_ radius: CGFloat) -> CGPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: radius, y: 0))
        for i in 1...5 {
            let angle = CGFloat(i) * CGFloat.pi / 3.0
            let x = radius * cos(angle)
            let y = radius * sin(angle)
            path.addLine(to: CGPoint(x: x, y: y))
        }
        path.close()
        
        return path.cgPath
    }


}

