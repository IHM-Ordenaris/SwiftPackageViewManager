//
//  CustomButtonList.swift
//  ViewManagerSP
//
//  Created by Ignacio Hernández on 02/12/24.
//

import UIKit

// MARK: Protocol CustomTextFieldDelegate
@objc internal protocol CustomButtonListDelegate {
    //Principales
    @objc func BtnListWillDisplayMenu()
    @objc func BtnListDidEndEditing(text: String, index: Int)
}

@available(iOS 13.0, *)
class CustomButtonList: UIButton {
    
    // MARK: - Variables CustomButtonList
    internal weak var delegateCustom: CustomButtonListDelegate?
    private var menuOptions: [UIAction] = []
    
    // MARK: - Funciones Inicio
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit(){
        self.titleLabel?.font = UIFont(name: Constants.Fonts.gothamRegular, size: 12.0) ?? .systemFont(ofSize: 12)
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.titleLabel?.textAlignment = .left
        self.setTitleColor(UIColor.gray, for: .normal)
        
        // Configuración de la imagen
        if !self.isUserInteractionEnabled {
            self.imageView?.tintColor = UIColor.gray
        }
        self.showsMenuAsPrimaryAction = true // Permite mostrar el menú al presionar el botón
    }
    
    // MARK: - Functions
    internal func createMenu(options: [String]) {
        self.menuOptions = options.map { option in
            UIAction(title: option, handler: { [weak self] action in
//                self.setTitle(action.title, for: .normal) // Actualiza el título del botón
                for i in 0..<options.count {
                    if action.title == options[i]{
                        self?.delegateCustom?.BtnListDidEndEditing(text: action.title, index: i)
                        break
                    }
                }
            })
        }
        self.menu = UIMenu(title: "", children: self.menuOptions)
    }
    
    // MARK: - Eventos MENU
    override internal func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willDisplayMenuFor configuration: UIContextMenuConfiguration, animator: (any UIContextMenuInteractionAnimating)?) {
        self.delegateCustom?.BtnListWillDisplayMenu()
    }
    
//    override func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willEndFor configuration: UIContextMenuConfiguration, animator: (any UIContextMenuInteractionAnimating)?) {
//        print("Se cierra menu")
//    }
}
