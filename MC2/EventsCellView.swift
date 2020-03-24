//
//  CelulaEventos.swift
//  MC2
//
//  Created by Eloisa Falcão on 14/05/19.
//  Copyright © 2019 Eloisa Falcão. All rights reserved.
//

import UIKit

class CelulaEventos: UITableViewCell {

    @IBOutlet weak var imagemEvento: UIImageView!
    @IBOutlet weak var nomeEvento: UILabel!
    @IBOutlet weak var dataEvento: UILabel!
    @IBOutlet weak var localEvento: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
