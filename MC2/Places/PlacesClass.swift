//
//  placesClass.swift
//  miniChallenge
//
//  Created by João Henrique Andrade on 06/05/19.
//  Copyright © 2019 João Henrique Andrade. All rights reserved.
//

import Foundation

public class Places {
    
    var name:String
    var description:String
    var horarioFuncionamento:String
    var location:String
    var urlFoto:String
    
    var visibility:Bool
    var isPaid:Bool
    
    var price:Float
    
    init(nome:String, descricao:String, local:String, horFunc:String){
        visibility = true
        isPaid = false
        
        name = nome
        description = descricao
        location = local
        horarioFuncionamento = horFunc
        urlFoto = "\(name).jpg"
        
        if(!isPaid){
            price = 0.0
        } else {
            price = 1.0
        }
    }
}

