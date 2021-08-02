//
//  QuizzViewController.swift
//  Signo ao contrário
//
//  Created by Natalia da Rosa on 29/07/21.
//

import UIKit

class QuizzViewController: UIViewController {

    @IBOutlet weak var imageViewFundo: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelPergunta: UILabel!
    @IBOutlet weak var imageViewIcone: UIImageView!
    @IBOutlet weak var primeiroBotao: BotaoPadrao!
    @IBOutlet weak var segundoBotao: BotaoPadrao!
    @IBOutlet weak var terceiroBotao: BotaoPadrao!
    @IBOutlet weak var boxBotaoVoltar: BoxPadrao!
    @IBOutlet weak var boxPergunta: BoxPadrao!
    
    lazy var botoes: [BotaoPadrao] = [primeiroBotao, segundoBotao, terceiroBotao]
    let primeiraFase: Bool
    
    init(primeiraFase: Bool) {
        self.primeiraFase = primeiraFase
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        iniciar()
        atualizarInterface()
    }
    
    @IBAction func clicouResposta(_ sender: UIButton!) {
        let questaoAtual = QuizzSingleton.shared.retornaQuestaoAtual(primeiraFase: primeiraFase)
        
        let selecao = sender.tag
        let resposta: String = questaoAtual.opcoes[selecao].elemento
        
        QuizzSingleton.shared.adicionarResposta(resposta, primeiraFase: primeiraFase)
        
        if QuizzSingleton.shared.ehUltimaQuestao(primeiraFase: primeiraFase) {
            if primeiraFase {
                let elementoController = ElementosViewController(elemento: .fogo())
                navigationController?.pushViewController(elementoController, animated: true)
            } else {
                let telaFinal = TelaFinalViewController()
                navigationController?.pushViewController(telaFinal, animated: true)
            }
        } else {
            atualizarInterface()
        }
    }

    @IBAction func clicouVoltar(_ sender: Any) {
        let primeiraQuestao = QuizzSingleton.shared.ehPrimeiraQuestao(primeiraFase: primeiraFase)
        if !primeiraFase && primeiraQuestao {
            QuizzSingleton.shared.zerarRespostas(primeiraFase: primeiraFase)
            navigationController?.popViewController(animated: true)
        } else {
            QuizzSingleton.shared.voltarQuestao(primeiraFase: primeiraFase)
            atualizarInterface()
        }
    }
    
}

extension QuizzViewController {
    func iniciar() {
        let camadaGradiente = criarCamadaGradiente(comArea: labelTitulo.bounds)
        let corGradiente = criarCorGradiente(camadaGradiente: camadaGradiente)
        
        labelTitulo.textColor = corGradiente
    }
    
    func atualizarInterface() {
        var itensAnimados: [UIView] = [boxPergunta]
        let questaoAtual = QuizzSingleton.shared.retornaQuestaoAtual(primeiraFase: primeiraFase)
        let corTema = questaoAtual.retornaCorTema()
        
        botoes.forEach { $0.isHidden = true }
        
        imageViewFundo.image = questaoAtual.retornaFundo()
        imageViewIcone.image = questaoAtual.retornaIcone()
        
        labelTitulo.text = questaoAtual.titulo
        labelPergunta.text = questaoAtual.pergunta
        
        boxBotaoVoltar.backgroundColor = corTema
        boxPergunta.backgroundColor = corTema
        
        let numeroDeRespostas = questaoAtual.opcoes.count
        
        for indice in 0..<numeroDeRespostas {
            let botao = botoes[indice]
            let opcao = questaoAtual.opcoes[indice]
            
            botao.isHidden = false
            botao.backgroundColor = corTema
            botao.setTitle(opcao.titulo, for: .normal)
            
            itensAnimados.append(botao)
        }
        
        itensAnimados.forEach { elemento in
            elemento.alpha = 0
        }
        
        if QuizzSingleton.shared.ehPrimeiraQuestao(primeiraFase: primeiraFase) && primeiraFase {
            boxBotaoVoltar.isHidden = true
        } else {
            boxBotaoVoltar.isHidden = false
        }
        
        itensAnimados.forEach { elemento in
            UIView.animate(withDuration: 0.7) {
                elemento.isHidden = false
                elemento.alpha = 1
                elemento.layoutIfNeeded()
            }
        }
    }
}
