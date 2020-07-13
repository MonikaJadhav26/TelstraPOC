//
//  FactsViewModel.swift
//  TelstraDemo
//
//  Created by Monika Jadhav on 06/05/20.
//  Copyright © 2020 rp00612313. All rights reserved.
//

import Foundation

class FactsViewModel : NSObject {
    
    //MARK: - Parameters
    
    var apiCallObject: APICall = APICall()
    var factsData : [Row] = [Row]()
    var titleForView = String()
    
    //MARK: - API Call
    
    func fetchFactsData(completion: @escaping (Result<Bool, Error>) -> Void) {
        apiCallObject.getImages { (result) in
            DispatchQueue.main.async {
                switch(result) {
                case .success(let result):
                    self.factsData = result.rows
                    self.titleForView = result.title
                    completion(.success(true))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    //MARK: - Private Methods
    
    func getTitleForView() -> String {
        return titleForView
    }
    
    func getNumberOfFacts(section: Int) -> Int {
        return self.factsData.count
    }
    
    func getCellTitleText(indexPath: IndexPath) -> String {
        return self.factsData[indexPath.row].title ?? ""
    }
    
    func getCellDescription(indexPath: IndexPath) -> String {
        return self.factsData[indexPath.row].description ?? ""
    }
    
    func getImageURL(indexPath: IndexPath) -> String {
        let imageURL = self.factsData[indexPath.row].imageHref
        return imageURL ?? ""
    }
}
