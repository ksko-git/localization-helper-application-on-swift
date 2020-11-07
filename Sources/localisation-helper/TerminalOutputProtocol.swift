//
//  TerminalOutputProtocol.swift
//  
//
//  Created by Ксюся on 07.11.2020.
//

import Foundation

protocol TerminalOutputProtocol {
    func consoleOutput(word: String)
    func outputTemplates(variant: Bool, firstArgument: String, secondArgument: String)
    func outputNotFound(isInDictionary: Bool)
}
