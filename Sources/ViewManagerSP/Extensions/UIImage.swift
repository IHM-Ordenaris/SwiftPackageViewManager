//
//  UIImage.swift
//  ViewManagerSP
//
//  Created by Ignacio Hernández on 22/11/24.
//


import UIKit

@objc public extension UIImage {
    class func getAsset(name: String) -> UIImage? {
        return UIImage(named: name, in: Bundle.module, compatibleWith: nil) ?? nil
    }
}
