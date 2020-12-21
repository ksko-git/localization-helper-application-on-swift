//
//  Dictionary.swift
//  
//
//  Created by Ксюся on 05.11.2020.
//

import Foundation

class Dictionary: DictionaryProtocol {
    
    let path: String
    let localDictionary: [String: [String: String]]
    
    init() {
        self.path = ""
        self.localDictionary = [
            "hello": ["en": "Hello", "ru": "Привет", "jp": "こんにちは"],
            "day": ["en": "Day", "ru": "День", "pt": "Dia"],
            "terms": ["en": "Terms", "pt": "Termos", "jp": "条項"],
            "cat": ["en": "Cat", "ru": "Кошка", "jp": "ネコ"]]
    }
    
    public func getDictionary() -> [String: [String: String]] {
        var dictionary: [String: [String: String]] = [:]
        if let jsonDictionaryFile = FileManager.default.contents(atPath: path) {
            dictionary = (try? JSONDecoder().decode([String: [String: String]].self, from: jsonDictionaryFile)) ?? [:]
        } else {
            dictionary = localDictionary
        }
        return dictionary
    }

    public func write(dictionary: [String: [String: String]]) {
        do {
            let json = try JSONEncoder().encode(dictionary.self)
            try json.write(to: URL(fileURLWithPath: path))
        } catch {
            print("Failed to write!")
        }        
    }

}
