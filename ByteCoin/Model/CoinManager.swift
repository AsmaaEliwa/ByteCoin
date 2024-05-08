//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR_API_KEY_HERE"

    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency:String, completion:@escaping(RateModel?)->Void){
        let url = "https://rest.coinapi.io/v1/exchangerate/BTC/\(currency)?apikey=64375862-DCD6-4B1E-9408-E48B0645943F"
        let decoder = JSONDecoder()
        getRequest(url: url) { data in
            
            if let jsonData = data {
                do {
                    let result = try decoder.decode(RateModel.self, from: jsonData)
//                    print(result)
                    completion( result)
                }catch{
                    print(error)
                    completion( nil)
                }
            }
        }
    }
    func getRequest(url:String,completion:@escaping(Data?)->Void){
        guard let requestURL = URL(string:url)else{return}
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        request.cachePolicy = .useProtocolCachePolicy
        
        let task = URLSession.shared.dataTask(with:request ){data,response,error in
            if data != nil {
                completion(data)
            }else{
                completion(nil)
            }
            
            
        }
        task.resume()
    }
}
