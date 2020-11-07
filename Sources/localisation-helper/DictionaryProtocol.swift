//
//  DictionaryProtocol.swift
//  
//
//  Created by Ксюся on 07.11.2020.
//

import Foundation

protocol DictionaryProtocol {
    func getDictionaryFromJson() -> ([String: [String: String]])
    func WritingToJsonFile(dictionary: [String: [String: String]])
}
