import Foundation

let TerminalAguments = CommandLine.arguments // Аргументы командной строки
var flag = false // Флаг для Not found

// Словарь
let words = ["hello": ["en": "Hello", "ru": "Привет"],
             "day":   ["en": "Day", "ru": "День", "pt": "Dia"],
             "terms": ["en": "Terms", "pt": "Termos"]]

// -k -l
if let keyKPosition = TerminalAguments.firstIndex(of: "-k"), let keyLPosition = TerminalAguments.firstIndex(of: "-l") {
    // Если нет значений после ключей
    if keyKPosition + 1 == TerminalAguments.endIndex || keyLPosition + 1 == TerminalAguments.endIndex {
        print("Not found")
    } else if CommandLine.arguments.count == 5 {
        for (_, wordsArray) in words {
            for (_, word) in wordsArray {
                if word.lowercased() == TerminalAguments[keyKPosition + 1].lowercased() {
                    for (language, word2) in wordsArray {
                        if language == TerminalAguments[keyLPosition + 1].lowercased() {
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
// -k
} else if let keyKPosition = TerminalAguments.firstIndex(of: "-k") {
    // Если нет значений после ключа
    if keyKPosition + 1 == TerminalAguments.endIndex {
        print("Not found")
    // Если нет лишних элементов в терминале
    } else if CommandLine.arguments.count == 3 {
        print(TerminalAguments[keyKPosition + 1].lowercased())
        for (_, wordsArray) in words {
            for (language, word) in wordsArray {
                if word.lowercased() == TerminalAguments[keyKPosition + 1].lowercased() {
                    for (_, word2) in wordsArray {
                        print("    \(language): \(word2)")
                    }
                    flag = true
                }
            }
        }
    }
    // Если слово при переборе не нашлось
    if flag != true {
        print("Not found")
    }
// -l
} else if let keyLPosition = TerminalAguments.firstIndex(of: "-l") {
    // Если нет значений после ключа
    if keyLPosition + 1 == TerminalAguments.endIndex {
        print("Not found")
    } else if CommandLine.arguments.count == 3 {
        for (enWord, word) in words {
            // Если слово найдено
            if let element = word[TerminalAguments[keyLPosition + 1].lowercased()] {
                flag = true
                print("\(enWord) = \(element)")
            }
        }
        // Если слово при переборе не нашлось
        if flag != true {
            print("Not found")
        }
    }
// Default
} else if TerminalAguments.count == 1 {
    for (enWord, wordsArray) in words {
        print(enWord)
        for (language, word) in wordsArray {
            print("   \(language): \(word)")
        }
    }
}

