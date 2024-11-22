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
    
    //MARK: - COLORS BUTTON PRIMARIO
    //BackGround
    class func baitColor_buttonPrimarioActiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Principal.activeBG.rawValue)
    }
    class func baitColor_buttonPrimarioInactiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Principal.inactiveBG.rawValue)
    }
    //Título
    class func baitColor_buttonPrimarioActiveTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Principal.activeTXT.rawValue)
    }
    class func baitColor_buttonPrimarioInactiveTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Principal.inactiveTXT.rawValue)
    }
    //Borde
    class func baitColor_buttonPrimarioActiveBORDER() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Principal.activeBORDER.rawValue)
    }
    class func baitColor_buttonPrimarioInactiveBORDER() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Principal.inactiveBORDER.rawValue)
    }
    
    //MARK: - COLORS BUTTON SECUNDARIO
    //BackGround
    class func baitColor_buttonSecundarioActiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Secundario.activeBG.rawValue)
    }
    class func baitColor_buttonSecundarioInactiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Secundario.inactiveBG.rawValue)
    }
    //Título
    class func baitColor_buttonSecundarioActiveTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Secundario.activeTXT.rawValue)
    }
    class func baitColor_buttonSecundarioInactiveTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Secundario.inactiveTXT.rawValue)
    }
    //Borde
    class func baitColor_buttonSecundarioActiveBORDER() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Secundario.activeBORDER.rawValue)
    }
    class func baitColor_buttonSecundarioInactiveBORDER() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Secundario.inactiveBORDER.rawValue)
    }
    
    //MARK: - COLORS BUTTON TEXTO
    //Título
    class func baitColor_buttonTextoBlackTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Texto.blackTXT.rawValue)
    }
    class func baitColor_buttonTextoBlueTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Texto.blueTXT.rawValue)
    }
    class func baitColor_buttonTextoUnderlineTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Texto.underlineTXT.rawValue)
    }
    
    //MARK: - COLORS BUTTON AUX1
    //BackGround
    class func baitColor_buttonAux1ActiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Aux1.activeBG.rawValue)
    }
    //Título
    class func baitColor_buttonAux1ActiveTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Aux1.activeTXT.rawValue)
    }
    
    //MARK: - COLORS BUTTON AUX2
    //BackGround
    class func baitColor_buttonAux2ActiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Aux2.activeBG.rawValue)
    }
    //Título
    class func baitColor_buttonAux2ActiveTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Aux2.activeTXT.rawValue)
    }
    
    //MARK: - COLORS BUTTON AUX3
    //BackGround
    class func baitColor_buttonAux3ActiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Aux3.activeBG.rawValue)
    }
    //Título
    class func baitColor_buttonAux3ActiveTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Aux3.activeTXT.rawValue)
    }
    
    //MARK: - COLORS BUTTON AUX4
    //BackGround
    class func baitColor_buttonAux4ActiveBG() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Aux4.activeBG.rawValue)
    }
    //Título
    class func baitColor_buttonAux4ActiveTXT() -> UIColor{
        return getVersionColor(nombre: Constants.Colors.Buttons.Aux4.activeTXT.rawValue)
    }
    
    
    //MARK: - COLORS TEXT FIELD
    //BackGround
//    @objc class func baitColor_TextFieldBG() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_BG)
//    }
//    
//    //Place Holder
//    @objc class func baitColor_TextFieldPlaceholderDeshabilitado() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_PLACEHOLDER_DESHABILITADO)
//    }
//    
//    @objc class func baitColor_TextFieldPlaceholder() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_PLACEHOLDER)
//    }
//    
//    //Texto Soporte
//    class func baitColor_TextFieldActivoTextoSecundario() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_ACTIVO_TEXTO_SECUNDARIO)
//    }
//    class func baitColor_TextFieldInactivoTextoSecundario() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_INACTIVO_TEXTO_SECUNDARIO)
//    }
//    class func baitColor_TextFieldFocalizadoTextoSecundario() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_FOCALIZADO_TEXTO_SECUNDARIO)
//    }
//    class func baitColor_TextFieldErrorTextoSecundario() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_ERROR_TEXTO_SECUNDARIO)
//    }
//    class func baitColor_TextFieldSuccessTextoSecundario() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_SUCCESS_TEXTO_SECUNDARIO)
//    }
//    
//    //Bordes
//    class func baitColor_TextFieldInactivoBorde() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_INACTIVO_BORDE)
//    }
//    class func baitColor_TextFieldActivoBorde() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_ACTIVO_BORDE)
//    }
//    class func baitColor_TextFieldDeshabilitadoBorde() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_DESHABILITADO_BORDE)
//    }
//    class func baitColor_TextFieldFocalizadoBorde() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_FOCALIZADO_BORDE)
//    }
//    class func baitColor_TextFieldErrorBorde() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_ERROR_BORDE)
//    }
//    class func baitColor_TextFieldSuccessBorde() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_SUCCESS_BORDE)
//    }
//    
//    //Texto Principal
//    class func baitColor_TextFieldInactivoTexto() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_INACTIVO_TEXTO)
//    }
//    class func baitColor_TextFieldActivoTexto() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_ACTIVO_TEXTO)
//    }
//    class func baitColor_TextFieldDeshabilitadoTexto() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_DESHABILITADO_TEXTO)
//    }
//    class func baitColor_TextFieldFocalizadoTexto() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_FOCALIZADO_TEXTO)
//    }
//    class func baitColor_TextFieldErrorTexto() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_ERROR_TEXTO)
//    }
//    class func baitColor_TextFieldSuccessTexto() -> UIColor {
//        return getVersionColor(nombre: COLOR_TEXTFIELD_SUCCESS_TEXTO)
//    }
    
}
