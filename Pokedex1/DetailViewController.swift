//
//  DetailViewController.swift
//  Pokedex1
//
//  Created by Jack Sexton on 5/5/18.
//  Copyright © 2018 Jack Sexton. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!
    
    var pokeData = PokeData()
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nameLabel.text = pokeData.name
        pokeData.getPokemon
        {
          self.updateUserInterface()
        }

    }

    
    func updateUserInterface()
    {
        self.heightLabel.text = "\(self.pokeData.height)"
        self.weightLabel.text = "\(self.pokeData.weight)"
        
        // Code for images
        guard let imageURL = URL(string: pokeData.imageURL) else {return}
        do
        {
            let data = try Data(contentsOf: imageURL)
            pokeImage.image = UIImage(data: data)
        }
        catch
        {
            print("************Error \(imageURL)")
        }
    }
}
