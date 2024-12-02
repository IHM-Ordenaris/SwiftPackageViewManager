//
//  CustomTextField.swift
//  ViewManagerSP
//
//  Created by Ignacio Hernández on 25/11/24.
//

import UIKit

// MARK: Protocol CustomTextFieldDelegate
@objc internal protocol CustomTextFieldDelegate {
    //Principales
    @objc func TxtCustomDidBeginEditing(_ field: CustomTextField)
    @objc func TxtCustomDidEndEditing(_ field: CustomTextField)
    @objc func TxtCustomChangeCharacter(_ field: CustomTextField, shouldChangeCharactersIn range: NSRange, replacementString string: String)
    //Secundarios
    @objc func TxtCustomShouldReturn(_ field: CustomTextField)
    @objc func TxtCustomShouldBeginEditing(_ field: CustomTextField) -> Bool
}

// MARK: Public CLASS CustomTextField
public class CustomTextField: UITextField {
    
    // MARK: - Variables TextField
    internal var typeTxt: EnumTypeTxtBait!
    internal var stateTxt:EnumStateTxtBait!
    internal var delegateCustom: CustomTextFieldDelegate!
    
    private var viewImg: UIView!
    private var imageLeft: UIImageView!
    private var imageRight: UIImageView!
    private var labelRight: UILabel!
    private var plholder: String = ""
    
    // MARK: - Funciones Inicio
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.commontInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commontInit()
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if #available(iOS 13.0, *) {
            self.traitCollection.performAsCurrent {
                self.layer.borderColor = self.stateTxt.getColorBorde()!.cgColor
            }
            self.layer.borderColor = self.stateTxt.getColorBorde()!.resolvedColor(with: self.traitCollection).cgColor
        } else {
            self.layer.borderColor = self.stateTxt.getColorBorde()!.cgColor
        }
    }
    
    private func commontInit() {
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        self.delegate = self
        if let _ = self.placeholder {
            self.plholder = self.placeholder!
        }
        self.layer.cornerRadius = Constants.cornerRadiusTextField
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        self.font = UIFont(name: Constants.Fonts.gothamRegular, size: 12.0) ?? .systemFont(ofSize: 12)
        self.isUserInteractionEnabled = true
    }
    
    // MARK: - Variables configurables desde VMTextFieldBait
    internal var typeField: Int = 1 {
        didSet {
            guard let enumValue = EnumTypeTxtBait(rawValue: typeField) else {
                print("Custom - Tipo Text field no soportado....")
                return
            }
            self.typeTxt = enumValue
            self.setUpView()
        }
    }
    
    internal var stateField: Int = 1 {
        didSet {
            guard let enumValue = EnumStateTxtBait(rawValue: stateField) else {
                print("Custom - Estado TextField no soportado....")
                return
            }
            
            let colorBorde : UIColor = enumValue.getColorBorde()!
            if #available(iOS 13.0, *) {
                self.traitCollection.performAsCurrent {
                    self.layer.borderColor = colorBorde.cgColor
                }
                self.layer.borderColor = colorBorde.resolvedColor(with: self.traitCollection).cgColor
            } else {
                self.layer.borderColor = colorBorde.cgColor
            }
            self.layer.borderWidth = enumValue.getWidthBorder()!
            
            self.backgroundColor = enumValue.getColorBG()
            self.tintColor = enumValue.getColorPrompt()!
            self.textColor = enumValue.getColorTexto()!
            stateTxt = enumValue
            
            if enumValue == .disable {
                self.isUserInteractionEnabled = false
            } else {
                self.isUserInteractionEnabled = true
            }
//            setUpView()
        }
    }
    
    // MARK: - Functions
    private func setUpView() {
        switch self.typeTxt {
        case .text?:
            self.isSecureTextEntry = false
            self.autocorrectionType = .no
            self.autocapitalizationType = .sentences
            self.createLeftViewExtended()
//            self.keyboardType = .asciiCapable
        case .phone?:
            self.isSecureTextEntry = false
            self.keyboardType = .numberPad
            self.createLeftView()
        case .psswrd?:
            self.isSecureTextEntry = true
            self.keyboardType = .asciiCapable
            self.createLeftViewExtended()
            self.createRigthView()
        case .email?:
            self.isSecureTextEntry = false
            self.autocorrectionType = .no
            self.keyboardType = .emailAddress
            self.createLeftView()
        case .list?:
            self.isSecureTextEntry = false
            self.autocorrectionType = .no
            self.keyboardType = .asciiCapable
            self.createLeftViewExtended()
            self.createRigthView()
        default:
            print("Custom - Tipo textField no seteado...")
        }
    }
    
    internal func hideRightView(with bool: Bool){
        rightView?.isHidden = bool
    }
    
    internal func isSizeMinCorrect() -> Bool {
        if self.text!.count < 8 {
            return false
        } else {
            return true
        }
    }
    
    internal func containNumber() -> Bool {
        let numberRegex = "\\d"
        let range = self.text!.range(of: numberRegex, options: .regularExpression)
        return range != nil
    }
    
    internal func containSpecialCharacter() -> Bool {
        let specialCharactersRegex = "[.@$!%*#?&]"
        let range = self.text!.range(of: specialCharactersRegex, options: .regularExpression)
        return range != nil
    }
    
    internal func containMayus() -> Bool {
        let mayusRegex = "[A-Z]"
        let range = self.text!.range(of: mayusRegex, options: .regularExpression)
        return range != nil
    }
    
    @objc internal func isValid() -> Bool {
        return self.typeTxt.isValid(self.text!)!
    }
    
    private func createLeftView() {
        self.viewImg = UIView(frame: CGRect(x: 0, y: 10, width: 50, height: 50))
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CustomTextField.tapResponse(tapGestureRecognizer:)))
        self.viewImg.addGestureRecognizer(tapGestureRecognizer)
        self.viewImg.isUserInteractionEnabled = true
        self.viewImg.tintColor = UIColor.baitColor_TextFieldTEXT()
        
        let widthInit = (self.viewImg.frame.width/2)-10
        let heightInit = (self.viewImg.frame.height/2)-10
        let sizeImage = 20
        
        switch self.typeTxt {
        case .phone, .email:
            let initPoint: CGPoint = CGPoint(x: widthInit, y: heightInit)
            self.imageLeft = UIImageView(frame: CGRect(origin: initPoint, size: CGSize(width: sizeImage, height: sizeImage)))
            self.imageLeft.contentMode = .scaleAspectFit
            self.imageLeft.image = self.typeTxt.getImageLeft()
            
            self.viewImg.addSubview(self.imageLeft)
            self.leftView = self.viewImg
            self.leftViewMode = .always
            
        default:
            print("Custom - Tipo TextField sin imagen a la izquierda...")
        }
    }
    
    private func createLeftViewExtended() {
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    private func createRightViewExtended(){
//        let paddingView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
        let paddingView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    private func createRigthView() {
        self.viewImg = UIView(frame: CGRect(x: 0, y: 10, width: 60, height: 50))
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CustomTextField.tapResponse(tapGestureRecognizer:)))
        self.viewImg.addGestureRecognizer(tapGestureRecognizer)
        self.viewImg.isUserInteractionEnabled = true
        self.viewImg.tintColor = UIColor.baitColor_TextFieldTEXT()
        
        let widthInit = (self.viewImg.frame.width/2)-25
        let heightInit = (self.viewImg.frame.height/2)-10
        let sizeImage = 20
        
        switch self.typeTxt {
        case .psswrd?:
            let initPoint: CGPoint = CGPoint(x: widthInit, y: heightInit)
            
            self.labelRight = UILabel(frame: CGRect(origin: initPoint,
                                                    size: CGSize(width: 50,
                                                                 height: sizeImage)))
            self.labelRight.contentMode = .scaleAspectFit
            self.labelRight.textAlignment = .center
            self.labelRight.font = UIFont(name: Constants.Fonts.gothamRegular, size: 10.0) ?? .systemFont(ofSize: 10)
            
            self.labelRight.text = "Mostrar"
            let underlineAttribute: [NSAttributedString.Key: Any] = [
                  .underlineStyle: NSUnderlineStyle.single.rawValue
              ]
            let attributeString = NSMutableAttributedString(
                string: (self.labelRight.text)!,
                    attributes: underlineAttribute
                 )
            self.labelRight.attributedText = attributeString
            self.labelRight.textColor = UIColor.baitColor_textFieldPasswordSHOW()
            self.viewImg.addSubview(self.labelRight)
            self.rightView = self.viewImg
            self.rightViewMode = .always
        case .list?:
            let widthI = (self.viewImg.frame.width/2)-5
            let heightI = (self.viewImg.frame.height/2)-5
            let sizeI = 10
            
            let initPoint: CGPoint = CGPoint(x: widthI, y: heightI)
            self.imageRight = UIImageView(frame: CGRect(origin: initPoint, size: CGSize(width: sizeI, height: sizeI)))
            self.imageRight.contentMode = .scaleAspectFit
            self.imageRight.image = self.typeTxt.getImageRight()
            self.imageRight.tintColor = UIColor.baitColor_TextFieldTEXT()
            
            self.viewImg.addSubview(self.imageRight)
            self.rightView = self.viewImg
            self.rightViewMode = .always
        default:
            print("Custom - Tipo TextField sin imagen a la derecha...")
        }
    }
    
    @objc open func tapResponse(tapGestureRecognizer: UITapGestureRecognizer) {
        switch self.typeTxt {
        case .psswrd?:
            if self.isSecureTextEntry {
                self.isSecureTextEntry = false
                DispatchQueue.main.async {
                    self.labelRight.text = "Ocultar"
                    self.labelRight.textColor = UIColor.baitColor_textFieldPasswordHIDE()
                    // self.labelRight.setNeedsDisplay()
                }
            } else {
                self.isSecureTextEntry = true
                DispatchQueue.main.async {
                    self.labelRight.text = "Mostrar"
                    self.labelRight.textColor = UIColor.baitColor_textFieldPasswordSHOW()
                    // self.imageLeft.setNeedsDisplay()
                }
            }
        default:
            print("Custom - Tipo textField sin tapGesture...")
        }
    }
}


// MARK: - extension CustomTextField: UITextFieldDelegate
extension CustomTextField: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        let field = textField as! CustomTextField
        if field.stateField != EnumStateTxtBait.error.rawValue{
//            field.stateField = 4
        }
//        field.placeholder = ""
        field.contentVerticalAlignment = .center
        self.delegateCustom.TxtCustomDidBeginEditing(field)
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        let field = textField as! CustomTextField
        if field.text == ""{
            field.contentVerticalAlignment = .center
        }
        self.delegateCustom.TxtCustomDidEndEditing(field)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let field = textField as! CustomTextField
        field.resignFirstResponder()
        self.delegateCustom.TxtCustomShouldReturn(field)
        return true
    }
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let field = textField as! CustomTextField
        return self.delegateCustom.TxtCustomShouldBeginEditing(field)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let field = textField as! CustomTextField
        let newLength = textField.text!.count + string.count - range.length
        self.delegateCustom.TxtCustomChangeCharacter(field, shouldChangeCharactersIn: range, replacementString: string)
        switch self.typeTxt {
        case .phone?:
            let characterSet = NSCharacterSet.init(charactersIn: Constants.CharactersValidTo.phone).inverted
            let filtered = string.components(separatedBy: characterSet as CharacterSet).joined(separator: "")
            if string == filtered && newLength <= self.typeTxt.getMaxCharacters() {
                return true
            }
            return false
        case .psswrd?:
            let characterSet = NSCharacterSet.init(charactersIn: Constants.CharactersValidTo.pwd).inverted
            let filtered = string.components(separatedBy: characterSet as CharacterSet).joined(separator: "")
            return string == filtered ? true : false
//        case .psswrd?:
//            let characterSet = NSCharacterSet.init(charactersIn: ConstantsTextFields.ACCEPTABLE_CHARACTERS_SERTEC).inverted
//            let filtered = string.components(separatedBy: characterSet as CharacterSet).joined(separator: "")
//            let newLength = textField.text!.count + string.count - range.length
//            return (newLength >= limitCharacters || string != filtered) ? false : true
//        case .psswrdLogin?:
//            let newLength = textField.text!.count + string.count - range.length
//            return (newLength >= limitCharacters) ? false : true
        default:
            print("Custom - TextField sin restricción de longitud...")
            return true
        }
    }
}
