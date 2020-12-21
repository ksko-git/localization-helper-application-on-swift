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
        return localDictionary
    }

}
