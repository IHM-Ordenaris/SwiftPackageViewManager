//
//  FontManager.swift
//  ViewManagerSP
//
//  Created by Ignacio Hernández on 20/11/24.
//

import UIKit
import CoreText

public class FontManager {
    public static func checkResourcesInBundle() {
        if let resourceURL = Bundle.module.resourceURL {
            let contents = try? FileManager.default.contentsOfDirectory(at: resourceURL, includingPropertiesForKeys: nil)
            print("\nRECURSOS ENCONTRADOS: \(contents ?? [])")
        }
    }
    
    public static func registerFonts() {
        // Bundle del paquete
        let bundle = Bundle.module
        
        // Nombres de los archivos de fuente
        let fontFiles = ["GothamRnd-Bold", "GothamRnd-Book", "GothamRnd-Medium"]

        for fontFile in fontFiles {
            if let fontURL = bundle.url(forResource: fontFile, withExtension: "otf"),
               let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
               let font = CGFont(fontDataProvider) {
                var error: Unmanaged<CFError>?
                if !CTFontManagerRegisterGraphicsFont(font, &error) {
                    print("Error al registrar la fuente \(fontFile): \(String(describing: error?.takeUnretainedValue()))")
                } else {
                    print("Fuente \(fontFile) registrada exitosamente.")
                }
            } else {
                print("No se pudo encontrar la fuente \(fontFile) en el bundle del paquete.")
            }
        }
    }
    
    public static func confirmRegisterFont() {
        for family in UIFont.familyNames {
            print("Family: \(family)")
            for font in UIFont.fontNames(forFamilyName: family) {
                print("Font: \(font)")
            }
        }
    }
}

