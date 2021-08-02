//
//  BoxPadrao.swift
//  Signo ao contrário
//
//  Created by Natalia da Rosa on 28/07/21.
//

import UIKit

@IBDesignable
class BoxPadrao: UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
}
