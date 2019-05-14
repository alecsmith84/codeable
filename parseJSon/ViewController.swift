//
//  ViewController.swift
//  parseJSon
//
//  Created by Alec Smith on 5/13/19.
//  Copyright © 2019 Alec Smith. All rights reserved.
//

import UIKit

struct Country: Decodable {
    let name: String
    let capital: String
    let region: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = "https://api.myjson.com/bins/x45nm"
        
        let urlObj = URL(string:url)
        
        URLSession.shared.dataTask(with: urlObj!) {
            (data, response, error) in
            
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data!)
                
                for country in countries {
                    print(country.name + ": " + country.capital)
                }
            } catch {
                print("we got an error")
            }
        }.resume()
        
    }


}

