//
//  ContentView.swift
//  NetworkingDemoApp
//
//  Created by ByRamon on 04/04/20.
//  Copyright © 2020 ByRamon. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var results = [Result]()
    var body: some View {
        NavigationView{
            List{
                ForEach(results, id: \.trackId){ item in
                    VStack(alignment: .leading){
                        Text(item.trackName).font(.headline)
                        Text(item.collectionName)
                    }
                }
            }.onAppear(perform: loadData)
            .navigationBarTitle("Songs List")
        }
    }
    func loadData(){
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song")
        else {
            print("invalid Url")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let data = data{
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    DispatchQueue.main.async {
                        self.results = decodedResponse.results
                    }
                    return
                }
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
