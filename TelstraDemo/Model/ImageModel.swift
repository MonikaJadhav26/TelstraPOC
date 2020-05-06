//
//  ImageModel.swift
//  UITablviewPOC
//
//  Created by Monika Jadhav on 17/04/20.
//  Copyright © 2020 rp00612313. All rights reserved.
//


import Foundation

struct ImageModel: Decodable {
    let title: String
    let rows: [Row]
}


