//
//  EnterNameVC.swift
//  Contacts
//
//  Created by Sergey on 10.11.2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

protocol TextDrawable: class  {
    func showText(_ text: String?)
    func showTextNumber(_ text: String?)
}
class EnterNameVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func editTextField(_ sender: Any) {
        changeSaveButton()
    }
    @IBAction func editTextNumber(_ sender: Any) {
        changeSaveButton()
    }
    weak var delegate: TextDrawable?
    
    func changeSaveButton(){
        if nameTextField.hasText && numberTextField.hasText{
            saveButton.isEnabled = true
        }
        else{
            saveButton.isEnabled = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = Name.shared.value
        numberTextField.text = Name.sharedNumber.value
    }
    @IBAction func saveName(_ sender: Any) {
        delegate?.showTextNumber(numberTextField.text)
        delegate?.showText(nameTextField.text)
        self.navigationController?.popViewController(animated: true)
    }

}

