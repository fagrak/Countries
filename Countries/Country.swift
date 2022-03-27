//
//  Country.swift
//  Countries
//
//  Created by Furkan Agrak on 26.03.2022.
//

import Foundation

struct Country: Codable, Identifiable {
    let id: String
    let name: String
    let code: String
    let capital: String
    let flagImageUri: String
    let callingCode: String
    let currencyCodes: String
   
    static let allCountries: [Country] = Bundle.main.decode("countries.json")
        static let example = allCountries[0]
    
}
