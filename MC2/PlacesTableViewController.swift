//
//  TableViewController.swift
//  MC2
//
//  Created by Eloisa Falcão on 09/05/19.
//  Copyright © 2019 Eloisa Falcão. All rights reserved.
//

import UIKit

//LUGARES
class TableViewController: UITableViewController, UISearchBarDelegate{
    
    var userData:String = "a"
    var searchResults : [(Places)] = []
    var gerenciador = FileController()

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchResults = gerenciador.vetorCentros.filter({ (aPlace) -> Bool in
            aPlace.name.contains(searchBar.text!) || aPlace.description.contains(searchBar.text!) || aPlace.location.contains(searchBar.text!)
        })
        tableView.reloadData()
        
        if searchBar.text == "" {
            searchResults = gerenciador.vetorCentros
            tableView.reloadData()
        }
    }
    
    func createSearchBar(){
        
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Buscar Local"
        searchBar.delegate = self
        searchBar.tintColor = #colorLiteral(red: 1, green: 0.1719938815, blue: 0.424487114, alpha: 1)
        
        self.navigationItem.titleView = searchBar
    }
//
//    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
//        searchBar.showsCancelButton = true
//        return true
//    }
//
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        searchBar.endEditing(true)
//        searchBar.resignFirstResponder()
//    }
//
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        searchBar.showsCancelButton = true
        searchBar.resignFirstResponder()
        searchResults = gerenciador.vetorCentros
        tableView.reloadData()
    }

//
//    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
//        searchBar.endEditing(true)
//        tableView.reloadData()
//        return true
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gerenciador.lerArquivoCentros()
        createSearchBar()
        searchResults = gerenciador.vetorCentros
     
       
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CelulaLocais
        
        cell.tituloLocal?.text = searchResults[indexPath.row].name.trimmingCharacters(in: CharacterSet(charactersIn: " "))
        cell.detalheLocal?.text = searchResults[indexPath.row].location
        cell.imagemLocal?.image = UIImage(named: "\(searchResults[indexPath.row].name.trimmingCharacters(in: CharacterSet(charactersIn: " "))).jpg")
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! DescricaoLocalViewController).centro = searchResults[tableView.indexPathForSelectedRow!.row]
    }

}
