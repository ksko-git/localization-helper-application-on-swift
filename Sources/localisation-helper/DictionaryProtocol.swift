//
//  DictionaryProtocol.swift
//  
//
//  Created by Ксюся on 07.11.2020.
//

import Foundation

public protocol DictionaryProtocol {
    func getDictionary() -> [String: [String: String]]
    func write(dictionary: [String: [String: String]]) throws
}
