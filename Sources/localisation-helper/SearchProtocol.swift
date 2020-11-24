//
//  SearchProtocol.swift
//  
//
//  Created by Ксюся on 07.11.2020.
//

import Foundation

protocol SearchProtocol {
    func search(key: String?, language: String?) throws
    func defaultSearch(dictionary: [String: [String: String]]) throws
}
