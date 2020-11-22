//
//  SearchProtocol.swift
//  
//
//  Created by Ксюся on 07.11.2020.
//

import Foundation

protocol SearchProtocol {
    func search(key: String?, language: String?) -> ValidationResult
    func defaultSearch(dictionary: [String: [String: String]])
}
