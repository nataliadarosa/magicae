//
//  ElementosViewController.swift
//  Signo ao contrário
//
//  Created by Natalia da Rosa on 01/08/21.
//

import UIKit

class ElementosViewController: UIViewController {

    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var imageViewIcone: UIImageView!
    @IBOutlet weak var labelElemento: UILabel!
    @IBOutlet weak var textViewDescricao: UITextView!
    @IBOutlet weak var imageViewFundo: UIImageView!
    
    let elemento: Elemento
    
    init(elemento: Elemento) {
        self.elemento = elemento
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        iniciar()
    }
    
    @IBAction func clicouRetornar(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clicouAvancar(_ sender: Any) {
        let segundaFase = QuizzViewController(primeiraFase: false)
        navigationController?.pushViewController(segundaFase, animated: true)
    }
    
}

extension ElementosViewController {
    func iniciar() {
        let camadaGradiente = criarCamadaGradiente(comArea: labelTitulo.bounds)
        let corGradiente = criarCorGradiente(camadaGradiente: camadaGradiente)
        
        labelTitulo.textColor = corGradiente
        labelTitulo.text = "Elemento \(elemento.nome)"
        labelElemento.text = "Signos de \(elemento.nome)"
        textViewDescricao.text = elemento.descricao
        
        imageViewIcone.image = elemento.retornaIcone()
        imageViewFundo.image = elemento.retornaFundo()
        
    }
}
