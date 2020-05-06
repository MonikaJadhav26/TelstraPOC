//
//  FactsViewModel.swift
//  TelstraDemo
//
//  Created by Monika Jadhav on 06/05/20.
//  Copyright © 2020 rp00612313. All rights reserved.
//

import Foundation

class FactsViewModel : NSObject {
    
    var apiCallObject: APICall = APICall()
    var factsData : [Row] = [Row]()
    var titleForView = String()
    
    func fetchFactsData(completion: @escaping () -> ()) {
        apiCallObject.getImages(completion: {(imagesDictionary, isSucces) in
            self.factsData = imagesDictionary?.rows ?? []
            self.titleForView = imagesDictionary?.title ?? ""
            completion()
        })
    }
    
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
