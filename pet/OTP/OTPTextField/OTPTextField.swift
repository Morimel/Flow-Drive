//
//  OTPTextField.swift
//  pet
//
//  Created by Isa Melsov on 23/11/24.
//

import UIKit

class OTPTextField: UITextField {
    weak var backDelegate: OTPFieldDelegate?
    override func deleteBackward() {
        super.deleteBackward()
        self.backDelegate?.backwardDeteced(textField: self)
    }
}
