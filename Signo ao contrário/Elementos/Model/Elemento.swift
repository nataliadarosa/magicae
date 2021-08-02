//
//  Elemento.swift
//  Signo ao contrário
//
//  Created by Natalia da Rosa on 01/08/21.
//

import UIKit

struct Elemento {
    private var imagemFundo: String
    private var icone: String
    private var corTema: String
    
    var nome: String
    var descricao: String
}

extension Elemento {
    func retornaIcone() -> UIImage {
        UIImage(named: icone)!
    }
    
    func retornaFundo() -> UIImage {
        UIImage(named: imagemFundo)!
    }
    
    func retornaCorTema() -> UIColor {
        UIColor(named: corTema)!
    }
    
    static func fogo() -> Elemento {
        Elemento(imagemFundo: "questoes-azul-scroll",
                 icone: "icone-fogo",
                 corTema: "azul-claro",
                 nome: "fogo",
                 descricao: "Áries, Leão e Sagitário são os signos do elemento fogo e assemelham com o próprio elemento por serem versáteis, dominantes e mutaveis. Determinação,levar a luz onde tem sombra, animação, alegria, espontaneidade e imprevisibilidade são características que fazem parte da sua personalidade. Enxergam o mundo através da intuição, apresentam fé em seus ideais e são esperançosos. Não são de ficar parados, buscam a evolução e transformação, e as vezes tem tanta força que podem ferir quem está em seu caminho. Ao contrário do elemento água, são centrados em si mesmos priorizando seus desejos, e por isso considerados egocêntricos.")
    }
}
