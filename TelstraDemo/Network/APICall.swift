//
//  APICall.swift
//  TelstraDemo
//
//  Created by Monika Jadhav on 06/05/20.
//  Copyright © 2020 rp00612313. All rights reserved.
//

import Foundation

class APICall : NSObject {
    
    
    /// This method is to get Images Data
    func getImages(completion: @escaping (Result<ImageModel, Error>) -> Void) {
        getRequest(requestUrl: URL(string: Constants.ImagesURL.url)!, resultType: ImageModel.self) { result in
            switch(result) {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    //MARK: - API CLIENT
       
       private func getRequest<T: Decodable>(requestUrl: URL, resultType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
           URLSession.shared.dataTask(with: requestUrl) { (data, response, error) in
               if let err = error {
                   completion(.failure(err))
                   print(err.localizedDescription)
               } else {
                   guard let data = data else { return }
                   let jsonString = String(decoding: data, as: UTF8.self)
                   do {
                       let results = try JSONDecoder().decode(T.self, from: jsonString.data(using: .utf8)!)
                       completion(.success(results))
                   } catch {
                       print(error.localizedDescription)
                       completion(.failure(error))
                   }
               }
               }.resume()
       }
}
