//
//  EpisodesVCPicker.swift
//  RaM
//
//  Created by Jakub Legut on 24/04/2021.
//

import Foundation
import UIKit

extension EpisodesViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        seasonPickerData.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return seasonPickerData[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row != 0{
            filtredEpisodes = filtrEpisode(value: seasonPickerData[row])
            reloadTableData(data: filtredEpisodes)
        }else{
            reloadTableData(data: episodes)
        }

        
    }
    
}
