//
//  VMTextFieldBait.swift
//  ViewManagerSP
//
//  Created by Ignacio Hernández on 25/11/24.
//

import UIKit

// MARK: Protocol VMTextFieldDelegateExterno
@objc public protocol VMTextFieldDelegateExterno {
    @objc func VMTxtMiBaitDidBeginEditingEx(_ field: VMTextFieldBait, txtField: CustomTextField)
    @objc func VMTxtMiBaitDidEndEditingEx(_ field: VMTextFieldBait, txtField: CustomTextField)
    @objc optional func VMTxtMiBaitChangeCharacterEx(_ field: VMTextFieldBait, txtField: CustomTextField, shouldChangeCharactersIn range: NSRange, replacementString string: String)
    @objc optional func VMTxtMiBaitShouldReturnEx(_ field: VMTextFieldBait, txtField: CustomTextField)
    @objc optional func VMTxtMiBaitShouldBeginEditingEx(_ field: VMTextFieldBait, txtField: CustomTextField) -> Bool
    @objc optional func VMTxtMiBaitTapImageHelpEx(_ field: VMTextFieldBait, txtField: CustomTextField)
    
    // Delegados para TextField Lista
    @objc optional func VMTxtMiBaitWillDisplayMenuEx(_ field: VMTextFieldBait, txtField: CustomTextField)
    @objc optional func VMTxtMiBaitDidEndSelecOptiontEx(_ field: VMTextFieldBait, txtField: CustomTextField, index: Int)
}

// MARK: Public CLASS VMTextFields
public class VMTextFieldBait: UIView, @preconcurrency CustomTextFieldDelegate, @preconcurrency CustomButtonListDelegate {
    // MARK: - Variables
    @objc weak public var delegateExterno: VMTextFieldDelegateExterno?
    
    static var stateFieldStatic = 0
    private var errorsDisable: Bool = false
    
    //MARK: - IBOutlets
    @IBOutlet weak var viewBGB5: UIView!
    @IBOutlet weak var lblTitulo5: UILabel!
    @IBOutlet weak var imgInfo: UIImageView!
    @IBOutlet weak public var txtField: CustomTextField!
    @IBOutlet weak var lblSoporte5: UILabel!
    @IBOutlet weak var btnList: CustomButtonList!
    
    var auxPlaceholder: String = ""
    
    // MARK: - Funciones inicio
    func xibSetup() {
        self.viewBGB5 = loadViewFromNib()
        self.viewBGB5.frame = bounds
        self.viewBGB5.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        self.viewBGB5.layoutIfNeeded()
        self.layoutIfNeeded()
        addSubview(self.viewBGB5)
        self.viewBGB5.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
        
        // Config elements
        self.lblTitulo5.backgroundColor = UIColor.clear
        self.lblTitulo5.text = ""
        self.lblTitulo5.font = UIFont(name: Constants.Fonts.gothamMedium, size: 12.0) ?? .systemFont(ofSize: 12)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapImageHelp(tapGestureRecognizer:)))
        self.imgInfo.addGestureRecognizer(tapGesture)
        self.imgInfo.isHidden = true
        self.imgInfo.tintColor = UIColor.baitColor_TextFieldTEXT()
        self.imgInfo.isUserInteractionEnabled = true
        
        self.txtField.delegateCustom = self
        self.btnList.delegateCustom = self
        
        self.lblSoporte5.backgroundColor = UIColor.clear
        self.lblSoporte5.text = ""
        self.lblSoporte5.font = UIFont(name: Constants.Fonts.gothamBold, size: 12.0) ?? .systemFont(ofSize: 12)
    }
    
    @objc open func tapImageHelp(tapGestureRecognizer: UITapGestureRecognizer) {
        delegateExterno?.VMTxtMiBaitTapImageHelpEx?(self, txtField: self.txtField)
    }
    
    public func loadViewFromNib() -> UIView {
        let bundle = Bundle.module
        // Carga el XIB
        guard let view = bundle.loadNibNamed("VMTextFieldBait", owner: self, options: nil)?.first as? UIView else {
            fatalError("No se pudo cargar el archivo XIB")
        }
        return view
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    public override func layoutSubviews() {
        self.layoutIfNeeded()
    }
    
    override public func resignFirstResponder() -> Bool {
        return self.txtField.resignFirstResponder()
    }
    
    override public func becomeFirstResponder() -> Bool {
        return self.txtField.becomeFirstResponder()
    }
    
    // MARK: - IBinspectables
    @IBInspectable public var tipoCampo: Int = 1 {
        didSet {
            guard let enumValue = EnumTypeTxtBait(rawValue: tipoCampo) else{
                print("VMTextField - Tipo Text field no soportado....")
                return
            }
            self.txtField.typeField = enumValue.rawValue
            if self.lblTitulo5.text == "" && enumValue != .list {
                self.lblTitulo5.text = enumValue.getTitleDefault()
            }
            switch enumValue {
            case .list:
                self.btnList.isHidden = false
            default:
                self.btnList.isHidden = true
            }
        }
    }
    
    @IBInspectable public var estadoCampo: Int = 1 {
        didSet {
            guard let enumValue = EnumStateTxtBait(rawValue: estadoCampo) else {
                print("VMTextField - Estado TextField no soportado....")
                return
            }
            VMTextFieldBait.stateFieldStatic = estadoCampo
            self.txtField.stateField = enumValue.rawValue
            
            self.lblTitulo5.textColor = enumValue.getColorTitle()!
            self.lblSoporte5.textColor = enumValue.getColorTextoSoporte()!
            
            if enumValue != .error {
                self.lblSoporte5.text = ""
            }
        }
    }
    
    @IBInspectable public var placeHolderCampo: String = "" {
        didSet {
            var attribute = NSAttributedString(string: placeHolderCampo, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            if self.txtField.stateField != EnumStateTxtBait.disable.rawValue {
                attribute = NSAttributedString(string: placeHolderCampo, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
            self.txtField.attributedPlaceholder = attribute
        }
    }
    
    @IBInspectable public var textTitulo: String {
        get {
            self.lblTitulo5.text!
        }
        set {
            if newValue != "" {
                self.lblTitulo5.text = newValue
            }
        }
    }
    
    @IBInspectable public var showHelp: Bool {
        get {
            !self.imgInfo.isHidden
        }
        set {
            self.imgInfo.isHidden = !newValue
        }
    }
    
    @IBInspectable public var showIcon: Bool {
        get {
            self.txtField.showIcon
        }
        set {
            self.txtField.showIcon = newValue
        }
    }
    
    @IBInspectable public var text: String {
        get {
            self.txtField.text!
        }
        set {
            if newValue != "" {
                self.txtField.text = newValue
            }
        }
    }
    
    @IBInspectable public var textSoporte: String {
        get {
            self.lblSoporte5.text!
        }
        set {
            self.lblSoporte5.text = newValue
        }
    }
    
    @IBInspectable public var disableErrors: Bool {
        get {
            self.errorsDisable
        }
        set {
            self.errorsDisable = newValue
        }
    }
    
    public var optionsMenu: [String] = [] {
        didSet {
            self.btnList.createMenu(options: optionsMenu)
        }
    }
    
    // MARK: - VMTextFieldsDelegate
    public func TxtCustomDidEndEditing(_ field: CustomTextField) {
        print("Delegado DidEndEditing...")
        guard let enumValue = EnumStateTxtBait(rawValue: field.stateField) else {
            print("VMTextField - Estado TextField no soportado en delegado DidEndEditing....")
            return
        }
        
        if !field.text!.isEmpty && !field.isValid() && !self.errorsDisable {
            self.estadoCampo = EnumStateTxtBait.error.rawValue
            
            switch self.tipoCampo {
            case EnumTypeTxtBait.text.rawValue:
                self.lblSoporte5.text = Constants.Messages.Error.Text.format
            case EnumTypeTxtBait.phone.rawValue:
                self.lblSoporte5.text = Constants.Messages.Error.Phone.format
            case EnumTypeTxtBait.email.rawValue:
                self.lblSoporte5.text =  Constants.Messages.Error.Mail.format
            case EnumTypeTxtBait.psswrd.rawValue:
                if !field.isSizeMinCorrect() {
                    self.lblSoporte5.text =  Constants.Messages.Error.Pwd.minCharacters
                } else if !field.containNumber() {
                    self.lblSoporte5.text =  Constants.Messages.Error.Pwd.minNumber
                } else if !field.containSpecialCharacter() {
                    self.lblSoporte5.text =  Constants.Messages.Error.Pwd.specialCharacters
                } else if !field.containMayus() {
                    self.lblSoporte5.text =  Constants.Messages.Error.Pwd.mayus
                } else {
                    self.lblSoporte5.text =  Constants.Messages.Error.Pwd.format
                }
            default:
                self.lblSoporte5.text = ""
                print("Custom - Sin error definido al validar campo...")
            }
        } else {
            self.estadoCampo = EnumStateTxtBait.enable.rawValue
            self.lblSoporte5.text = ""
        }
        delegateExterno?.VMTxtMiBaitDidEndEditingEx(self, txtField: field)
        self.placeHolderCampo = auxPlaceholder
    }
    
    public func TxtCustomDidBeginEditing(_ field: CustomTextField) {
        self.estadoCampo = EnumStateTxtBait.focus.rawValue
        
        var tipo: String = ""
        switch  field.typeField {
        case EnumTypeTxtBait.text.rawValue:
            tipo = "Campo Texto"
        case EnumTypeTxtBait.phone.rawValue:
            tipo = "Campo Phone"
        case EnumTypeTxtBait.psswrd.rawValue:
            tipo = "Campo Password"
        case EnumTypeTxtBait.email.rawValue:
            tipo = "Campo Email"
        case EnumTypeTxtBait.number.rawValue:
            tipo = "Campo Número"
        default:
            tipo = "Campo Lista"
        }
        
        print("\nDelegado DidBeginEditing \(tipo)")
        guard let enumValue = EnumStateTxtBait(rawValue: field.stateField) else {
            print("VMTextField - Estado TextField no soportado en delegado DidBeginEditing....")
            return
        }
        
        self.lblSoporte5.text = ""
        auxPlaceholder = self.placeHolderCampo
        self.placeHolderCampo = ""
        delegateExterno?.VMTxtMiBaitDidBeginEditingEx(self, txtField: field)
    }
    
    public func TxtCustomChangeCharacter(_ field: CustomTextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) {
        print("Delegado ChangeCharacter...")
        delegateExterno?.VMTxtMiBaitChangeCharacterEx?(self, txtField: field, shouldChangeCharactersIn: range, replacementString: string)
    }
    
    // Delegados Métodos Secundarios
    public func TxtCustomShouldReturn(_ field: CustomTextField) {
        delegateExterno?.VMTxtMiBaitShouldReturnEx?(self, txtField: field)
    }
    
    public func TxtCustomShouldBeginEditing(_ field: CustomTextField) -> Bool {
        return true
    }
    
    // MARK: - CustomButtonListDelegate
    func BtnListWillDisplayMenu(_ btn: CustomButtonList) {
        self.delegateExterno?.VMTxtMiBaitWillDisplayMenuEx?(self, txtField: self.txtField)
    }
    
    func BtnListDidEndEditing(_ btn: CustomButtonList, text: String, index: Int) {
        self.txtField.text = text
        delegateExterno?.VMTxtMiBaitDidEndSelecOptiontEx?(self, txtField: self.txtField, index: index)
        delegateExterno?.VMTxtMiBaitDidEndEditingEx(self, txtField: self.txtField)
    }
}
