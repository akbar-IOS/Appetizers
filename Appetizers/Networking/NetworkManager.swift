//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Akbar Abdullo on 4/15/26.
//

import Foundation
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    static let baseURL = "https://raw.githubusercontent.com/akbar-IOS/appetizers-json/main/"
    private let appetizerURL = baseURL + "appetizers.json"
    private var cache = NSCache<NSString, UIImage>()
    private init() {}
    
    func getAppetizers(completion: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
            if let  _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decoderResponce = try decoder.decode(AppetizerResponse.self, from: data)
                completion(.success(decoderResponce.request))
            }catch {
                completion(.failure(.invalidData))
            }
            
        }
        task.resume()
    }
    
    
    func downloadImage(fromURLString urlString: String , completed: @escaping (UIImage?) -> Void){
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
        }
        
        task.resume()
    }
}
