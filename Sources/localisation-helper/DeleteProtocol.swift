//
//  DeleteProtocol.swift
//  
//
//  Created by Ксюся on 07.11.2020.
//

import Foundation

public protocol DeleteProtocol {
    func delete(key: String?, language: String?) -> ValidationResult
}
