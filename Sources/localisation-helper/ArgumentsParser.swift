//
//  ArgumentsParser.swift
//  
//
//  Created by Ксюся on 04.11.2020.
//

import Foundation
import ArgumentParser

class ArgumentsParser: ArgumentsParserProtocol {
    func parse() {
        do {
            let command = try Commands.parseAsRoot()
            
            switch command {
            
            case let command as Commands.Search:
                let search = Search()
                
                if let key: String = command.key, command.language == nil {
                    search.search(key: key, language: "") // -k
                } else if command.key == nil, let language: String = command.language {
                    search.search(key: "", language: language) // -l
                } else if let key: String = command.key, let language: String = command.language {
                    search.search(key: key, language: language) // -k -l
                } else {
                    search.defaultSearch() // default
                }
                
            case let command as Commands.Update:
                let update = Update()
                let dict = Dictionary()
                var dictionary = dict.jsonInDictionary()                
                
                if let thisWord = command.word, let key: String = command.key, command.language == nil { // -k
                    dictionary = update.update(newWord: thisWord, key: key, language: "")
                    try dict.jsonEncodingWriting(dictionary: dictionary)
                } else if let thisWord = command.word, command.key == nil, let language: String = command.language { // -l
                    dictionary = update.update(newWord: thisWord, key: "", language: language)
                    try dict.jsonEncodingWriting(dictionary: dictionary)
                } else if let thisWord = command.word, let key: String = command.key, let language: String = command.language { // -k -l
                    dictionary = update.update(newWord: thisWord, key: key, language: language)
                    try dict.jsonEncodingWriting(dictionary: dictionary)
                } else {
                    print(Commands.helpMessage())
                }
                
            case let command as Commands.Delete:
                let delete = Delete()
                let dict = Dictionary()
                var dictionary = dict.jsonInDictionary()
                
                if let key: String = command.key, command.language == nil { // -k
                    dictionary = delete.delete(key: key, language: "")
                    try dict.jsonEncodingWriting(dictionary: dictionary)
                } else if command.key == nil, let language: String = command.language { // -l
                    dictionary = delete.delete(key: "", language: language)
                    try dict.jsonEncodingWriting(dictionary: dictionary)
                } else if let key: String = command.key, let language: String = command.language { // -k -l
                    dictionary = delete.delete(key: key, language: language)
                    try dict.jsonEncodingWriting(dictionary: dictionary)
                } else {
                    print(Commands.helpMessage())
                }
                
            default:
                print(Commands.helpMessage())
                Commands.exit()
            }
        }
        catch {
            print(Commands.helpMessage())
            Commands.exit()
        }
    }
}

struct Commands: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Localisation helper application.",
        subcommands: [Search.self, Update.self, Delete.self]
    )
}

extension Commands {
    
    struct Search: ParsableCommand {
        @Option(name: .shortAndLong)
        var key: String?
        
        @Option(name: .shortAndLong)
        var language: String?
    }
    
    struct Update: ParsableCommand {
        @Argument
        var word: String?
        
        @Option(name: .shortAndLong)
        var key: String?
        
        @Option(name: .shortAndLong)
        var language: String?
    }
    
    struct Delete: ParsableCommand {
        @Option(name: .shortAndLong)
        var key: String?
        
        @Option(name: .shortAndLong)
        var language: String?
    }
    
}
