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
}

// MARK: Public CLASS VMTextFields
public class VMTextFieldBait: UIView, @preconcurrency CustomTextFieldDelegate {
    
    // MARK: - Variables
    @objc public var delegateExterno: VMTextFieldDelegateExterno?
    
    static var stateFieldStatic = 0
    private var errorsDisable: Bool = false
    
    //MARK: - IBOutlets
    @IBOutlet weak var viewBGB5: UIView!
    @IBOutlet weak var lblTitulo5: UILabel!
    @IBOutlet weak var imgInfo: UIImageView!
    @IBOutlet weak var txtFieldCustom: CustomTextField!
    @IBOutlet weak var lblSoporte5: UILabel!
    
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
        
        self.txtFieldCustom.delegateCustom = self
        
        self.lblSoporte5.backgroundColor = UIColor.clear
        self.lblSoporte5.text = ""
        self.lblSoporte5.font = UIFont(name: Constants.Fonts.gothamBold, size: 12.0) ?? .systemFont(ofSize: 12)
    }
    
    @objc open func tapImageHelp(tapGestureRecognizer: UITapGestureRecognizer) {
        delegateExterno?.VMTxtMiBaitTapImageHelpEx?(self, txtField: self.txtFieldCustom)
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
    
    // MARK: - IBinspectables
    @IBInspectable public var tipoCampo: Int = 1 {
        didSet {
            guard let enumValue = EnumTypeTxtBait(rawValue: tipoCampo) else{
                print("VMTextField - Tipo Text field no soportado....")
                return
            }
            self.txtFieldCustom.typeField = enumValue.rawValue
            if self.lblTitulo5.text == "" {
                self.lblTitulo5.text = enumValue.getTitleDefault()
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
            self.txtFieldCustom.stateField = enumValue.rawValue
            
            self.lblTitulo5.textColor = enumValue.getColorTitle()!
            self.lblSoporte5.textColor = enumValue.getColorTextoSoporte()!
        }
    }
    
    @IBInspectable public var placeHolderCampo: String = "" {
        didSet {
            var attribute = NSAttributedString(string: placeHolderCampo, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            if self.txtFieldCustom.stateField != EnumStateTxtBait.disable.rawValue {
                attribute = NSAttributedString(string: placeHolderCampo, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
            self.txtFieldCustom.attributedPlaceholder = attribute
        }
    }
    
    @IBInspectable public var textTitulo: String = "" {
        didSet {
            if textTitulo != "" {
                self.lblTitulo5.text = textTitulo
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
    
    @IBInspectable public var textSoporte: String = "" {
        didSet {
            self.lblSoporte5.text = ""
            if textSoporte != "" {
                self.lblSoporte5.text = textSoporte
            }
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
        default:
            tipo = "Campo Código"
        }
        
        print("\nDelegado DidBeginEditing \(tipo)")
        guard let enumValue = EnumStateTxtBait(rawValue: field.stateField) else {
            print("VMTextField - Estado TextField no soportado en delegado DidBeginEditing....")
            return
        }
        
        if enumValue == EnumStateTxtBait.error {
            field.stateField = EnumStateTxtBait.enable.rawValue
            self.lblSoporte5.text = ""
        }
        
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
}
