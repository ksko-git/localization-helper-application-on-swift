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

// ====== ФУНКЦИИ ======
// -k
func keyKOutput (key: String) {
    print(key.lowercased())
    for (_, wordsArray) in dictionary {
        for (language, word) in wordsArray {
            if word.lowercased() == key.lowercased() {
                for (_, word2) in wordsArray {
                    print("    \(language): \(word2)")
                }
                flag = true
            }
        }
    }
    // Если слово при переборе не нашлось
    if flag != true {
        print("Not found")
    }
}
// -l
func keyLOutput (language: String) {
    for (enWord, wordsArray) in dictionary {
        // Если слово найдено
        if let word = wordsArray[language.lowercased()] {
            flag = true
            print("\(enWord) = \(word)")
        }
    }
    // Если слово при переборе не нашлось
    if flag != true {
        print("Not found")
    }
}
// -k -l
func keyKAndLOutput (key: String, language: String) {
    for (_, wordsArray) in dictionary {
        for (_, word) in wordsArray {
            if word.lowercased() == key.lowercased() {
                for (lang, word2) in wordsArray {
                    if lang == language.lowercased() {
                        print(word2)
                        flag = true
                    }
                }
            }
        }
    }
    // Если слово при переборе не нашлось
    if flag != true {
        print("Not found")
    }
}
// default
func defaultOutput() {
    for (enWord, wordsArray) in dictionary {
        print(enWord)
        for (language, word) in wordsArray {
            print("    \(language): \(word)")
        }
    }
}

struct Translate: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Localisation helper terminal aplication.")
    // -k --key
    @Option(name: .shortAndLong, help: "The word you want to translate.")
    var key: String?
    // -l --language
    @Option(name: .shortAndLong, help: "The language you want to translate the word into.")
    var language: String?

    func run() throws {
        // -k
        if key != nil && language == nil {
            keyKOutput (key: key!)
        // -l
        } else if key == nil && language != nil {
            keyLOutput (language: language!)
        // -k -l
        } else if key != nil && language != nil {
            keyKAndLOutput(key: key!, language: language!)
        // default
        } else if key == nil && language == nil {
            defaultOutput()
        }
    }
}

Translate.main()
