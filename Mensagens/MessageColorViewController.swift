

import UIKit

class MessageColorViewController: BaseViewController {
    
    @IBOutlet weak var btChange: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeButton()
        lbMessage.text = message.text
        lbMessage.textColor = message.textColor
        lbMessage.backgroundColor = message.backgroundColor
        
    }
    
    private func changeButton() {
        btChange.layer.cornerRadius = 10
        btChange.titleLabel?.font = .systemFont(ofSize: 20)
        btChange.backgroundColor = .black
        btChange.setTitleColor(.white, for: .normal)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ScreenColorViewController
        vc.message = message
    }
}

extension MessageColorViewController: ColorPickerDelegate {
    func applyColor(color: UIColor) {
        lbMessage.backgroundColor = color
        message.backgroundColor = color
    }
}

