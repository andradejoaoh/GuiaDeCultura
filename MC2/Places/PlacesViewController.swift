//
//  TableViewController.swift
//  MC2
//
//  Created by Eloisa Falcão on 09/05/19.
//  Copyright © 2019 Eloisa Falcão. All rights reserved.
//

import UIKit

//LUGARES
class PlacesViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate{
    
    var searchResults : [(Place)] = []
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        JSONHandler.shared.lerArquivoCentros()
        createSearchBar()
        searchResults = JSONHandler.shared.vetorCentros
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchResults = searchResults.filter({ (aPlace) -> Bool in
            aPlace.name.contains(searchBar.text!) || aPlace.description.contains(searchBar.text!) || aPlace.location.contains(searchBar.text!)
        })
        tableView.reloadData()
        
        if searchBar.text == "" {
            tableView.reloadData()
        }
    }
    
    func createSearchBar(){
        
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Buscar lugares"
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
        searchResults = JSONHandler.shared.vetorCentros
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath) as! PlaceCell
        
        cell.layer.cornerRadius = 4
        cell.placeName.text = searchResults[indexPath.row].name.trimmingCharacters(in: CharacterSet(charactersIn: " "))
        cell.placeLocation.text = searchResults[indexPath.row].location
        cell.placeImage.image = UIImage(named: "\(searchResults[indexPath.row].name.trimmingCharacters(in: CharacterSet(charactersIn: " "))).jpg")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "placeSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! DescricaoLocalViewController).centro = searchResults[tableView.indexPathForSelectedRow!.row]
    }
    
}
