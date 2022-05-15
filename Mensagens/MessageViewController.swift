

import UIKit

class MessageViewController: BaseViewController {

    @IBOutlet weak var btChange: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        message = Message()
        changeButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MessageColorViewController
        vc.message = message
    }
    
    private func changeButton() {
        btChange.layer.cornerRadius = 10
        btChange.titleLabel?.font = .systemFont(ofSize: 20)
        btChange.backgroundColor = .black
        btChange.setTitleColor(.white, for: .normal)
        
    }
}
extension MessageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        message.text = textField.text!
        lbMessage.text = textField.text!
        
        textField.resignFirstResponder()
        
        return true
    }
    }

extension MessageViewController: ColorPickerDelegate {
    func applyColor(color: UIColor) {
        lbMessage.textColor = color
        message.textColor = color
    }
    
}
