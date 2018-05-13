//
//  Pokemon.swift
//  Pokedex1
//
//  Created by Jack Sexton on 5/5/18.
//  Copyright © 2018 Jack Sexton. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Pokemon
{
    struct pokeData
    {
        var name = ""
        var url = ""
    }
    
    var pokeArray: [pokeData] = []
    let searchArray = "https://pokeapi.co/api/v2/pokemon/"
    
    func getPokemon(completed: @escaping () -> ())
    {
        Alamofire.request(searchArray).responseJSON { response in
            switch response.result
            {
            case .success(let value):
                let json = JSON(value)
                let numberOfPokemon = json["results"].count
                for index in 0...numberOfPokemon - 1
                {
                    let name = json["results"][index]["name"].stringValue
                    let url = json["results"][index]["url"].stringValue
                    self.pokeArray.append(pokeData(name: name, url: url))
                    print(">>>>> Data Check \(index) \(name) \(url)")
                }
                
                
                
            case .failure(let error):
                print("There was something wrong with this \(self.searchArray) \(error.localizedDescription)")
            }
            completed()
        }
    }
}
