//
//  placesClass.swift
//  miniChallenge
//
//  Created by João Henrique Andrade on 06/05/19.
//  Copyright © 2019 João Henrique Andrade. All rights reserved.
//

import Foundation

struct Place: Codable {
    let name:String
    let description:String
    let activeTime:String
    let location:String
    let pictureURL:String
    let link:String
    let isVisible:Bool
    let isPaid:Bool
    let price:Float
}

