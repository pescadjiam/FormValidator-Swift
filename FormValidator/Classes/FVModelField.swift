//
//  FVModelField.swift
//  FormValidator
//
//  Created by Miguel Pescadinha on 26/08/16.
//  Copyright © 2016 Miguel Pescadinha. All rights reserved.
//

import UIKit

class FVModelField {
    
    var field : AnyObject?
    var customEmptyString : String?
    var initialString : String?
    
    init(field : AnyObject, customEmptyString : String, initialString : String){
        self.field = field
        self.customEmptyString = customEmptyString
        self.initialString = initialString
    }
}
