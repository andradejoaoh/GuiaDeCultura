//
//  NavigationControllerEventos.swift
//  MC2
//
//  Created by Eloisa Falcão on 14/05/19.
//  Copyright © 2019 Eloisa Falcão. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    
    public var eventos : Event?
    
    @IBOutlet weak var imagemEvento: UIImageView!
    
    @IBOutlet weak var tituloEvento: UILabel!
    
    @IBOutlet weak var dataEvento: UILabel!
    
    @IBOutlet weak var horarioEvento: UILabel!
    
    @IBOutlet weak var localizacaoEvento: UILabel!
    
    @IBOutlet weak var descricaoEvento: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let eventos = eventos {
            imagemEvento.image = UIImage(named: eventos.foto)
            tituloEvento.text = eventos.nome
            dataEvento.text = eventos.data
            horarioEvento.text = eventos.horario
            localizacaoEvento.text = eventos.local
            descricaoEvento.text = eventos.descricao
        }
        
    }
}
