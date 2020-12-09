//
//  CreateDictionary.swift
//  
//
//  Created by Ксюся on 02.12.2020.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateDictionary: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("dictionary")
            .id()
            .field("englishword", .string)
            .field("language", .string)
            .field("translation", .string)
            .create()
    }

    // удаление таблицы в случае необходимости
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("dictionary").delete()
    }
}
