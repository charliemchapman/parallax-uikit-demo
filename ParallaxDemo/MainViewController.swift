import UIKit

class MainViewController: UIViewController {
    let parallaxDots = ParallaxDotsView()
    let darkCard = DarkCardView()
    let darkCard2 = DarkCardView2()
    
    
    
    override func viewDidLoad() {
        configureViews()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get { .lightContent }
    }
    
    private func configureViews() {
        configureGradient()
        //configureParallaxDots()
//        configureDarkCard()
        configureDarkCard2()
        
        constrainViews()
    }
    
    private func constrainViews() {
//        constrainParallaxDots()
//        constrainDarkCard()
        constrainDarkCard2()
    }
    
    // MARK: Configure Views
    
    private func configureGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor(red: 84/256, green: 20/256, blue: 163/256, alpha: 1).cgColor,
            UIColor(red: 23/256, green: 3/256, blue: 49/256, alpha: 1).cgColor
        ]
        
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    private func configureParallaxDots() {
        parallaxDots.layer.cornerRadius = 40
        parallaxDots.clipsToBounds = true
        view.addSubview(parallaxDots)
    }
    
    private func configureDarkCard() {
        view.addSubview(darkCard)
    }
    
    private func configureDarkCard2() {
        view.addSubview(darkCard2)
    }
    
    // MARK: Constrain Views
    
    private func constrainParallaxDots() {
        parallaxDots.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            parallaxDots.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            parallaxDots.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            parallaxDots.heightAnchor.constraint(equalToConstant: 200),
            parallaxDots.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func constrainDarkCard() {
        darkCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            darkCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            darkCard.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func constrainDarkCard2() {
        darkCard2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            darkCard2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            darkCard2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
