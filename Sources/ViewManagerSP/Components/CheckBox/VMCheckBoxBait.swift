//
//  VMCheckBoxBait.swift
//  ViewManagerSP
//
//  Created by Ignacio Hernández on 03/12/24.
//

import UIKit

@objc public protocol VMCheckBoxDelegate {
    @objc func VMCheckBoxBaitWillSelectOption(_ checkBox: VMCheckBoxBait, isSelect: Bool)
}

public class VMCheckBoxBait: UIView {
    // MARK: - Variables
    @objc weak public var delegateExterno: VMCheckBoxDelegate?
    private var selected: Bool = false
    private var colorBorder: UIColor = UIColor.baitColor_checkboxNoSelectBORDER()
    
    // MARK: - IBOutlets
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var viewBorder: UIView!
    @IBOutlet weak var viewCircle: UIView!
    
    
    // MARK: - Funciones inicio
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
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        self.traitCollection.performAsCurrent {
            self.viewBorder.layer.borderColor = self.colorBorder.cgColor
        }
        self.viewBorder.layer.borderColor = self.colorBorder.resolvedColor(with: self.traitCollection).cgColor
    }
    
    // MARK: - Funciones
    func xibSetup() {
        self.viewBG = loadViewFromNib()
        self.viewBG.frame = bounds
        self.viewBG.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        self.viewBG.layoutIfNeeded()
        self.layoutIfNeeded()
        addSubview(self.viewBG)
        self.viewBG.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
        
        // Config elements
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapView(tapGestureRecognizer:)))
        self.viewBorder.backgroundColor = UIColor.baitColor_checkboxBG()
        self.viewBorder.layer.borderWidth = Constants.borderWidthCheckBox
        self.viewBorder.layer.borderColor = self.colorBorder.cgColor
        self.viewBorder.layer.cornerRadius = Constants.cornerRadiusCheckBox
        self.viewBorder.addGestureRecognizer(tapGesture)
        self.viewBorder.isUserInteractionEnabled = true
        
        self.viewCircle.backgroundColor = UIColor.baitColor_checkboxSELECT()
        self.viewCircle.layer.cornerRadius = self.viewCircle.frame.height / 2
        self.viewCircle.isHidden = true
    }
    
    internal func loadViewFromNib() -> UIView {
        let bundle = Bundle.module
        // Carga el XIB
        guard let view = bundle.loadNibNamed("VMCheckBoxBait", owner: self, options: nil)?.first as? UIView else {
            fatalError("No se pudo cargar el archivo XIB")
        }
        return view
    }
    
    @IBInspectable
    public var isSelect: Bool {
        get {
            return self.selected
        }
        set {
            self.selected = !newValue
            self.tapView(tapGestureRecognizer: UITapGestureRecognizer())
        }
    }
    
    @objc private func tapView(tapGestureRecognizer: UITapGestureRecognizer) {
        if !self.selected {
            self.selected = true
            self.colorBorder = UIColor.baitColor_checkboxSelectBORDER()
            self.viewCircle.isHidden = false
        } else {
            self.selected = false
            self.colorBorder = UIColor.baitColor_checkboxNoSelectBORDER()
            self.viewCircle.isHidden = true
        }
        self.viewBorder.layer.borderColor = self.colorBorder.cgColor
        delegateExterno?.VMCheckBoxBaitWillSelectOption(self, isSelect: self.selected)
    }
}
