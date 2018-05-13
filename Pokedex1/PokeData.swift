//
//  PokeData.swift
//  Pokedex1
//
//  Created by Jack Sexton on 5/5/18.
//  Copyright © 2018 Jack Sexton. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PokeData
{
    var name = ""
    var weight = 0.0
    var height = 0.0
    var imageURL = ""
    var pokeURL = ""


func getPokemon(completed: @escaping () -> ())
{
    Alamofire.request(self.pokeURL).responseJSON
    { response in
        switch response.result
        {
        case .success(let value):
            let json = JSON(value)
            
            self.name = json["name"].stringValue
            self.weight = json["weight"].doubleValue
            self.height = json["height"].doubleValue
            self.imageURL = json["sprites"]["front_default"].stringValue
            
            
            
        case .failure(let error):
            print("There was something wrong with this \(self.pokeURL) \(error.localizedDescription)")
        }
        completed()
    }
}
}
