//
//  TableViewControllerEventos.swift
//  MC2
//
//  Created by Eloisa Falcão on 14/05/19.
//  Copyright © 2019 Eloisa Falcão. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchBar()
        tableView.delegate = self
        tableView.dataSource = self
        searchResults = JSONHandler.shared.vetorEventos
        
        JSONHandler.shared.testeAPI { (events, error) in
            guard error == nil else {
                print("Erro na API.")
                return
            }
            self.events = events
            self.searchResults = events
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    var searchResults : [(Event)] = []
    var events : [(Event)] = []
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchResults = events.filter({ (anEvent) -> Bool in
            anEvent.nome.contains(searchBar.text!) || anEvent.descricao.contains(searchBar.text!) || anEvent.local.contains(searchBar.text!) || anEvent.categoria.contains(searchBar.text!) || anEvent.data.contains(searchBar.text!)
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
        searchBar.placeholder = "Buscar eventos"
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let eventCell = self.tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventCell
        eventCell.layer.cornerRadius = 4
        
        eventCell.nomeEvento?.text = searchResults[indexPath.row].nome.trimmingCharacters(in: CharacterSet(charactersIn: " "))
        eventCell.dataEvento?.text = searchResults[indexPath.row].data
        eventCell.localEvento?.text = searchResults[indexPath.row].local
        eventCell.imagemEvento?.image = UIImage(named: searchResults[indexPath.row].foto)
        
        return eventCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "eventSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! EventViewController).eventos = searchResults[tableView.indexPathForSelectedRow!.row]
    }
}




