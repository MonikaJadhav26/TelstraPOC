//
//  Constants.swift
//  UITablviewPOC
//
//  Created by Monika Jadhav on 20/04/20.
//  Copyright © 2020 rp00612313. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Constants
struct Constants {
    struct ImagesURL {
        static let url = "https:dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        
    }
   static let kCellIdentifier = "FactsTableViewCell"
   static let kTopBottomRightLeftPaddingConstant  =  10
   static let imageViewHeightWidthConstant = 60
   static let labelHeightConstant = 20
   static let boldFontConstant = 15
   static let regularFontConstant = 12
   static let defaultImage = UIImage(named: "default")
   static let backgroundViewColor = UIColor(named: "backViewColour")
   static let cellLabelTextColor = UIColor(named: "textColour")
   static let errorTitle = "Error"
   static let ok = "OK"
   static let imageTableViewIndentifier = "ImagesTableView"

}
