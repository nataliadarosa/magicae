//
//  TelaFinalViewController.swift
//  Signo ao contrário
//
//  Created by Natalia da Rosa on 01/08/21.
//

import UIKit

class TelaFinalViewController: UIViewController {
    
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var textViewDescricao: UITextView!
    @IBOutlet weak var botaoTentarNovamente: BotaoPadrao!
    @IBOutlet weak var botaoVoltarMenu: BotaoPadrao!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        iniciar()
    }

    @IBAction func clicouTentarNovamente(_ sender: Any) {
    }
    
    @IBAction func clicouRetornarMenu(_ sender: Any) {
        QuizzSingleton.shared.zerarRespostas(primeiraFase: true)
        QuizzSingleton.shared.zerarRespostas(primeiraFase: false)
        
        dismiss(animated: true)
    }
    
}

extension TelaFinalViewController {
    func iniciar() {
        let rect = CGRect(origin: textViewDescricao.bounds.origin, size: textViewDescricao.contentSize)
        let camadaGradienteTitulo = criarCamadaGradiente(comArea: labelTitulo.bounds)
        let camadaGradienteDescricao = criarCamadaGradiente(comArea: rect)
        let camadaGradienteBotao = criarCamadaGradiente(comArea: botaoTentarNovamente.titleLabel!.bounds)
        
        labelTitulo.textColor = criarCorGradiente(camadaGradiente: camadaGradienteTitulo)
        textViewDescricao.textColor = criarCorGradiente(camadaGradiente: camadaGradienteDescricao)
        botaoTentarNovamente.setTitleColor(criarCorGradiente(camadaGradiente: camadaGradienteBotao), for: .normal)
        botaoVoltarMenu.setTitleColor(criarCorGradiente(camadaGradiente: camadaGradienteBotao), for: .normal)
    }
}
