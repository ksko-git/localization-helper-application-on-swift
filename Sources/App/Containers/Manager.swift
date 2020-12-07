//
//  Manager.swift
//  
//
//  Created by Ксюся on 07.12.2020.
//

import Foundation
import Vapor

class Manager {
    
    var dict: DictionaryProtocol
    
    init() {
        self.dict = Dictionary()
    }
    
    var search: SearchProtocol {
        Search(dictionary: dict)
    }
    var update: UpdateProtocol {
        Update(dictionary: dict)
    }
    var delete: DeleteProtocol {
        Delete(dictionary: dict)
    }
}
