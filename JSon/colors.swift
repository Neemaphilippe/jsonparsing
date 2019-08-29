//
//  colors.swift
//  JSon
//
//  Created by Pursuit on 8/28/19.
//  Copyright © 2019 Nphilippe. All rights reserved.
//

import Foundation

struct ColorData : Codable {
    let colors : [ColorInfo]
    
    static func getColor(data: Data) throws -> [ColorInfo] {
        do {
            let colorData = try JSONDecoder().decode(ColorData.self, from: data)
            return colorData.colors
        }catch{
            throw error
        }
    }
}

struct ColorInfo : Codable {
    let hex: HexData
    let rgb: RgbData
    let name: NameInfo
}


struct HexData : Codable {
    let value : String
    let clean : String
}

struct RgbData : Codable {
    let fraction : FractionData
}
struct FractionData : Codable {
    let r: Float
    let g: Float
    let b: Float
}
struct NameInfo : Codable {
    let value : String
}
