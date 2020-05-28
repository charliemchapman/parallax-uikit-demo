import UIKit

class DarkCardView2: UIView {
    let cardWidth: CGFloat = 85.60
    let cardHeight: CGFloat = 53.98
    let cardCorner: CGFloat = 3.48
    let multiplier: CGFloat = 4
    
    let darkCardBackplateImageView = UIImageView()
    let darkCardReflectionImageView = UIImageView()
    let darkCardExtrusion = UIImageView()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .red
        layer.cornerRadius = cardCorner * multiplier
        clipsToBounds = true
        
        configureViews()
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureViews() {
        configureDarkCardReflection()
        configureDarkCardBackplate()
        configureDarkCardExtrusion()
    }
    
    private func constrainViews() {
        constrainDarkCardReflection()
        constrainDarkCardBackplate()
        constrainDarkCardExtrusion()
    }
    
    private func configureDarkCardBackplate() {
        darkCardBackplateImageView.image = UIImage(named: "darkcard-backplate-grid")
        addSubview(darkCardBackplateImageView)
    }
    
    private func configureDarkCardReflection() {
        darkCardReflectionImageView.image = UIImage(named: "darkcard-gradient")
        addSubview(darkCardReflectionImageView)
        
        addParallaxToView(view: darkCardReflectionImageView, amount: 500)
    }
    
    private func configureDarkCardExtrusion() {
        darkCardExtrusion.image = UIImage(named: "darkcard-extrusion")?.withRenderingMode(.alwaysTemplate)
        darkCardExtrusion.tintColor = UIColor.white.withAlphaComponent(0.75)
        addSubview(darkCardExtrusion)
    }
    
    private func constrainDarkCardBackplate() {
        darkCardBackplateImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            darkCardBackplateImageView.topAnchor.constraint(equalTo: topAnchor),
            darkCardBackplateImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            darkCardBackplateImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            darkCardBackplateImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            darkCardBackplateImageView.widthAnchor.constraint(equalToConstant: cardWidth * multiplier),
            darkCardBackplateImageView.heightAnchor.constraint(equalToConstant: cardHeight * multiplier),
        ])
    }
    
    private func constrainDarkCardReflection() {
        darkCardReflectionImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            darkCardReflectionImageView.centerXAnchor.constraint(equalTo: darkCardBackplateImageView.centerXAnchor),
            darkCardReflectionImageView.centerYAnchor.constraint(equalTo: darkCardBackplateImageView.centerYAnchor),
            darkCardReflectionImageView.heightAnchor.constraint(equalToConstant: 1000),
            darkCardReflectionImageView.widthAnchor.constraint(equalToConstant: 1000),
        ])
    }
    
    private func constrainDarkCardExtrusion() {
        darkCardExtrusion.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            darkCardExtrusion.topAnchor.constraint(equalTo: darkCardBackplateImageView.topAnchor),
            darkCardExtrusion.bottomAnchor.constraint(equalTo: darkCardBackplateImageView.bottomAnchor),
            darkCardExtrusion.leadingAnchor.constraint(equalTo: darkCardBackplateImageView.leadingAnchor),
            darkCardExtrusion.trailingAnchor.constraint(equalTo: darkCardBackplateImageView.trailingAnchor),
        ])
    }
    
    private func addParallaxToView(view: UIView?, amount: Int) {
        guard let view = view else { return }

        let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -amount
        horizontal.maximumRelativeValue = amount

        let vertical = UIInterpolatingMotionEffect(keyPath: "layer.transform.rotation.z", type: .tiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -2
        vertical.maximumRelativeValue = 2

        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontal, vertical]
        view.addMotionEffect(group)
    }
}
