//
//  randomusers.swift
//  JSon
//
//  Created by Pursuit on 8/28/19.
//  Copyright © 2019 Nphilippe. All rights reserved.
//

import Foundation

struct RandomUserData : Codable {
    let results : [PeopleInfo]
    static func getRandomUsers(data: Data) throws -> [PeopleInfo] {
        do {
            let randomUserData = try JSONDecoder().decode(RandomUserData.self, from: data)
            return randomUserData.results
            
        }
        catch {
           throw error
        }
    }
    
    
    
}

struct PeopleInfo : Codable {
    let name : NameData
    let location: LocationData
    let email : String
}

struct NameData: Codable {
    let title : String
    let first : String
    let last : String
}

struct LocationData: Codable {
    let street : String
    let city : String
    let state: String
}


