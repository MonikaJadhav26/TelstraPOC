//
//  UIImageView+download.swift
//  UITablviewPOC
//
//  Created by Monika Jadhav on 20/04/20.
//  Copyright © 2020 rp00612313. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    /// This method download and cache images from URL
    /// - Parameters:
    ///   - link: url to download image
    func downloaded(from link: String) {
        let imageCache = NSCache<NSString, UIImage>()
        self.image = Constants.defaultImage
        let imageServerUrl = link.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        if let cachedImage = imageCache.object(forKey: NSString(string: imageServerUrl)) {
            self.image = cachedImage
            return
        }
        if let url = URL(string: imageServerUrl) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil {
                    DispatchQueue.main.async {
                        self.image = Constants.defaultImage
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: imageServerUrl))
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
}
