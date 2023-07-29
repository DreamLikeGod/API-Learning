//
//  ApiNetworking.swift
//  Networking
//
//  Created by Егор Ершов on 22.05.2022.
//

import Foundation

enum APIErrors: Error {
    case noData
}
protocol APIClient {
    func getInfo (completion: @escaping (Result<[Country], Error>) -> Void)
}
class ApiNetworking : APIClient {
    func getInfo(completion: @escaping (Result<[Country], Error>) -> Void) {
        let session = URLSession.shared
        
        let url = URL(string: "https://coronavirus.m.pipedream.net")!
        let URLReq = URLRequest(url: url)
        let dataTask = session.dataTask(with: URLReq) { data, response, error in
            
            guard let data = data else {
                completion(.failure(APIErrors.noData))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(UrlNetworking.self, from: data)
                completion(.success(response.rawData))
            } catch(let error) {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
}
