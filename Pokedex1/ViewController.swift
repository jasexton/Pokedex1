//
//  ViewController.swift
//  Pokedex1
//
//  Created by Jack Sexton on 5/4/18.
//  Copyright © 2018 Jack Sexton. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var tableView: UITableView!
    
    var pokemon = Pokemon()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        pokemon.getPokemon
        {
            self.tableView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "ShowDetail"
        {
            let destination = segue.destination as! DetailViewController
            let selectedIndex = tableView.indexPathForSelectedRow!
            destination.pokeData.name = pokemon.pokeArray[selectedIndex.row].name
            destination.pokeData.pokeURL = pokemon.pokeArray[selectedIndex.row].url
        }
    }
 

}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return pokemon.pokeArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = pokemon.pokeArray[indexPath.row].name
        return cell
    }
    
}

