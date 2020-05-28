import UIKit

class CardViewController: UIViewController {
    let mainView: UIView
    
    init(title: String, mainView: UIView) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
        
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        configureViews()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get { .lightContent }
    }
    
    private func configureViews() {
        configureGradient()
        configureMainView()
        
        constrainViews()
    }
    
    private func constrainViews() {
        constrainMainView()
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
    
    private func configureMainView() {
        view.addSubview(mainView)
    }
    
    // MARK: Constrain Views
    
    private func constrainMainView() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
