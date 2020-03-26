//
//  ViewController.swift
//  MC2
//
//  Created by Eloisa Falcão on 09/05/19.
//  Copyright © 2019 Eloisa Falcão. All rights reserved.
//

import UIKit
import SafariServices

class DescricaoLocalViewController: UIViewController {
    
    var centro : Place?
 
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imagemLocal: UIImageView!
    @IBOutlet weak var tituloLocal: UILabel!
    @IBOutlet weak var localizaoLocal: UILabel!
    @IBOutlet weak var horarioDeFuncLocal: UILabel!
    @IBOutlet weak var descricaoLocal: UILabel!
    @IBOutlet weak var readMoreButton: UIButton!
    @IBOutlet weak var seeMapButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let centro =  centro {
            imagemLocal.image = UIImage(named: "\(centro.name.trimmingCharacters(in: CharacterSet(charactersIn: " "))).jpg")
            tituloLocal.text = centro.name
            localizaoLocal.text = centro.location
            horarioDeFuncLocal.text = centro.activeTime
            descricaoLocal.text = centro.description
            contentView.layer.cornerRadius = 24
        }
        readMoreButton.layer.cornerRadius = 6
        seeMapButton.layer.cornerRadius = 6
        extendedLayoutIncludesOpaqueBars = true
    }
    
    @IBAction func readMore(_ sender: Any) {
        if let link = centro?.link {
            guard let url = URL(string: link) else { return }
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
    }
    
    @IBAction func seeOnMap(_ sender: Any) {
        
    }
    
}

