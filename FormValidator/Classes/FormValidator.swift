//
//
//  FormValidator.swift
//
//
//  Created by Miguel Pescadinha on 26/08/16.
//  Copyright © 2016 Miguel Pescadinha. All rights reserved.
//

import UIKit

protocol FormValidatorDelegate {
    func onPasswordFieldError()
    func onEmailValidationError()
    func onRequiredFieldsError()
    func onValidationSuccessful()
}

class FormValidator {
    
    private var formValidatorDelegate : FormValidatorDelegate?
    
    //REQUIRED FIELDS VALIDATION
    private var requiredFields : [FVModelField]?
    private var setError : Bool = false
    
    //EMAIL VALIDATION
    private var emailField : UITextField?
    private var emailRegex : String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
    //PASSWORD VALIDATION
    private var passwordField : UITextField?
    private var minLength : Int?
    
    init(formValidatorDelegate : FormValidatorDelegate){
        self.formValidatorDelegate = formValidatorDelegate
    }
    
    /*SETTING THE REQUIRED FIELDS METHODS */
    func setRequiredFields(requiredFields : [FVModelField]) -> FormValidator {
        self.requiredFields = requiredFields
        return self
    }
    
    func setRequiredFields(requiredFields : [FVModelField], setError : Bool) -> FormValidator {
        self.requiredFields = requiredFields
        self.setError = setError
        return self
    }
    
    /*SETTING EMAIL FIELD METHODS */
    func setEmailField(emailField : UITextField) -> FormValidator{
        self.emailField = emailField
        return self
    }
    
    func setEmailField(emailField : UITextField, emailRegex : String) -> FormValidator {
        self.emailField = emailField
        self.emailRegex = emailRegex
        return self
    }
    
    /*SETTING PASSWORD FIELD*/
    func setPasswordField(passwordField : UITextField) -> FormValidator {
        self.passwordField = passwordField
        return self
    }
    
    func setPasswordField(passwordField : UITextField, minLength : Int) -> FormValidator{
        self.passwordField = passwordField
        self.minLength = minLength
        return self
    }
    
    /*VALIDATION METHOD*/
    func validate() {
        
        if formValidatorDelegate == nil {
            print("IMPLEMENT FORMVALIDORDELEGATE PLEASE!!")
            return
        }
        
        //1st checking for required fields
        if !validateRequiredFields() {
            formValidatorDelegate?.onRequiredFieldsError()
            return
        }
        
        //2nd check for a valid email if exists
        if !validateEmail() {
            formValidatorDelegate?.onEmailValidationError()
            return
        }
        
        formValidatorDelegate?.onValidationSuccessful()
    }
    
    private func validateEmail() -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluateWithObject(emailField!.text)
    }
    
    private func validateRequiredFields() -> Bool {
        var isValid : Bool = true
        
        for field in requiredFields! {
            field.field!.layer.borderWidth = 0
        }
        
        var emptyFields : [AnyObject] = []
        
        if requiredFields != nil {
            for field in requiredFields! {
                if field.field is UITextField {
                    let f : UITextField = field.field as! UITextField
                    if f.text == "" || f.text == field.initialString || f.text == field.customEmptyString {
                        isValid = false
                        
                        if setError {
                            emptyFields.append(f)
                        }
                    }
                } else if field.field is UISwitch {
                    if !(field.field as! UISwitch).on {
                        isValid = false
                        
                        if setError {
                            emptyFields.append(field.field!)
                        }
                    }
                } else if field.field is UIButton {
                    let f : UIButton = field.field as! UIButton
                    if f.titleLabel!.text == "" || f.titleLabel!.text == field.initialString || f.titleLabel!.text == field.customEmptyString {
                        isValid = false
                        
                        if setError {
                            emptyFields.append(f)
                        }
                    }
                }
            }
        }
        
        if setError {
            for field in emptyFields {
                field.layer.borderColor = UIColor.redColor().CGColor
                field.layer.borderWidth = 1
            }
        }
        
        return isValid
    }
}
