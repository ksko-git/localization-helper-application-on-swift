//
//  TerminalOutput.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

// Флаг для Not found
var isInDictionary = false
// Вывод в консоль
func consoleOutput(word: String) {
    return print(word)
}
// Шаблоны для вывода в консоль
func outputTemplates(variant: Bool, firstArgument: String, secondArgument: String) {
    isInDictionary = true
    variant == true
        ? print("    \(firstArgument): \(secondArgument)")
        : print("\(firstArgument) = \(secondArgument)")
}
// Вывод Not Found
func outputNotFound(isInDictionary: Bool) {
    guard isInDictionary == true else {
        return print("Not found")
    }
}
