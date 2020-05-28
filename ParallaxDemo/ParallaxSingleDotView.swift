import UIKit

class ParallaxSingleDotView: UIView {
    var dotView = UIView()
    let dotSize: CGFloat = 50
    
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
    
    private func configureViews() {
        configureButton()
        configureDotView()
    }
    
    @objc func buttonTapped() {
        dotView.removeFromSuperview()
        configureDotView()
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
    
    private func configureDotView() {
        dotView = UIView()
        dotView.backgroundColor = .systemGreen
        dotView.layer.cornerRadius = dotSize / 2
        
        addParallaxToView(view: dotView, amount: 100)
        
        addSubview(dotView)
        constrainDotView()
    }
    
    private func constrainDotView() {
        dotView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dotView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dotView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            dotView.heightAnchor.constraint(equalToConstant: dotSize),
            dotView.widthAnchor.constraint(equalToConstant: dotSize),
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
