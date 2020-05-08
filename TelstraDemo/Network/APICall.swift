//
//  APICall.swift
//  TelstraDemo
//
//  Created by Monika Jadhav on 06/05/20.
//  Copyright © 2020 rp00612313. All rights reserved.
//

import Foundation

class APICall : NSObject {
    
    let url = "https:dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    
    func getImages(completion: @escaping (ImageModel?, Error?) -> Void) {
        
        guard let urlStr = URL.init(string: url) else { return }
        URLSession.shared.dataTask(with: urlStr) { (data, response, error) in
            if let err = error {
                completion(nil, err)
                print(err.localizedDescription)
            } else {
                guard let data = data else { return }
                let jsonString = String(decoding: data, as: UTF8.self)
                do {
                    let results = try JSONDecoder().decode(ImageModel.self, from: jsonString.data(using: .utf8)!)
                    completion(results, nil)
                } catch {
                    print(error.localizedDescription)
                    completion(nil, error)
                }
            }
        }.resume()
    }
}
