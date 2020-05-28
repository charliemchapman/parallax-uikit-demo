import UIKit

class DarkCardView: UIView {
    let cardWidth: CGFloat = 85.60
    let cardHeight: CGFloat = 53.98
    let cardCorner: CGFloat = 3.48
    let multiplier: CGFloat = 4
    
    let darkCardBackplateImageView = UIImageView()
    let darkCardReflectionImageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)
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
    }
    
    private func constrainViews() {
        constrainDarkCardReflection()
        constrainDarkCardBackplate()
    }
    
    private func configureDarkCardBackplate() {
        darkCardBackplateImageView.image = UIImage(named: "darkcard-backplate")
        addSubview(darkCardBackplateImageView)
    }
    
    private func configureDarkCardReflection() {
        darkCardReflectionImageView.image = UIImage(named: "darkcard-reflection")?.withRenderingMode(.alwaysTemplate)
        darkCardReflectionImageView.tintColor = .white
        addSubview(darkCardReflectionImageView)
        
        addParallaxToView(view: darkCardReflectionImageView, amount: 10)
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
            darkCardReflectionImageView.topAnchor.constraint(equalTo: darkCardBackplateImageView.topAnchor),
            darkCardReflectionImageView.bottomAnchor.constraint(equalTo: darkCardBackplateImageView.bottomAnchor),
            darkCardReflectionImageView.leadingAnchor.constraint(equalTo: darkCardBackplateImageView.leadingAnchor),
            darkCardReflectionImageView.trailingAnchor.constraint(equalTo: darkCardBackplateImageView.trailingAnchor),
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
