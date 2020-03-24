//
//  TableViewControllerEventos.swift
//  MC2
//
//  Created by Eloisa Falcão on 14/05/19.
//  Copyright © 2019 Eloisa Falcão. All rights reserved.
//

import UIKit

class EventsViewController: UITableViewController, UISearchBarDelegate{
    
    var userData:String = "a"
    var searchResults : [(Event)] = []
    var events : [(Event)] = []
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchResults = events.filter({ (aPlace) -> Bool in
            aPlace.nome.contains(searchBar.text!) || aPlace.descricao.contains(searchBar.text!) || aPlace.local.contains(searchBar.text!) || aPlace.categoria.contains(searchBar.text!) || aPlace.data.contains(searchBar.text!)
        })
        tableView.reloadData()
        
        if searchBar.text == "" {
            searchResults = JSONHandler.shared.vetorEventos
            tableView.reloadData()
        }
    }
    
    func createSearchBar(){
        
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Buscar Evento"
        searchBar.delegate = self
        searchBar.tintColor = #colorLiteral(red: 1, green: 0.1719938815, blue: 0.424487114, alpha: 1)
        
        
        self.navigationItem.titleView = searchBar
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        searchBar.showsCancelButton = true
        searchBar.resignFirstResponder()
        searchResults = events
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchBar()
        searchResults = JSONHandler.shared.vetorEventos
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        JSONHandler.shared.testeAPI { (events, error) in
            guard error == nil else {
                print("Erro na busca WEB!!!")
                return
            }
            self.events = events
            self.searchResults = events
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellEventos = self.tableView.dequeueReusableCell(withIdentifier: "cellEventos", for: indexPath) as! EventCell

        cellEventos.nomeEvento?.text = searchResults[indexPath.row].nome.trimmingCharacters(in: CharacterSet(charactersIn: " "))
        cellEventos.dataEvento?.text = searchResults[indexPath.row].data
        cellEventos.localEvento?.text = searchResults[indexPath.row].local
        cellEventos.imagemEvento?.image = UIImage(named: searchResults[indexPath.row].foto)

        return cellEventos
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! EventViewController).eventos = searchResults[tableView.indexPathForSelectedRow!.row]
    }
}

   


