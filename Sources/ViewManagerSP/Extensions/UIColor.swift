//
//  UIColor.swift
//  ViewManagerSP
//
//  Created by Ignacio Hernández on 20/11/24.
//

import UIKit

func getVersionColor(nombre:String) -> UIColor {
    // Una propiedad global para una fácil referencia
    let bundle = Bundle.module
    if #available(iOS 11.0, *) {
        return  UIColor(named: nombre, in: bundle, compatibleWith: nil) ?? UIColor.systemPink
    }else{
        return UIColor.clear
    }
}

@objc public extension UIColor {
    
    // MARK: - COLORS BUTTON PRIMARIO
    // BackGround
    class func baitColor_buttonPrimarioActiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Principal.activeBG)
    }
    class func baitColor_buttonPrimarioInactiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Principal.inactiveBG)
    }
    class func baitColor_buttonPrimarioBlackActiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Principal.Black.activeBG.rawValue)
    }
    class func baitColor_buttonPrimarioBlackInactiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Principal.Black.inactiveBG.rawValue)
    }
    // Título
    class func baitColor_buttonPrimarioActiveTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Principal.activeTXT)
    }
    class func baitColor_buttonPrimarioInactiveTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Principal.inactiveTXT)
    }
    class func baitColor_buttonPrimarioBlackActiveTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Principal.Black.activeTXT.rawValue)
    }
    class func baitColor_buttonPrimarioBlackInactiveTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Principal.Black.inactiveTXT.rawValue)
    }
    // Borde
    class func baitColor_buttonPrimarioActiveBORDER() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Principal.activeBORDER)
    }
    class func baitColor_buttonPrimarioInactiveBORDER() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Principal.inactiveBORDER)
    }
    class func baitColor_buttonPrimarioBlackActiveBORDER() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Principal.Black.activeBORDER.rawValue)
    }
    class func baitColor_buttonPrimarioBlackInactiveBORDER() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Principal.Black.inactiveBORDER.rawValue)
    }
    
    // MARK: - COLORS BUTTON SECUNDARIO
    // BackGround
    class func baitColor_buttonSecundarioActiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Secundario.activeBG.rawValue)
    }
    class func baitColor_buttonSecundarioInactiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Secundario.inactiveBG.rawValue)
    }
    // Título
    class func baitColor_buttonSecundarioActiveTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Secundario.activeTXT.rawValue)
    }
    class func baitColor_buttonSecundarioInactiveTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Secundario.inactiveTXT.rawValue)
    }
    // Borde
    class func baitColor_buttonSecundarioActiveBORDER() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Secundario.activeBORDER.rawValue)
    }
    class func baitColor_buttonSecundarioInactiveBORDER() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Secundario.inactiveBORDER.rawValue)
    }
    
    // MARK: - COLORS BUTTON TEXTO
    // Título
    class func baitColor_buttonTextoBlackTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Texto.blackTXT.rawValue)
    }
    class func baitColor_buttonTextoBlueTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Texto.blueTXT.rawValue)
    }
    class func baitColor_buttonTextoUnderlineTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Texto.underlineTXT.rawValue)
    }
    
    // MARK: - COLORS BUTTON AUX1
    // BackGround
    class func baitColor_buttonAux1ActiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Aux1.activeBG.rawValue)
    }
    class func baitColor_buttonAux1InactiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Aux1.inactiveBG.rawValue)
    }
    // Título
    class func baitColor_buttonAux1ActiveTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Aux1.activeTXT.rawValue)
    }
    
    // MARK: - COLORS BUTTON AUX2
    // BackGround
    class func baitColor_buttonAux2ActiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Aux2.activeBG.rawValue)
    }
    class func baitColor_buttonAux2InactiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Aux2.inactiveBG.rawValue)
    }
    // Título
    class func baitColor_buttonAux2ActiveTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Aux2.activeTXT.rawValue)
    }
    
    // MARK: - COLORS BUTTON AUX3
    // BackGround
    class func baitColor_buttonAux3ActiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Aux3.activeBG.rawValue)
    }
    // Título
    class func baitColor_buttonAux3ActiveTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Aux3.activeTXT.rawValue)
    }
    
    // MARK: - COLORS BUTTON AUX4
    // BackGround
    class func baitColor_buttonAux4ActiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Aux4.activeBG.rawValue)
    }
    // Título
    class func baitColor_buttonAux4ActiveTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Aux4.activeTXT.rawValue)
    }
    
    
    // MARK: - COLORS TEXT FIELD GENERAL
    // Título
    class func baitColor_textFieldTITLE(onlyLight: Bool) -> UIColor{
        if onlyLight {
            return getVersionColor(nombre: Constants.Colors.TextField.General.tituloOnlyLight.rawValue)
        }
        return getVersionColor(nombre: Constants.Colors.TextField.General.titulo.rawValue)
    }
    // Borde
    class func baitColor_textFieldBORDER(onlyLight: Bool) -> UIColor{
        if onlyLight {
            return getVersionColor(nombre: Constants.Colors.TextField.General.borderOnlyLight.rawValue)
        }
        return getVersionColor(nombre: Constants.Colors.TextField.General.border.rawValue)
    }
    // Texto Principal
    class func baitColor_TextFieldTEXT(onlyLight: Bool) -> UIColor {
        if onlyLight {
            return getVersionColor(nombre: Constants.Colors.TextField.General.textOnlyLght.rawValue)
        }
        return getVersionColor(nombre: Constants.Colors.TextField.General.text.rawValue)
    }
    // BackGround
    class func baitColor_TextFieldBG(onlyLight: Bool) -> UIColor {
        if onlyLight {
            return getVersionColor(nombre: Constants.Colors.TextField.General.backGroundOnlyLight.rawValue)
        }
        return getVersionColor(nombre: Constants.Colors.TextField.General.backGround.rawValue)
    }
    
    // MARK: - COLORS TEXT FIELD ERROR
    // Borde
    class func baitColor_textFieldErrorBORDER(onlyLight: Bool) -> UIColor {
        if onlyLight {
            return getVersionColor(nombre: Constants.Colors.TextField.Error.borderOnlyLight.rawValue)
        }
        return getVersionColor(nombre: Constants.Colors.TextField.Error.border.rawValue)
    }
    // Texto Soporte
    class func baitColor_TextFieldErrorSUPPORT(onlyLight: Bool) -> UIColor {
        if onlyLight {
            return getVersionColor(nombre: Constants.Colors.TextField.Error.supportOnlyLight.rawValue)
        }
        return getVersionColor(nombre: Constants.Colors.TextField.Error.support.rawValue)
    }
    
    // MARK: - COLORS TEXT FIELD PASSWORD
    class func baitColor_textFieldPasswordSHOW(onlyLight: Bool) -> UIColor {
        if onlyLight {
            return getVersionColor(nombre: Constants.Colors.TextField.Password.showOnlyLight.rawValue)
        }
        return getVersionColor(nombre: Constants.Colors.TextField.Password.show.rawValue)
    }
    class func baitColor_textFieldPasswordHIDE(onlyLight: Bool) -> UIColor {
        if onlyLight {
            return getVersionColor(nombre: Constants.Colors.TextField.Password.hideOnlyLight.rawValue)
        }
        return getVersionColor(nombre: Constants.Colors.TextField.Password.hide.rawValue)
    }
    
//    //Place Holder
//    @objc class func baitColor_TextFieldPlaceholderDeshabilitado() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_PLACEHOLDER_DESHABILITADO)
//    }
    
    // MARK: - COLORS CHECK-BOX
    // BackGround
    class func baitColor_checkboxBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Checkbox.General.backGround.rawValue)
    }
    // Borde
    class func baitColor_checkboxSelectBORDER() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Checkbox.General.borderSelect.rawValue)
    }
    class func baitColor_checkboxNoSelectBORDER() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Checkbox.General.borderNoSelect.rawValue)
    }
    // Select
    class func baitColor_checkboxSELECT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Checkbox.General.select.rawValue)
    }
}
