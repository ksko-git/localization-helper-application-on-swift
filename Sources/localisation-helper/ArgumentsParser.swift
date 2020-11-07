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
                return .search(key: command.key, language: command.language)
            case let command as Commands.Update:
                return .update(word: command.word, key: command.key, language: command.language)
            case let command as Commands.Delete:
                return .delete(key: command.key, language: command.language)                
            default:
                return .exit
            }
        }
        catch {
            return .exit
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
