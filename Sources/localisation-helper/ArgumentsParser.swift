//
//  ArgumentsParser.swift
//  
//
//  Created by Ксюся on 04.11.2020.
//

import Foundation
import ArgumentParser

class ArgumentsParser: ArgumentsParserProtocol {
    func parse() -> Arguments {
        do {
            let command = try Commands.parseAsRoot()
            
            switch command {
            case let command as Commands.Search:
                if let key: String = command.key, command.language == nil {
                    search(key: key, language: "") // -k
                } else if command.key == nil, let language: String = command.language {
                    search(key: "", language: language) // -l
                } else if let key: String = command.key, let language: String = command.language {
                    search(key: key, language: language) // -k -l
                } else {
                    defaultSearch() // default
                }
                return .search(key: command.key, language: command.language)
            case let command as Commands.Update:
                return .update(word: command.word, key: command.key, language: command.language)
            case let command as Commands.Delete:
                return .delete(key: command.key, language: command.language)
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
        var word: String
        
        @Option(name: .shortAndLong)
        var key: String
        
        @Option(name: .shortAndLong)
        var language: String
    }
    
    struct Delete: ParsableCommand {
        @Option(name: .shortAndLong)
        var key: String?
        
        @Option(name: .shortAndLong)
        var language: String?
    }
    
}
