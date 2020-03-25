//
//  CelulaEventos.swift
//  MC2
//
//  Created by Eloisa Falcão on 14/05/19.
//  Copyright © 2019 Eloisa Falcão. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

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
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 4
            frame.size.height -= 2 * 5
            super.frame = frame
        }
    }
}
