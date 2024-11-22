//
//  VMButtonsBait.swift
//  ViewManagerSP
//
//  Created by Ignacio Hernández on 20/11/24.
//

import Foundation
import UIKit

/// Custom Button Bait ViewManagerSP
/// - typeButton (Int): Tipo de botón a implementar (1,2,3...)
/// - activeButton (Bool): Estado del botón
public class VMButtonsBait: UIButton {
    
    var _type : typeButtonEnum = typeButtonEnum.buttonPrimario
    var _identifier : identifierButtonEnum = identifierButtonEnum.normal
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.buttonTypeSetup()
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.buttonTypeSetup()
        self.commonInit()
    }
    
    private func commonInit(){
//        FontManager.checkResourcesInBundle()
//        print("\n\n")
//        FontManager.registerFonts()
//        FontManager.confirmRegisterFont()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
//        self.bounds = bounds
    }
    
    // Configurar tipo de botón
    private func buttonTypeSetup() {
        // Asegura que el botón es .custom
        if #available(iOS 14.0, *) {
            assert(self.buttonType == .custom, "UIButton debe ser de tipo .custom")
        }
    }
    
    
    //MARK: - Propiedades IBInspectables
    /// - 1 - Botón principal: Título negro y BG amarillo
    /// - 2 - Botón secundario: Título y contorno negro con BG Blanco
    /// - 3 - Botón de texto: Titulo negro y sin contorno
    @IBInspectable
    public var typeButton: Int = 1 {
        didSet {
            guard let enumValue = typeButtonEnum(rawValue: typeButton) else {
                print("⚠️ - Unsupported typeButton....")
                return
            }
            _type = enumValue
            let insentSizeImage: CGFloat = (self.bounds.height/2) - 10
            
            self.titleLabel?.font = _type.getFontTitle()
            self.titleLabel?.lineBreakMode = .byWordWrapping
            self.titleLabel?.textAlignment = .center
            self.layer.borderWidth = Constants.borderWidthButton
            
            switch enumValue {
            case .buttonAux1:
                self.layer.cornerRadius = Constants.cornerRadiusButton
                if let imgAux1 = UIImage.getAsset(name: "vm_icon_phone") {
                    self.setImage(imgAux1, for: .normal)
                }
                self.imageView?.contentMode = .scaleAspectFit
                self.imageView?.tintColor = UIColor.black
                self.semanticContentAttribute = .forceLeftToRight
                self.imageEdgeInsets = UIEdgeInsets(top: insentSizeImage, left: 10, bottom: insentSizeImage, right: 30)
            case .buttonAux2:
                self.layer.cornerRadius = Constants.cornerRadiusButton
                if let imgAux2 = UIImage.getAsset(name: "vm_icon_box") {
                    self.setImage(imgAux2, for: .normal)
                }
                self.imageView?.contentMode = .scaleAspectFit
                self.imageView?.tintColor = UIColor.black
                self.semanticContentAttribute = .forceLeftToRight
                self.imageEdgeInsets = UIEdgeInsets(top: insentSizeImage, left: 10, bottom: insentSizeImage, right: 30)
            case .buttonAux3, .buttonAux4:
                self.layer.cornerRadius = Constants.cornerRadiusButton
            default:
                self.layer.cornerRadius = self.bounds.height / 2
            }
            
        }
    }
    
    @IBInspectable
    public var activeButton: Bool {
        get {
            return true
        }
        set {
            self.isUserInteractionEnabled = newValue
            self.setTitleColor(_type.getColorTitle(isActive: newValue), for: .normal)
            self.backgroundColor = _type.getColorBackground(isActive: newValue)
            
            let colorBorde : UIColor = _type.getColorBorder(isActive: newValue)
            if #available(iOS 13.0, *) {
                self.traitCollection.performAsCurrent {
                    self.layer.borderColor = colorBorde.cgColor
                }
            } else {
                self.layer.borderColor = colorBorde.cgColor
            }
        }
    }
    
    
    /// - normal: Aplica en botones Principal y Texto
    /// - blue: Aplica en boton Texto
    /// - underline: Aplica en boton Texto
    @IBInspectable
    public var identifier: String = "normal" {
        didSet {
            guard let enumValue = identifierButtonEnum(rawValue: identifier) else {
                print("⚠️ - Unsupported Identifier Button....")
                return
            }
            _identifier = enumValue
            if _type == .buttonTexto {
                let configuracion = enumValue.getConfigTextButton()
                if configuracion.underline {
                    let underlineAttribute: [NSAttributedString.Key: Any] = [
                          .underlineStyle: NSUnderlineStyle.single.rawValue
                      ]
                    let attributeString = NSMutableAttributedString(
                        string: (self.titleLabel?.text)!,
                            attributes: underlineAttribute
                         )
                    self.setAttributedTitle(attributeString, for: .normal)
                }
                self.setTitleColor(configuracion.titleColor, for: .normal)
                self.titleLabel?.font = configuracion.font
            } else if _type == .buttonPrimario {
                if enumValue == .image {
                    // Configuración de la imagen
                    if #available(iOS 13.0, *) {
                        self.setImage(UIImage(systemName: "arrowtriangle.down.fill"), for: .normal)
                    } else {
                        print("⚠️ - No se puede agregar imágen a botón")
                        // Fallback on earlier versions
                    }
                    self.imageView?.contentMode = .scaleAspectFit
                    
                    self.imageView?.tintColor = UIColor.black
                    if !self.isUserInteractionEnabled {
                        self.imageView?.tintColor = UIColor.gray
                    }
                    // Espaciado entre texto e imagen
                    self.semanticContentAttribute = .forceRightToLeft
                    self.imageEdgeInsets = UIEdgeInsets(top: (self.bounds.height/2) - 3, left: 16, bottom: (self.bounds.height/2) - 3, right: 10)
                }
            }
        }
    }
    
    @IBInspectable
    public var bText_sizeFont: Int = 15 {
        didSet {
            if _type == .buttonPrimario || _type == .buttonTexto {
                self.titleLabel?.font = _identifier.getFont(identifier: _identifier, size: CGFloat(bText_sizeFont))
            }
        }
    }
    
    @IBInspectable
    public var bAux_image: UIImage? {
            didSet {
                if _type == .buttonAux1 || _type == .buttonAux2 {
                    self.setImage(bAux_image, for: .normal)
                    self.imageView?.contentMode = .scaleAspectFit
                    self.imageView?.tintColor = UIColor.black
                    self.semanticContentAttribute = .forceLeftToRight
                }
            }
        }
}
