//
//  ArgumentsParserProtocol.swift
//  
//
//  Created by Ксюся on 04.11.2020.
//

import Foundation

public protocol ArgumentsParserProtocol {
    func parse(_ arguments: [String]?) -> Arguments
}

