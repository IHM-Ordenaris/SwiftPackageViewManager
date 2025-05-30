//
//  EnumsTextField.swift
//  ViewManagerSP
//
//  Created by Ignacio Hernández on 25/11/24.
//

import Foundation
import UIKit


//MARK: - Enum State TextField
public enum EnumStateTxtBait: Int {
    case enable = 1
    case disable = 2
    case focus = 3
    case error = 0
    
    func getColorTitle(onlyLight:Bool) -> UIColor? {
        switch self {
        case .enable:
            return  UIColor.baitColor_textFieldTITLE(onlyLight: onlyLight)
        default:
            return UIColor.baitColor_textFieldTITLE(onlyLight: onlyLight)
        }
    }
    
    func getColorBorde(onlyLight:Bool) -> UIColor? {
        switch self {
        case .error:
            return UIColor.baitColor_textFieldErrorBORDER(onlyLight: onlyLight)
        default:
            return UIColor.baitColor_textFieldBORDER(onlyLight: onlyLight)
        }
    }
    
    func getColorPrompt(onlyLight:Bool) -> UIColor? {
        return  UIColor.baitColor_TextFieldTEXT(onlyLight: onlyLight)
    }
    
    func getColorTexto(onlyLight:Bool) -> UIColor? {
        switch self {
        case .enable:
            return  UIColor.baitColor_TextFieldTEXT(onlyLight: onlyLight)
        default:
            return  UIColor.baitColor_TextFieldTEXT(onlyLight: onlyLight)
        }
    }
    
    func getColorBG(onlyLight:Bool) -> UIColor? {
        switch self {
        case .enable:
            return  UIColor.baitColor_TextFieldBG(onlyLight: onlyLight)
        default:
            return  UIColor.baitColor_TextFieldBG(onlyLight: onlyLight)
        }
    }
    
    func getColorTextoSoporte(onlyLight:Bool) -> UIColor? {
        switch self {
        case .error:
            return UIColor.baitColor_TextFieldErrorSUPPORT(onlyLight: onlyLight)
        default:
            return UIColor.baitColor_TextFieldErrorSUPPORT(onlyLight: onlyLight)
        }
    }
    
    func getWidthBorder() -> CGFloat? {
        switch self {
        case .enable:
            return Constants.borderWidthTextField
        default:
            return Constants.borderWidthTextField
        }
    }
}


//MARK: - Enum Type TextField
public enum EnumTypeTxtBait: Int {
    case text       = 1
    case phone      = 2
    case psswrd     = 3
    case email      = 4
    case list       = 5
    case number     = 6
    
    func isValid(_ text: String) -> Bool? {
        switch self {
        case .text:
            return isValidText(str: text)
        case .phone:
            return isValidPhone(phone: text)
        case .psswrd:
            return isValidPwd(pwd: text)
        case .email:
            return isValidEmail(email: text)
        case .list:
            return isValidList(str: text)
        case .number:
            return isValidNumber(number: text)
        }
    }
    
    func isValidText(str: String)-> Bool {
//        let regex = Constants.Regex.text
//        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
//        return predicate.evaluate(with: str)
        return true
    }
    
    func isValidPhone(phone: String) -> Bool {
        let regex = Constants.Regex.phone10
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return predicate.evaluate(with : phone)
    }
    
    func isValidEmail(email: String) -> Bool{
        let regex = Constants.Regex.mail
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return predicate.evaluate(with: email)
    }
    
    func isValidPwd(pwd: String) -> Bool{
        let regex = Constants.Regex.pwd
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return predicate.evaluate(with: pwd)
    }
    
    func isValidList(str: String) -> Bool{
        return true
    }
    
    func isValidName(name: String) -> Bool {
//        let regex = ConstantsTextFields.RegexNameUser
//        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
//        return predicate.evaluate(with: name)
        return  true
    }
    
    func isValidNumber(number:String)->Bool{
//        let regex = ConstantsTextFields.RegexNumber
//        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
//        return predicate.evaluate(with: number)
        return  true
    }

    /// Obtiene e icono , dependiendo del tipo de textView seleccionado
    /// - Returns: - Retorna un UIImage
    func getImageLeft() -> UIImage? {
        switch self {
        case .phone:
            return UIImage.getAsset(name: "vm_icon_phone")
        case .email:
            return UIImage.getAsset(name: "vm_icon_mail")
        default:
            return UIImage()
        }
    }
    
    /// Obtiene e icono , dependiendo del tipo de textView seleccionado
    /// - Returns: - Retorna un UIImage
    func getImageRight() -> UIImage? {
        switch self {
        case .list:
            return UIImage.getAsset(name: "vm_icon_down")
        default:
            return UIImage()
        }
    }
    
    func getTitleDefault() -> String? {
        switch self {
        case .text:
            return "Tipo 1: Campo de Texto"
        case .phone:
            return "Tipo 2: Campo de Teléfono"
        case .psswrd:
            return "Tipo 3: Campo Password"
        case .email:
            return "Tipo 4: Campo de Email"
        case .list:
            return "Tipo 5: Campo de Lista"
        case .number:
            return "Tipo 6: Campo Number"
        }
    }
    
    func getMaxCharacters() -> Int {
        switch self {
        case .phone:
            return 10
        default:
            return 0
        }
    }
}
