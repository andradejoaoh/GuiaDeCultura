//
//  CelulaLocais.swift
//  MC2
//
//  Created by Eloisa Falcão on 09/05/19.
//  Copyright © 2019 Eloisa Falcão. All rights reserved.
//

import UIKit

class CelulaLocais: UITableViewCell {

    @IBOutlet weak var detalheLocal: UILabel!
    @IBOutlet weak var tituloLocal: UILabel!
    @IBOutlet weak var imagemLocal: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
