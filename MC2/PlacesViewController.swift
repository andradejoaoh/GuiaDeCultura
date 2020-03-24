//
//  ViewController.swift
//  MC2
//
//  Created by Eloisa Falcão on 09/05/19.
//  Copyright © 2019 Eloisa Falcão. All rights reserved.
//

import UIKit

class DescricaoLocalViewController: UIViewController {
    
    public var centro : Places?
 
    @IBOutlet weak var topBar: UINavigationItem!
    @IBOutlet weak var imagemLocal: UIImageView!

    @IBOutlet weak var tituloLocal: UILabel!
    
    @IBOutlet weak var localizaoLocal: UILabel!
    
    @IBOutlet weak var horarioDeFuncLocal: UILabel!
    
    @IBOutlet weak var descricaoLocal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let centro =  centro {
            imagemLocal.image = UIImage(named: "\(centro.name.trimmingCharacters(in: CharacterSet(charactersIn: " "))).jpg")
            tituloLocal.text = centro.name
            localizaoLocal.text = centro.location
            horarioDeFuncLocal.text = centro.horarioFuncionamento
            descricaoLocal.text = centro.description
            
            
            
        }
    
        
    }


}

