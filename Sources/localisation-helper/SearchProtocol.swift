//
//  SearchProtocol.swift
//  
//
//  Created by Ксюся on 07.11.2020.
//

import Foundation

public protocol SearchProtocol {
    func search(key: String?, language: String?)
    func defaultSearch()
}
