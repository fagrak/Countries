//
//  Favorites.swift
//  Countries
//
//  Created by Furkan Agrak on 26.03.2022.
//

import Foundation

class Favorites: ObservableObject {
    private var countries: Set<String>
    private let saveKey = "Favorites"

    init() {
        // Load func ekle
        countries = []
    }

    func contains(_ country: Country) -> Bool {
        countries.contains(country.id)
    }

    func add(_ country: Country) {
        objectWillChange.send()
        countries.insert(country.id)
        save()
    }

    func remove(_ country: Country) {
        objectWillChange.send()
        countries.remove(country.id)
        save()
    }

    func save() {
        // 
    }
}
