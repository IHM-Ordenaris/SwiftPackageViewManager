//
//  ButtonsEnums.swift
//  ViewManagerSP
//
//  Created by Ignacio Hernández on 20/11/24.
//

import UIKit

/// Colección de botones View Manager
/// - 1 - Botón principal: Título negro y BG amarillo
/// - 2 - Botón sin definir
/// - 3 - Botón de texto: Titulo negro y sin contorno
public enum typeButtonEnum: Int {
    case buttonPrimario = 1
    case buttonSecundario = 2
    case buttonTexto = 3
    case buttonAux1 = 4
    case buttonAux2 = 5
    case buttonAux3 = 6
    case buttonAux4 = 7
    
    /// Obtiene el color del background del botón, dependiendo del tipo de botón seleccionado y de su estado
    /// - Parameter isActive: - Botón activo / inactivo
    /// - Returns: - Retorna un UIColor
    func getColorBackground(isActive: Bool) -> UIColor {
        if (isActive) {
            switch self {
            case .buttonPrimario:
                return UIColor.baitColor_buttonPrimarioActiveBG()
            case .buttonSecundario:
                return UIColor.baitColor_buttonSecundarioActiveBG()
            case .buttonTexto:
                return UIColor.clear
            case .buttonAux1:
                return UIColor.baitColor_buttonAux1ActiveBG()
            case .buttonAux2:
                return UIColor.baitColor_buttonAux2ActiveBG()
            case .buttonAux3:
                return UIColor.baitColor_buttonAux3ActiveBG()
            case .buttonAux4:
                return UIColor.baitColor_buttonAux4ActiveBG()
            }
        } else {
            switch self {
            case .buttonPrimario:
                return UIColor.baitColor_buttonPrimarioInactiveBG()
            case .buttonSecundario:
                return UIColor.baitColor_buttonSecundarioInactiveBG()
            case .buttonTexto:
                return UIColor.clear
            default:
                return UIColor.clear
            }
        }
    }
    
    /// Obtiene el color del título del botón, dependiendo del tipo de botón seleccionado y de su estado
    /// - Parameter isActive: - Botón activo / inactivo
    /// - Returns: - Retorna un UIColor
    func getColorTitle(isActive: Bool) -> UIColor {
        if (isActive) {
            switch self {
            case .buttonPrimario:
                return UIColor.baitColor_buttonPrimarioActiveTXT()
            case .buttonSecundario:
                return UIColor.baitColor_buttonSecundarioActiveTXT()
            case .buttonTexto:
                return UIColor.blue
            case .buttonAux1:
                return UIColor.baitColor_buttonAux1ActiveTXT()
            case .buttonAux2:
                return UIColor.baitColor_buttonAux2ActiveTXT()
            case .buttonAux3:
                return UIColor.baitColor_buttonAux3ActiveTXT()
            case .buttonAux4:
                return UIColor.baitColor_buttonAux4ActiveTXT()
            }
        } else {
            switch self {
            case .buttonPrimario:
                return UIColor.baitColor_buttonPrimarioInactiveTXT()
            case .buttonSecundario:
                return UIColor.baitColor_buttonSecundarioInactiveTXT()
            case .buttonTexto:
                return UIColor.blue
            default:
                return UIColor.black
            }
        }
    }
    
    /// Obtiene el color del borde del botón, dependiendo del tipo de botón seleccionado y de su estado
    /// - Parameter isActive: - Botón activo / inactivo
    /// - Returns: - Retorna un UIColor
    func getColorBorder(isActive: Bool) -> UIColor {
        if (isActive) {
            switch self {
            case .buttonPrimario:
                return UIColor.baitColor_buttonPrimarioActiveBORDER()
            case .buttonSecundario:
                return UIColor.baitColor_buttonSecundarioActiveBORDER()
            case .buttonTexto:
                return UIColor.clear
            default:
                return UIColor.clear
            }
        } else {
            switch self {
            case .buttonPrimario:
                return UIColor.baitColor_buttonPrimarioInactiveBORDER()
            case .buttonSecundario:
                return UIColor.baitColor_buttonSecundarioInactiveBORDER()
            case .buttonTexto:
                return UIColor.clear
            default:
                return UIColor.clear
            }
        }
    }
    
    
    /// Obtiene la fuente del título del botón, dependiendo del tipo de botón seleccionado
    /// - Returns: - Retorna un UIFont
    func getFontTitle() -> UIFont {
        switch self {
        case .buttonPrimario:
            return UIFont(name: Constants.Fonts.gothamBold, size: 15.0) ?? .systemFont(ofSize: 60)
        case .buttonSecundario:
            return UIFont(name: Constants.Fonts.gothamBold, size: 15.0) ?? .systemFont(ofSize: 15)
        case .buttonTexto:
            return UIFont(name: Constants.Fonts.gothamRegular, size: 15.0) ?? .systemFont(ofSize: 15)
        case .buttonAux1:
            return UIFont(name: Constants.Fonts.gothamRegular, size: 12.0) ?? .systemFont(ofSize: 12)
        case .buttonAux2:
            return UIFont(name: Constants.Fonts.gothamRegular, size: 12.0) ?? .systemFont(ofSize: 12)
        case .buttonAux3:
            return UIFont(name: Constants.Fonts.gothamMedium, size: 12.0) ?? .systemFont(ofSize: 12)
        case .buttonAux4:
            return UIFont(name: Constants.Fonts.gothamMedium, size: 12.0) ?? .systemFont(ofSize: 12)
        default:
            return UIFont.systemFont(ofSize: 30)
        }
    }
}

/// Colección de identificadores para botones tipo texto
/// - black -: Título negro
/// - blue - Título Azul
public enum identifierButtonEnum: String {
    case normal
    case blue
    case underline
    case image
    
    /// Configura el diseño del botón texto
    /// - Parameter button: - Botón
    func getConfigTextButton() -> ConfigButton {
        var config = ConfigButton()
        switch self {
        case .normal:
            config.titleColor = UIColor.baitColor_buttonTextoBlackTXT()
            config.font = self.getFont(identifier: self)
            config.underline = false
        case .blue:
            config.titleColor = UIColor.baitColor_buttonTextoBlueTXT()
            config.font = self.getFont(identifier: self)
            config.underline = false
        case .underline:
            config.titleColor = UIColor.baitColor_buttonTextoUnderlineTXT()
            config.font = self.getFont(identifier: self)
            config.underline = true
        default:
            break
            
        }
        return config
    }
    
    func getFont(identifier: identifierButtonEnum, size: CGFloat = 15.0) -> UIFont {
        switch identifier {
        case .normal:
            return UIFont(name: Constants.Fonts.gothamBold, size: size) ?? .systemFont(ofSize: size)
        case .blue:
            return UIFont(name: Constants.Fonts.gothamMedium, size: size) ?? .systemFont(ofSize: size)
        case .underline:
            return UIFont(name: Constants.Fonts.gothamRegular, size: size) ?? .systemFont(ofSize: size)
        case .image:
            return UIFont(name: Constants.Fonts.gothamBold, size: size) ?? .systemFont(ofSize: size)
        default:
            return UIFont.systemFont(ofSize: size)
        }
    }
}

struct ConfigButton {
    var titleColor: UIColor
    var font: UIFont
    var underline: Bool
    
    init() {
        self.titleColor = UIColor.clear
        self.font = UIFont.systemFont(ofSize: 12)
        self.underline = false
    }
}
