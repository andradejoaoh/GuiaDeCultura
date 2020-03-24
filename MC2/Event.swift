//
//  Eventos.swift
//  MC2
//
//  Created by Eloisa Falcão on 09/05/19.
//  Copyright © 2019 Eloisa Falcão. All rights reserved.
//

import Foundation

public class  Event {
    
    var nome : String
    var data : String
    var horario: String
    var local : String
    var descricao : String
    var foto : String
    var categoria : String
    
    init(nome:String, data:String, local:String, descricao:String, categoria:String, horario:String) {
        
        self.nome = nome
        self.data = data
        self.horario = horario
        self.local = local
        self.descricao = descricao
        self.categoria = categoria
        self.foto = "\(categoria).jpg"
    }
}
