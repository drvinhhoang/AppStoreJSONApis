//
//  Service.swift
//  AppStoreJSONApis
//
//  Created by VINH HOANG on 03/01/2022.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchApps(completion: @escaping ([Result], Error?) -> Void) {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        
        // fetch data from internet
        URLSession.shared.dataTask(with: url) { data, resp, err in
            
            if let err = err {
                #warning("will be replaced by alert")
                print("Failed to fetch apps:", err)
                return
            }
        // Success
            guard let data = data else { return }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
            } catch let jsonErr {
                completion([], jsonErr)
            }       
        }.resume() // fires off the request
    }
    
    
}
