import UIKit

class MainTabController: UITabBarController {
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.addChild(CardViewController(title: "Dot", mainView: ParallaxSingleDotView()))
        self.addChild(CardViewController(title: "Dots", mainView: ParallaxDotsView()))
        self.addChild(CardViewController(title: "Card 1", mainView: DarkCardView()))
        self.addChild(CardViewController(title: "Card 2", mainView: DarkCardView2()))
        
        self.tabBar.barStyle = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
