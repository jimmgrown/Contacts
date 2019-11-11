//
//  TextTableViewCell.swift
//  Contacts
//
//  Created by Sergey on 10.11.2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var anyTextLabel: UILabel!
    
    @IBOutlet weak var anyNumberLabel: UILabel!
    
    func setup(with text: String){
        anyTextLabel.text = text
    }
    
    func setupNumber(with text: String){
        anyNumberLabel.text = text
    }

}
