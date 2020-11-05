//
//  Dictionary.swift
//  
//
//  Created by Ксюся on 05.11.2020.
//

import Foundation

class Dictionary {
    
    var isInDictionary: Bool // флаг для Not Found
    
    let path = Bundle.module.path(forResource: "dictionary", ofType: "json") ?? "dictionary.json"
    
    func jsonInDictionary() -> [String: [String: String]] {
        let decoder = JSONDecoder()
        var dictionary: [String: [String: String]] = [:]
        
        if let jsonDictionaryFile = FileManager.default.contents(atPath: path) {
            dictionary = (try? decoder.decode([String: [String: String]].self, from: jsonDictionaryFile)) ?? [:]
        }
        return dictionary
    }

    func jsonEncodingWriting(dictionary: [String: [String: String]]) throws {
        JSONEncoder().outputFormatting = .prettyPrinted
        let json = try JSONEncoder().encode(dictionary.self)
        try json.write(to: URL(fileURLWithPath: path))
    }
    
    init() {
        self.isInDictionary = false
    }
    
}
