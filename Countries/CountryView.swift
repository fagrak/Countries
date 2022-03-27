//
//  CountryView.swift
//  Countries
//
//  Created by Furkan Agrak on 26.03.2022.
//

import SwiftUI

struct CountryView: View {
    let country: Country
    
    @EnvironmentObject var favorites : Favorites
    
    var body: some View {
        ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                       
                        
                        HStack{
                        AsyncImage(url: URL(string: country.flagImageUri), scale: 4.0).frame(width: 1, height: 1, alignment: .bottom).scaledToFit()
                        }.frame(width: 350, height: 250, alignment: .bottom)
                        
                        Group {
                            Text("Country Code: \(country.code)")
                                .padding(.vertical)
                                .toolbar() {
                                    Button(favorites.contains(country) ? "Delete" : "Save") {
                                        if favorites.contains(country) {
                                            favorites.remove(country)
                                        } else {
                                            favorites.add(country)
                                        }
                                    }
                                    .buttonStyle(.borderedProminent)
                                    .padding()
                                }
                           
                            Text("Capital: \(country.capital)")
                            Text("Phone Code: \(country.callingCode)")
                            Text("Currency Code: \(country.currencyCodes)")
                                
                            Button(action: {
                                if let url = URL(string: "https://www.wikidata.org/wiki/\(country.id)") {
                                   UIApplication.shared.open(url)
                                }
                            }) {
                                Text("More info")
                            }
                            .buttonStyle(.borderedProminent)
                            .padding()
                        }
                        .padding(.horizontal)
    }
}
        .navigationTitle("\(country.name), \(country.code)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CountryView(country: Country.example)
        }
        .environmentObject(Favorites())
    }
}
