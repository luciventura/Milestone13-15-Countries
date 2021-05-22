//
//  ViewController.swift
//  Milestone13-15
//
//  Created by Luciene Ventura on 18/05/21.
//

import UIKit


struct Country: Decodable {
    var name: String?
    var capital: String?
    var region: String?
    var subregion: String?
    var area: Double?
    var borders = [String] ()
    var population: Int?
    
    
}

class ViewController: UITableViewController {
    var countriesArray = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Country"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let urlString = "https://restcountries.eu/rest/v2/all?fields=name;capital;region;subregion;area;borders;population"
        
        DispatchQueue.global(qos: .userInitiated).async {
            [weak self]  in
            let url = URL(string: urlString)!
            if let data = try? Data(contentsOf: url){
                let decoder = JSONDecoder()
                let jsonCountries = try! decoder.decode([Country].self, from: data)
                self?.countriesArray = jsonCountries
                DispatchQueue.main.async {
                    [weak self] in
                    
                    self?.tableView.reloadData()
                }
                return
            }
            self?.showError()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let countryName = countriesArray[indexPath.row]
        
        cell.textLabel?.text = countryName.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController
        vc!.selectedInfo = countriesArray[indexPath.row]
        
            
        navigationController?.pushViewController(vc!, animated: true)
    
    }
    
    func showError() {
        DispatchQueue.main.async {
            [weak self] in
            let ac = UIAlertController(title: "Loading Error", message: "There was a problem loading the feed; please check your network connection", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            
            self?.present(ac, animated: true)
        }
    }

}

