//
//  StringExtension.swift
//  RaM
//
//  Created by Jakub Legut on 24/04/2021.
//

import Foundation

extension String{
    
    func toFormatedDate() -> String{
        let formatIn = DateFormatter()
        let formatOut = DateFormatter()
        
        formatIn.timeZone = .current
        formatIn.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        
        formatOut.timeZone = .current
        formatOut.dateFormat = "dd.MM.YYYY hh:mm"
        
        if let createdDate = formatIn.date(from: self){
            let dataString = formatOut.string(from: createdDate)
            return dataString
        }
        return self
    }
    
    
}
