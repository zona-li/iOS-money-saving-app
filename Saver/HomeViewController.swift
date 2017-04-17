

import UIKit

class HomeViewController: UIViewController {
  
  
  @IBOutlet var addItemView: UIView!
  @IBOutlet weak var visualEffectView: UIVisualEffectView!
  var effect: UIVisualEffect!

  override func viewDidLoad() {
    super.viewDidLoad()
    effect = visualEffectView.effect
    visualEffectView.effect = nil
    addItemView.layer.cornerRadius = 5
  }
  
  /**
   Function to animate in the "add saving amount" window
   */
  func animateIn() {
    self.view.addSubview(addItemView)
    addItemView.center = self.view.center
    
    addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
    addItemView.alpha = 0
    
    UIView.animate(withDuration: 0.4) {
      self.visualEffectView.effect = self.effect
      self.addItemView.alpha = 2
      self.addItemView.transform = CGAffineTransform.identity
    }
  }
  
  /**
   Function to animate out the "add saving amount" window
   when user clicks the confirm button.
   */
  func animateOut() {
    UIView.animate(withDuration: 0.3, animations: {
      self.addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
      self.addItemView.alpha = 0
      self.visualEffectView.effect = nil
    }) { (success: Bool) in self.addItemView.removeFromSuperview()}
  }
  

  @IBAction func addItem(_ sender: Any) {
    animateIn()
  }
  
  @IBAction func dismissPopUp(_ sender: Any) {
    var currentAmount = Double(self.totalSavings.text!)
    if amount.text != "" {
      currentAmount = Double(amount.text!)! + currentAmount!
      self.totalSavings.text = "\(currentAmount!)"
    }
    amount.text = nil
    animateOut()
  }
  
  @IBOutlet weak var amount: UITextField!
  @IBOutlet weak var totalSavings: UILabel!
  
    

  
}
