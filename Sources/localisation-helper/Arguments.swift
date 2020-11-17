//
//  Arguments.swift
//  
//
//  Created by Ксюся on 07.11.2020.
//

import Foundation

public enum Arguments {
    case search(key: String?, language: String?)
    case update(word: String?, key: String?, language: String?)
    case delete(key: String?, language: String?)
    case help(message: String)
}
