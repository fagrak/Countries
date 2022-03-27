//
//  ContentView.swift
//  Countries
//
//  Created by Furkan Agrak on 26.03.2022.
//

import SwiftUI

struct ContentView: View {
    let countries: [Country] = Bundle.main.decode("countries.json")


    @StateObject var favorites = Favorites()
    @State private var showSavedView = false
    
    var body: some View {
        
        NavigationView {
                   List(countries) { country in
                       NavigationLink {
                           CountryView( country: country)
                       } label: {
                               VStack(alignment: .leading) {
                                   Text(country.name)
                                       .font(.headline)
                               }
                           
                           if favorites.contains(country) {
                               Spacer()
                               Image(systemName: "heart.fill")
                                   .accessibilityLabel("Saved")
                                   .foregroundColor(.red)
                           }
                       }
                   }
                   .navigationTitle("Countries")
        }
        .environmentObject(favorites)
                
        HStack{
            
                Button(action: {
                }) {
                    NavigationLink(destination: ContentView()) {
                    Text("Home")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 40)
                            .background(Color.black)
                            .cornerRadius(15)
                            .padding()
                    }
                }
            
            Button(action: {
            }) {
                NavigationLink(destination: SavedView()) {
                Text("SavedList")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 40)
                        .background(Color.black)
                        .cornerRadius(15)
                        .padding()
                        
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
