import UIKit

struct Dot {
    var size: CGFloat
    var offsetY: CGFloat
    var offsetX: CGFloat
    var parallaxAmount: Int
    var color: UIColor
    var dotView: UIView = UIView()
}

class ParallaxDotsView: UIView {
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 10/255, green: 1/255, blue: 23/255, alpha: 1)
        layer.cornerRadius = 40
        clipsToBounds = true
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func getDot() -> Dot {
        let colors: [UIColor] = [.systemPurple, .systemPink, .systemGreen, .systemRed, .systemBlue, .systemTeal, .systemIndigo, .systemOrange, .systemYellow]
        return Dot(size: CGFloat(Int.random(in: 2...30)),
                   offsetY: CGFloat(Float.random(in: -120...120)),
                   offsetX: CGFloat(Float.random(in: -120...120)),
                   parallaxAmount: Int.random(in: 10...200),
                   color: colors[Int.random(in: 0...(colors.count-1))])
    }
    
    private func configureViews() {
        configureButton()
        setUpDots()
    }
    
    @objc func buttonTapped() {
        dots.forEach { (dot) in
            dot.dotView.removeFromSuperview()
        }
        dots = []
        setUpDots()
    }
    
    private func configureButton() {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 200),
            button.widthAnchor.constraint(equalToConstant: 200),
        ])
    }

    var dots: [Dot] = []
    private func setUpDots() {
        for _ in 0...10 {
            dots.append(getDot())
        }
        
        dots.forEach { (dot) in
            configureDotView(dot)
            constrainDotView(dot)
        }
    }
    
    private func configureDotView(_ dot: Dot) {
        dot.dotView.backgroundColor = dot.color
        dot.dotView.layer.cornerRadius = dot.size / 2
        
        addParallaxToView(view: dot.dotView, amount: dot.parallaxAmount)
        
        addSubview(dot.dotView)
    }
    
    private func constrainDotView(_ dot: Dot) {
        dot.dotView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dot.dotView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: dot.offsetX),
            dot.dotView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: dot.offsetY),
            dot.dotView.heightAnchor.constraint(equalToConstant: dot.size),
            dot.dotView.widthAnchor.constraint(equalToConstant: dot.size),
        ])
    }
    
    private func addParallaxToView(view: UIView?, amount: Int) {
        guard let view = view else { return }

        let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -amount
        horizontal.maximumRelativeValue = amount

        let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -amount
        vertical.maximumRelativeValue = amount

        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontal, vertical]
        view.addMotionEffect(group)
    }
}
