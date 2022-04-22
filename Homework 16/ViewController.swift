import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var burgerButton: UIImageView!
    @IBOutlet weak var blur: UIVisualEffectView!
    
    private var menuView: UIView!
    private var menuLabel = UILabel()
    private var alertButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blur.frame = view.frame
        
        burgerButton.frame = CGRect(x: view.bounds.maxX / 20, y: view.bounds.maxY / 40, width: view.bounds.maxX / 10, height: view.bounds.maxY / 10)
        burgerButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openBurgerMenu)))
        burgerButton.isUserInteractionEnabled = true
        view.addSubview(burgerButton)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeBurgerMenu)))
        
        menuView = UIView(frame: CGRect(x: -(self.view.bounds.maxX / 3 * 2), y: 0, width: self.view.bounds.maxX / 3 * 2 , height: view.bounds.maxY))
        menuView.backgroundColor = .systemYellow
        view.addSubview(menuView)
        
        menuLabel.frame = CGRect(x: view.bounds.maxX / 15, y: view.bounds.maxY / 30, width: view.bounds.maxX / 2, height: view.bounds.maxY / 10)
        menuLabel.text = "Menu"
        menuLabel.font = menuLabel.font.withSize(20)
        menuView.addSubview(menuLabel)
        
        alertButton.frame = CGRect(x: view.bounds.maxX / 15, y: view.bounds.maxY / 4, width: view.bounds.maxX / 5, height: view.bounds.maxY / 15)
        alertButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(alertCall)))
        alertButton.backgroundColor = .white
        alertButton.setTitle("Alert", for: .normal)
        alertButton.setTitleColor(UIColor.black, for: .normal)
        menuView.addSubview(alertButton)
        
    }
    
    @objc private func openBurgerMenu () {
        
        UIView.animate(withDuration: 0.3) {
            self.menuView.transform = CGAffineTransform(translationX: (self.view.bounds.maxX / 3 * 2), y: 0)
            self.blur.alpha = 1
            self.blur.isHidden = false
            self.burgerButton.alpha = 0
            self.burgerButton.isHidden = true
        }
    }
    
    @objc private func closeBurgerMenu () {
        if burgerButton.alpha == 0 {
            UIView.animate(withDuration: 0.3){
                self.menuView.transform = CGAffineTransform(translationX: -(self.view.bounds.maxX / 3 * 2), y: 0)
                self.blur.alpha = 0
                self.blur.isHidden = true
                self.burgerButton.alpha = 1
                self.burgerButton.isHidden = false
                
            }
        }
    }
    @objc private func alertCall () {
        self.showAlert(title: "WOW", text: "Cool")
        
    }
}

