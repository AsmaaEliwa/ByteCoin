//
//  RateModel.swift
//  ByteCoin
//
//  Created by asmaa gamal  on 08/05/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation
struct RateModel:Codable{
   let asset_id_base: String
   let  asset_id_quote: String
   let  rate: Double
}
