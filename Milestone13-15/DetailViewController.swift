//
//  DetailViewController.swift
//  Milestone13-15
//
//  Created by Luciene Ventura on 20/05/21.
//

import UIKit

class DetailViewController: UIViewController {
    var selectedInfo: Country?

    @IBOutlet var info: UILabel!
    @IBOutlet var capital: UILabel!
    @IBOutlet var region: UILabel!
    @IBOutlet var subregion: UILabel!
    @IBOutlet var area: UILabel!
    @IBOutlet var borders: UILabel!
    @IBOutlet var population: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Info"
        navigationItem.largeTitleDisplayMode = .never

        info.text = "Information about \(selectedInfo?.name ?? "No name"):"
        info.textAlignment = .center
        
        
        capital.text = "Capital: \(selectedInfo?.capital ?? " ")"

        region.text = "Region: \(selectedInfo?.region ?? " ")"
        
        subregion.text = "Subregion: \(selectedInfo?.subregion ?? " ")"
        
        borders.text = buildBorders()
        
        area.text = buildArea()
        
        population.text = buildPopulation()
        
        view.addSubview(capital)
        view.addSubview(region)
        view.addSubview(subregion)
        view.addSubview(borders)
        view.addSubview(area)
        
        
        
    

        
    }
    

    func buildArea() -> String {
        if let area = selectedInfo?.area {
                return "Area: \(area) km²"
            }
            return "Area: unknown"
        }
    
    func buildBorders() -> String {
        if let borders = selectedInfo?.borders {
            return "Borders: \(borders)"
        }
        return "No Borders"
    }
    
    func buildPopulation() -> String {
        if let population = selectedInfo?.population {
            return "Population: \(population)"
        }
        return "No population"
    }
}
