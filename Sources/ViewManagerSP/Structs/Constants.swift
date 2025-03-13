//
//  Constants.swift
//  ViewManagerSP
//
//  Created by Ignacio Hernández on 20/11/24.
//
import UIKit

struct Constants {
    static let borderWidthButton: CGFloat = 1
    static let cornerRadiusButton: CGFloat = 6
    static let borderWidthTextField: CGFloat = 1
    static let cornerRadiusTextField: CGFloat = 4
    static let borderWidthCheckBox: CGFloat = 1
    static let cornerRadiusCheckBox: CGFloat = 5
    
    struct Colors {
        struct Buttons {
            struct Principal {
                // Activo
                static let activeBG: String = "ButtonPrincipalActiveBG"
                static let activeBORDER: String = "ButtonPrincipalActiveBORDER"
                static let activeTXT: String = "ButtonPrincipalActiveTXT"
                // Inactivo
                static let inactiveBG: String = "ButtonPrincipalInactiveBG"
                static let inactiveBORDER: String = "ButtonPrincipalInactiveBORDER"
                static let inactiveTXT: String = "ButtonPrincipalInactiveTXT"
                
                enum Black: String {
                    // Activo
                    case activeBG = "ButtonPrincipalBlackActiveBG"
                    case activeBORDER = "ButtonPrincipalBlackActiveBORDER"
                    case activeTXT = "ButtonPrincipalBlackActiveTXT"
                    // Inactivo
                    case inactiveBG = "ButtonPrincipalBlackInactiveBG"
                    case inactiveBORDER = "ButtonPrincipalBlackInactiveBORDER"
                    case inactiveTXT = "ButtonPrincipalBlackInactiveTXT"
                }
            }
            enum Secundario: String {
                // Activo
                case activeBG = "ButtonSecundarioActiveBG"
                case activeBORDER = "ButtonSecundarioActiveBORDER"
                case activeTXT = "ButtonSecundarioActiveTXT"
                // Inactivo
                case inactiveBG = "ButtonSecundarioInactiveBG"
                case inactiveBORDER = "ButtonSecundarioInactiveBORDER"
                case inactiveTXT = "ButtonSecundarioInactiveTXT"
            }
            enum Texto: String {
                // Black
                case blackTXT = "ButtonTextoBlackTXT"
                // Blue
                case blueTXT = "ButtonTextoBlueTXT"
                // Underline
                case underlineTXT = "ButtonTextoUnderlineTXT"
            }
            enum Aux1: String {
                // Activo
                case activeBG = "ButtonAux1ActiveBG"
                case activeTXT = "ButtonAux1ActiveTXT"
                // Inactivo
                case inactiveBG = "ButtonAux1InactiveBG"
            }
            enum Aux2: String {
                // Activo
                case activeBG = "ButtonAux2ActiveBG"
                case activeTXT = "ButtonAux2ActiveTXT"
                //Inactivo
                case inactiveBG = "ButtonAux2InactiveBG"
            }
            enum Aux3: String {
                // Activo
                case activeBG = "ButtonAux3ActiveBG"
                case activeTXT = "ButtonAux3ActiveTXT"
            }
            enum Aux4: String {
                // Activo
                case activeBG = "ButtonAux4ActiveBG"
                case activeTXT = "ButtonAux4ActiveTXT"
            }
        }
        
        struct TextField {
            enum General: String {
                // Activo
                case titulo = "TextFieldGeneralTITLE"
                case border = "TextFieldGeneralBORDER"
                case text = "TextFieldGeneralTEXT"
                case backGround = "TextFieldGeneralBG"
                
                case tituloOnlyLight = "TextFieldGeneralTITLE_onlyLight"
                case borderOnlyLight = "TextFieldGeneralBORDER_onlyLight"
                case textOnlyLght = "TextFieldGeneralTEXT_onlyLight"
                case backGroundOnlyLight = "TextFieldGeneralBG_onlyLight"
            }
            enum Error: String {
                case border = "TextFieldErrorBORDER"
                case support = "TextFieldErrorSUPPORT"
                
                case borderOnlyLight = "TextFieldErrorBORDER_onlyLight"
                case supportOnlyLight = "TextFieldErrorSUPPORT_onlyLight"
            }
            enum Password: String {
                case show = "TextFieldPasswordSHOW"
                case hide = "TextFieldPasswordHIDE"
                
                case showOnlyLight = "TextFieldPasswordSHOW_onlyLight"
                case hideOnlyLight = "TextFieldPasswordHIDE_onlyLight"
            }
        }
        
        struct Checkbox {
            enum General: String {
                case backGround = "CheckBoxBG"
                case borderSelect = "CheckBoxSelectBORDER"
                case borderNoSelect = "CheckBoxUnselectBORDER"
                case select = "CheckBoxSELECT"
                
            }
        }
        
    }
    
    struct Fonts {
        static var gothamRegular: String {
            return "GothamRounded-Book"
        }
        static var gothamBold: String {
            return "GothamRounded-Bold"
        }
        static var gothamMedium: String {
            return "GothamRounded-Medium"
        }
    }
    
    struct CharactersValidTo {
        static let phone: String = "0123456789"
        static let pwd: String = ".@$!%*#?&0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    }
    
    struct Regex {
        static let text: String = "^[-áéíóúÁÉÍÓÚñÑA.'-Za-z0-9 _]+$"
        static let phone10: String = "^[0-9]{10}$"
        static let mail: String = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
        static let pwd: String = #"^(?=.*[.@$!%*#?&])(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d.@$!%*#?&]{8,20}$"#
    }
    
    struct Messages {
        struct Error {
            struct Text {
                static let format: String = "El formato del campo no es válido"
            }
            struct Phone {
                static let format: String = "El formato del número no es válido"
            }
            struct Mail {
                static let format: String = "El correo electrónico no es válido"
            }
            struct Pwd {
                static let format: String = "La contraseña no tiene un formato válido"
                static let minCharacters: String = "La contraseña debe tener al menos 8 caracteres"
                static let minNumber: String = "La contraseña debe tener al menos 1 número"
                static let specialCharacters: String = "La contraseña debe tener al menos 1 carácter especial @!%*.#?$&"
                static let mayus: String = "La contraseña debe tener al menos 1 letra en mayúscula"
            }
        }
    }
}
