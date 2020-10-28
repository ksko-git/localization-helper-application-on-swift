import Foundation
import ArgumentParser

// Путь к словарю
let path = "dictionary.json"
let decoder = JSONDecoder()
var dictionary: [String: [String: String]] = [:]

// Считывание словаря из файла
if let jsonDictionaryFile = FileManager.default.contents(atPath: path) {
    dictionary = (try? decoder.decode([String: [String: String]].self, from: jsonDictionaryFile)) ?? [:]
} else {
    dictionary = [:]
}
// Флаг для Not found
var flag = false

// Вывод в консоль
func ConsoleOutput(word: String) {
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
// Поиск по ключам --key --language
func SearchOptionsKL (key: String, language: String) {
    if language == "none" {
        ConsoleOutput(word: key.lowercased())
    }
    for (englishWord, wordsArray) in dictionary {
        // -l
        if key == "none", let word = wordsArray[language.lowercased()] {
            OutputTemplates(variant: false, firstArgument: englishWord, secondArgument: word)
        }
        for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
            if dictionaryTranslation.lowercased() == key.lowercased() {
                for (thisLanguage, thisTranslation) in wordsArray {
                    // -k
                    if language == "none" {
                        OutputTemplates(variant: true, firstArgument: dictionaryLanguage, secondArgument: thisTranslation)
                    // -k -l
                    } else if thisLanguage == language.lowercased() {
                        ConsoleOutput(word: thisTranslation)
                        flag = true
                    }
                }
            }
        }
    }
    OutputNotFound(flag: flag)
}

func defaultSearch() {
    for (englishWord, wordsArray) in dictionary {
        ConsoleOutput(word: englishWord)
        for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
            OutputTemplates(variant: true, firstArgument: dictionaryLanguage, secondArgument: dictionaryTranslation)
        }
    }
    OutputNotFound(flag: flag)
}

struct Translate: ParsableCommand {
    
    static let configuration = CommandConfiguration(abstract: "Localisation helper application.",
                                                    subcommands: [Search.self])
}

extension Translate {
    
    struct Search: ParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Find a word in the dictionary.")
        // -k --key
        @Option(name: .shortAndLong, help: "The word you want to translate.")
        var key: String?
        // -l --language
        @Option(name: .shortAndLong, help: "The language you want to translate the word into.")
        var language: String?

        func run() throws {
            // -k
            if let key: String = key, language == nil {
                SearchOptionsKL(key: key, language: "none")
            // -l
            } else if key == nil, let language: String = language {
                SearchOptionsKL(key: "none", language: language)
            // -k -l
            } else if let key: String = key, let language: String = language {
                SearchOptionsKL(key: key, language: language)
            // default
            } else if key == nil && language == nil {
                defaultSearch()
            }
        }
    }
    
}

Translate.main()
