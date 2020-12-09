//
//  DictionaryTable.swift
//  
//
//  Created by Ксюся on 03.12.2020.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver

final class DictionaryTable: Model, Content {
    
    static let schema = "dictionary"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "englishword")
    var englishword: String

    @Field(key: "language")
    var language: String
    
    @Field(key: "translation")
    var translation: String

    init() { }

    init(id: UUID? = nil, englishword: String, language: String, translation: String) {
        self.id = id
        self.englishword = englishword
        self.language = language
        self.translation = translation
    }
    
}

//extension Dictionary: JSONRepresentable {
//    
//    
//    
//    func makeJSON() throws -> JSON {
//        var json = JSON()
//        try json.set($language, $translation)
//        return json
//    }
//}


