//
//  BotaoPadrao.swift
//  Signo ao contrário
//
//  Created by Natalia da Rosa on 28/07/21.
//

import UIKit

@IBDesignable
class BotaoPadrao: UIButton {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
}
