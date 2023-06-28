//
//  PredatorController.swift
//  JP Apex Predators
//
//  Created by Anisa Fatimah Azzahra on 26/06/23.
//

import Foundation

class PredatorController {
    var apexPredators : [ApexPredator] = []
    private var allApexPredators : [ApexPredator] = []
    let typeFilters = ["All", "Land", "Air", "Sea"]
    
    init() {
        decodeApexPredatorDate()
    }
    
    func decodeApexPredatorDate(){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase // the default is camelCase.
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
            } catch {
                print("error decoding: \(error)")
            }
        }
    }
    
    func typeIcon(for type: String)-> String{
        switch type{
            case "All": return "square.stack.3d.up.fill"
            case "Land": return "leaf.fill"
            case "Air" : return "wind"
            case "Sea" : return "drop.fill"
            default : return "questionmark"
        }
    }
    
    func filterBy(type: String){
        switch type {
        case "Land", "Air", "Sea":
            apexPredators = allApexPredators.filter{
                $0.type == type.lowercased()
            }
            
        default: apexPredators = allApexPredators
        }
    }
    
    func sortByAlphabetical(){
        apexPredators.sort(by: {$0.name < $1.name})
    }
    
    func sortByMovieAppearance(){
        apexPredators.sort(by: {$0.id < $1.id})
    }
}
