//
//  TelaInicialViewController.swift
//  Signo ao contrário
//
//  Created by Natalia da Rosa on 28/07/21.
//

import UIKit

class TelaInicialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func clicouIniciar(_ sender: Any) {
        let quizzViewController = QuizzViewController(primeiraFase: true)
        let navigationController = UINavigationController(rootViewController: quizzViewController)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.navigationBar.isHidden = true
        
        present(navigationController, animated: true)
    }
    
}
