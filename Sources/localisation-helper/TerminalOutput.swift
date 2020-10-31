//
//  TerminalOutput.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

// Флаг для Not found
var flag = false
// Вывод в консоль
func ConsoleOutput (word: String) {
    return print(word)
}
// Шаблоны для вывода в консоль
func OutputTemplates (variant: Bool, firstArgument: String, secondArgument: String) {
    flag = true
    variant == true
        ? print("    \(firstArgument): \(secondArgument)")
        : print("\(firstArgument) = \(secondArgument)")
}
// Вывод Not Found
func OutputNotFound (flag: Bool) {
    guard flag == true else {
        return print("Not found")
    }
}
