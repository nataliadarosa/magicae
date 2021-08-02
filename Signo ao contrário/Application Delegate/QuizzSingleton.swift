//
//  QuizzSingleton.swift
//  Signo ao contrário
//
//  Created by Natalia da Rosa on 01/08/21.
//

import Foundation

class QuizzSingleton {
    private var respostasPrimeiraFase = [String]()
    private var indicePrimeiraFase = 0
    private var respostasSegundaFase = [String]()
    private var indiceSegundaFase = 0
    
    var questoesPrimeiraFase: [Quizz] {
        get { abrirQuestoes(primeiraFase: true) }
    }
    
    var questoesSegundaFase: [Quizz] {
        get { abrirQuestoes(primeiraFase: false) }
    }
    
    static let shared: QuizzSingleton = {
        QuizzSingleton()
    }()
    
    private init() {}
}

extension QuizzSingleton {
    func adicionarResposta(_ resposta: String, primeiraFase: Bool) {
        if primeiraFase {
            respostasPrimeiraFase.append(resposta)
            if !ehUltimaQuestao(primeiraFase: true) {
                indicePrimeiraFase += 1
            }
        } else {
            respostasSegundaFase.append(resposta)
            if !ehUltimaQuestao(primeiraFase: false) {
                indiceSegundaFase += 1
            }
        }
    }
    
    func voltarQuestao(primeiraFase: Bool) {
        if primeiraFase {
            if questaoEstaRespondida(primeiraFase: true) {
                removerUltimaQuestao(primeiraFase: true)
            }
            
            indicePrimeiraFase -= 1
        } else {
            if questaoEstaRespondida(primeiraFase: false) {
                removerUltimaQuestao(primeiraFase: false)
            }
            
            indiceSegundaFase -= 1
        }
    }
    
    func zerarRespostas(primeiraFase: Bool) {
        if primeiraFase {
            respostasPrimeiraFase = [String]()
            indicePrimeiraFase = 0
        } else {
            respostasSegundaFase = [String]()
            indiceSegundaFase = 0
        }
    }
    
    func retornaQuestaoAtual(primeiraFase: Bool) -> Quizz {
        if primeiraFase {
            return questoesPrimeiraFase[indicePrimeiraFase]
        } else {
            return questoesSegundaFase[indiceSegundaFase]
        }
    }
    
    func ehPrimeiraQuestao(primeiraFase: Bool) -> Bool {
        if primeiraFase {
            return indicePrimeiraFase == 0
        } else {
            return indiceSegundaFase == 0
        }
    }
    
    func ehUltimaQuestao(primeiraFase: Bool) -> Bool {
        if primeiraFase {
            return respostasPrimeiraFase.count == questoesPrimeiraFase.count
        } else {
            return respostasSegundaFase.count == questoesSegundaFase.count
        }
    }
    
    private func removerUltimaQuestao(primeiraFase: Bool) {
        if primeiraFase {
            respostasPrimeiraFase.removeLast()
        } else {
            respostasSegundaFase.removeLast()
        }
    }
    
    private func questaoEstaRespondida(primeiraFase: Bool) -> Bool {
        if primeiraFase {
            return (respostasPrimeiraFase.count - 1) == indicePrimeiraFase
        } else {
            return (respostasSegundaFase.count - 1) == indiceSegundaFase
        }
    }
    
    private func abrirQuestoes(primeiraFase: Bool) -> [Quizz] {
        let nomeArquivo = primeiraFase ? "local-database" : "local-database-2"
        
        guard let caminho = Bundle.main.path(forResource: nomeArquivo, ofType: "json") else {
            return [Quizz]()
        }
        
        let url = URL(fileURLWithPath: caminho)
                    
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            return try JSONDecoder().decode([Quizz].self, from: data)
        } catch {
            return [Quizz]()
        }
    }
}
