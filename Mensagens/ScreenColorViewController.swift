
import UIKit

class ScreenColorViewController: BaseViewController {
    
    @IBOutlet weak var viBorder: UIView!
    @IBOutlet weak var swWhiteBorder: UISwitch!
    @IBOutlet weak var btchangeButton: UIButton!
    @IBOutlet weak var viSwitcher: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func changeButton() {
        btchangeButton.layer.cornerRadius = 10
        btchangeButton.titleLabel?.font = .systemFont(ofSize: 20)
        btchangeButton.backgroundColor = .black
        btchangeButton.setTitleColor(.white, for: .normal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ResultViewController
        vc.message = message
        vc.useWhiteBorder = swWhiteBorder.isOn
    }
    
    private func setup() {
        changeButton()
        lbMessage.text = message.text
        lbMessage.textColor = message.textColor
        lbMessage.backgroundColor = message.backgroundColor
        viSwitcher.backgroundColor = .white.withAlphaComponent(0.5)
    }
    
    @IBAction func changeBorder(_ sender: UISwitch) {
        viBorder.backgroundColor = sender.isOn ? .white : .clear
    }
}

extension ScreenColorViewController: ColorPickerDelegate {
    func applyColor(color: UIColor) {
        view.backgroundColor = color
        message.screenColor = color
    }
}

