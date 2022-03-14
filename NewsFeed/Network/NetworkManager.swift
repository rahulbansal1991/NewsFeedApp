//
//  NetworkManager.swift
//  NewsFeed
//
//  Created by Rahul Bansal on 14/03/22.
//

import Foundation

enum DataResponseError: Error {
    case network
    case decoding
    
    var reason: String {
        switch self {
        case .network:
            return "An error occurred while fetching data"
        case .decoding:
            return "An error occurred while decoding data"
        }
    }
}


extension HTTPURLResponse {
    var hasSuccessStatusCode: Bool {
        return 200...299 ~= statusCode
    }
}

enum Result<T, U: Error> {
    case success(T)
    case failure(U)
}

protocol DataProvider {
    func fetchRemoteDataDictionary<Model: Codable>(_ val: Model.Type, url: URL, parameterDictionary : [String : Any]?, httpMethod : String, completion: @escaping (Result<Codable, DataResponseError>) -> Void)    
}

final class ClientHTTPNetworking : DataProvider {
    
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchRemoteDataDictionary<Model: Codable>(_ val: Model.Type, url: URL, parameterDictionary : [String : Any]?, httpMethod : String,
                                     completion: @escaping (Result<Codable, DataResponseError>) -> Void) {
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = httpMethod
        urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        print("URL:  \(url)")

        // Check if we have the parameters or not
        if let params = parameterDictionary {
            guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {
                return
            }
            
            urlRequest.httpBody = httpBody
            
            let strParams = String(data: try! JSONSerialization.data(withJSONObject: params, options: .prettyPrinted), encoding: .utf8 ) ?? ""
            print("Paramters: \(strParams)")
        }
        
        session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            guard let data = data
            else {
                completion(Result.failure(DataResponseError.network))
                return
            }
            
            guard let decodedResponse = try? JSONDecoder().decode(Model.self, from: data) else {
                completion(Result.failure(DataResponseError.decoding))
                return
            }
            completion(Result.success(decodedResponse))
        }).resume()
    }
}
