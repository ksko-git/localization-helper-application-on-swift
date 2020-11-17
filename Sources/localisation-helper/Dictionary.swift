//
//  Dictionary.swift
//  
//
//  Created by Ксюся on 05.11.2020.
//

import Foundation

public class Dictionary: DictionaryProtocol {
    
    let path: String
    
    init() {
        self.path = Bundle.module.path(forResource: "dictionary", ofType: "json") ?? "dictionary.json"
    }
    
    public func getDictionary() -> [String: [String: String]] {
        var dictionary: [String: [String: String]] = [:]
        
        if let jsonDictionaryFile = FileManager.default.contents(atPath: path) {
            dictionary = (try? JSONDecoder().decode([String: [String: String]].self, from: jsonDictionaryFile)) ?? [:]
        }
        return dictionary
    }

    public func write(dictionary: [String: [String: String]]) {
        do {
            let json = try JSONEncoder().encode(dictionary.self)
            try json.write(to: URL(fileURLWithPath: path))
        } catch {
            print("Не удалось записать.")
        }        
    }

}
