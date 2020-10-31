//
//  Update.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

func jsonEncodingWriting (dictionary: [String: [String: String]]) throws {
    JSONEncoder().outputFormatting = .prettyPrinted
    let json = try JSONEncoder().encode(dictionary.self)
    try json.write(to: URL(fileURLWithPath: path))
}

func updateDictionaryKL (newWord: String, key: String, language: String) -> [String: [String: String]] {
    var isInDictionary = false
    var dict: [String: String] = [:]
    // -k -l
    for (englishWord, wordsArray) in dictionary {
        for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
            // Если слово есть в словаре
            if language.lowercased() == dictionaryLanguage.lowercased()
                && key.lowercased() == dictionaryTranslation.lowercased() {
                // Обновим его
                dictionary[englishWord]![dictionaryLanguage] = newWord
                dictionary.updateValue(wordsArray, forKey: dictionaryLanguage)
                isInDictionary = true
            }
        }
        // Если слова нет в словаре
        if isInDictionary != true {
            dict[language] = key
            dictionary[newWord]?[language] = key
            dictionary.updateValue(dict, forKey: newWord)
        }
    }
    print(dictionary)
    return dictionary
}
