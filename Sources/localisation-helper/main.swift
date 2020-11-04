import Foundation
import ArgumentParser

//struct Translate: ParsableCommand {
//    static let configuration = CommandConfiguration(
//        abstract: "Localisation helper application.",
//        subcommands: [Search.self, Update.self, Delete.self]
//    )
//}
//
//extension Translate {
//    
//    struct Arguments: ParsableArguments {
//        @Argument var word: String?
//    }
//    
//    struct Options: ParsableArguments {
//        // -k --key
//        @Option(name: .shortAndLong, help: "The word you want to translate.")
//        var key: String?
//        // -l --language
//        @Option(name: .shortAndLong, help: "The language you want to translate the word into.")
//        var language: String?
//    }
//    
//    struct Search: ParsableCommand {
//        
//        @OptionGroup var options: Translate.Options
//        
//        static var configuration = CommandConfiguration(
//            abstract: "Find a word in the dictionary."
//        )
//        
//        func run() throws {
//            // -k
//            if let key: String = options.key, options.language == nil {
//                try searchOptionsKL(key: key, language: "none")
//            // -l
//            } else if options.key == nil, let language: String = options.language {
//                try searchOptionsKL(key: "none", language: language)
//            // -k -l
//            } else if let key: String = options.key, let language: String = options.language {
//                try searchOptionsKL(key: key, language: language)
//            // default
//            } else if options.key == nil && options.language == nil {
//                defaultSearch()
//            }
//        }
//    }
//    
//    struct Update: ParsableCommand {
//        @Argument var word: String?
//        @OptionGroup var options: Translate.Options
//        
//        static var configuration = CommandConfiguration(
//            abstract: "Add word to dictionary."
//        )
//        
//        func run() throws {
//            // -k
//            if let thisWord = word, let key: String = options.key, options.language == nil {
//                dictionary = updateDictionaryKL(newWord: thisWord, key: key, language: "none")
//                try jsonEncodingWriting(dictionary: dictionary)
//            // -l
//            } else if let thisWord = word, options.key == nil, let language: String = options.language {
//                dictionary = updateDictionaryKL(newWord: thisWord, key: "none", language: language)
//                try jsonEncodingWriting(dictionary: dictionary)
//            // -k -l
//            } else if let thisWord = word, let key: String = options.key, let language: String = options.language {
//                dictionary = updateDictionaryKL(newWord: thisWord, key: key, language: language)
//                try jsonEncodingWriting(dictionary: dictionary)
//            } else if options.key == nil && options.language == nil {
//                print("Type --help to know how to use update subcommand.")
//            }
//        }
//    }
//    
//    struct Delete: ParsableCommand {
//        @OptionGroup var options: Translate.Options
//        
//        static var configuration = CommandConfiguration(
//            abstract: "Remove word from dictionary."
//        )
//        
//        func run() throws {
//            // -k
//            if let key: String = options.key, options.language == nil {
//                dictionary = removeFromDictionaryKL(key: key, language: "none")
//                try jsonEncodingWriting(dictionary: dictionary)
//            // -l
//            } else if options.key == nil, let language: String = options.language {
//                dictionary = removeFromDictionaryKL(key: "none", language: language)
//                try jsonEncodingWriting(dictionary: dictionary)
//            // -k -l
//            }else if let key: String = options.key, let language: String = options.language {
//                dictionary = removeFromDictionaryKL(key: key, language: language)
//                try jsonEncodingWriting(dictionary: dictionary)
//            } else if options.key == nil && options.language == nil {
//                print("Type --help to know how to use delete subcommand.")
//            }
//        }
//    }
//}
//
//Translate.main()

class Container {
    var argumentsParser: ArgumentsParserProtocol {
        return ArgumentsParser()
    }
}

class Dictionary {
//    var isInDictionary: Bool
    let path = Bundle.module.path(forResource: "dictionary", ofType: "json") ?? "dictionary.json"
    
    func jsonInDictionary() -> [String: [String: String]] {
        let decoder = JSONDecoder()
        var dictionary: [String: [String: String]] = [:]
        
        if let jsonDictionaryFile = FileManager.default.contents(atPath: path) {
            dictionary = (try? decoder.decode([String: [String: String]].self, from: jsonDictionaryFile)) ?? [:]
        }
        return dictionary
    }

    func jsonEncodingWriting(dictionary: [String: [String: String]]) throws {
        JSONEncoder().outputFormatting = .prettyPrinted
        let json = try JSONEncoder().encode(dictionary.self)
        try json.write(to: URL(fileURLWithPath: path))
    }
}

func main() {
    
    let container = Container()
    let parser = container.argumentsParser
    let arguments = parser.parse()
    
    print(arguments)
    
//    let dict = Dictionary()
//    var dictionary = dict.jsonInDictionary()
    
}

main()


