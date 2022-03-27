//
//  SavedView.swift
//  Countries
//
//  Created by Furkan Agrak on 27.03.2022.
//

import SwiftUI

struct SavedView: View {
    
    let countries: [Country] = Bundle.main.decode("countries.json")
    
    @StateObject var favorites = Favorites()
    var body: some View {
        NavigationView {
                   List(countries) { country in
                       NavigationLink {
                           CountryView( country: country)
                       } label: {
                           
                               VStack(alignment: .leading) {
                                   if favorites.contains(country) {
                                       Text(country.name)
                                           .font(.headline)
                                   }
                               }
                           
                           if favorites.contains(country) {
                               Spacer()
                               Image(systemName: "heart.fill")
                                   .accessibilityLabel("Saved")
                                   .foregroundColor(.red)
                           }
                       }
                   }
                   .navigationTitle("Saved List")
        }
        .environmentObject(favorites)
    }
}

struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
    }
}
