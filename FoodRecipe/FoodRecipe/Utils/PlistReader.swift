//
//  PlistReader.swift
//  FoodRecipe
//
//  Created by Abdullah Hafiz on 15/06/2025.
//

import Foundation

enum PlistReader {
    static func value(forKey key: String) -> String? {
        guard let filePath = Bundle.main.url(forResource: "Info", withExtension: "plist")
        else {
            print("❌ Courld Not find Info.plist")
            return nil
        }
        
        let plist = NSDictionary(contentsOf: filePath)
        
        guard let value = plist?[key] as? String else {
            print("❌ Could Not find value for \(key)")
            return nil
        }
        
        return value
    }
}
