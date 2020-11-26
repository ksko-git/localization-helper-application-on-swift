//
//  ArgumentsParser.swift
//  
//
//  Created by Ксюся on 04.11.2020.
//

import Foundation
import ArgumentParser

public class ArgumentsParser: ArgumentsParserProtocol {

    public func parse(_ arguments: [String]?) -> Arguments {
        do {
            let command = try Commands.parseAsRoot(arguments)
            
            switch command {
            case let command as Commands.Search:
                return .search(key: command.key, language: command.language)
            case let command as Commands.Update:
                return .update(word: command.word, key: command.key, language: command.language)
            case let command as Commands.Delete:
                return .delete(key: command.key, language: command.language)                
            default:
                return .help(message: Commands.helpMessage())
            }
        }
        catch {
            return .help(message: Commands.helpMessage())
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
