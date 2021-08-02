//
//  UIViewController + Extensions.swift
//  Signo ao contrário
//
//  Created by Natalia da Rosa on 01/08/21.
//

import UIKit

extension UIViewController {
    func criarCamadaGradiente(comArea area: CGRect) -> CAGradientLayer {
        let gradiente = CAGradientLayer()
        gradiente.frame = area
        gradiente.colors = [UIColor(named: "dourado-escuro")!.cgColor, UIColor(named: "dourado-claro")!.cgColor]
        gradiente.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradiente.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        return gradiente
    }
    
    func criarCorGradiente(camadaGradiente: CAGradientLayer) -> UIColor {
        UIGraphicsBeginImageContext(camadaGradiente.bounds.size)
        camadaGradiente.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return UIColor(patternImage: image!)
    }
}
