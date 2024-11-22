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
    
    struct Colors {
        struct Buttons {
            enum Principal: String {
                // Activo
                case activeBG = "ButtonPrincipalActiveBG"
                case activeBORDER = "ButtonPrincipalActiveBORDER"
                case activeTXT = "ButtonPrincipalActiveTXT"
                // Inactivo
                case inactiveBG = "ButtonPrincipalInactiveBG"
                case inactiveBORDER = "ButtonPrincipalInactiveBORDER"
                case inactiveTXT = "ButtonPrincipalInactiveTXT"
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
            }
            enum Aux2: String {
                // Activo
                case activeBG = "ButtonAux2ActiveBG"
                case activeTXT = "ButtonAux2ActiveTXT"
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
}
