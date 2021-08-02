//
//  Quizz.swift
//  Signo ao contrário
//
//  Created by Natalia da Rosa on 29/07/21.
//

import UIKit

struct Quizz: Decodable {
    private var icone: String
    private var imagemFundo: String
    
    var titulo: String
    var pergunta: String
    var opcoes: [Opcao]
    var corTema: String
}

extension Quizz {
    func retornaIcone() -> UIImage {
        UIImage(named: icone)!
    }
    
    func retornaFundo() -> UIImage {
        UIImage(named: imagemFundo)!
    }
    
    func retornaCorTema() -> UIColor {
        UIColor(named: corTema)!
    }
}
