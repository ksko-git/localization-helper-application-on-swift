//
//  UpdateProtocol.swift
//  
//
//  Created by Ксюся on 07.11.2020.
//

import Foundation

protocol UpdateProtocol {
    func update(newWord: String, key: String, language: String) -> [String: [String: String]]
}
