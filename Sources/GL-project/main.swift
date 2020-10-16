import Foundation

let languagesArray = ["ru", "en", "pt"]

// Словарь
var words: [String: String] = ["enHello": "Hello", "enDay": "Day", "enTerms": "Terms", "ruHello": "Привет", "ruDay": "День", "ruTerms": "", "ptHello": "", "ptDay": "Dia", "ptTerms": "Termos"]

var keyK = "" // ключ k
var keyL = "" // ключ l
var lang = "" // язык
var word = "" // слово

var flag = false // флаг для Not found

if CommandLine.arguments.count > 2 {
    var terminalArray = [String]() // массив элементов командной строки
    for element in CommandLine.arguments {
        terminalArray.append(element)
    }

    for element in terminalArray {
        
        for el in languagesArray {
            if element == el {
                lang = element
            }
        }
        if element == "-k" {
            keyK = element
        } else if element == "-l" {
            keyL = element
        } else {
            var count = 0
            for el in languagesArray {
                if element != el {
                    count += 1
                }
            }
            if count == languagesArray.count {
                word = element
            }
        }
    }
}

for (wordCode, wordName) in words {
    let language =
        String(wordCode[wordCode.startIndex]) +
        String(wordCode[wordCode.index(after: wordCode.startIndex)])

    let startOfTheWord = wordCode.index(wordCode.startIndex, offsetBy: 2)
    let dictionaryWord = wordCode[startOfTheWord..<wordCode.endIndex]
    
    // for default
    if keyL.isEmpty && keyK.isEmpty && language == "en" {
        print(wordName.lowercased())
    }
    
    // -l
    if !keyL.isEmpty && keyK.isEmpty && language.lowercased() == lang.lowercased() {
        if !wordName.isEmpty {
            print("\(dictionaryWord.lowercased()) = \(wordName)")
            flag = true
        }
    }
    
    for (wordCode2, wordName2) in words {
        let language2 =
            String(wordCode2[wordCode2.startIndex]) +
            String(wordCode2[wordCode2.index(after: wordCode2.startIndex)])

        let startOfTheWord2 = wordCode2.index(wordCode2.startIndex, offsetBy: 2)
        let dictionaryWord2 = wordCode2[startOfTheWord2..<wordCode2.endIndex]
        
        // -k
        if !keyK.isEmpty && keyL.isEmpty && word.lowercased() == wordName.lowercased() && dictionaryWord2 == dictionaryWord && !wordName2.isEmpty {
            print("  \(language2) : \(wordName2)")
            flag = true
        }
        // -k -l
        if !keyL.isEmpty && !keyK.isEmpty && word.lowercased() == wordName.lowercased() && dictionaryWord2 == dictionaryWord && language2.lowercased() == lang.lowercased() && !wordName2.isEmpty {
            print("  \(language2) : \(wordName2)")
            flag = true
        }
        // for default
        
        if keyL.isEmpty && keyK.isEmpty && language == "en" && dictionaryWord == dictionaryWord2  && !wordName2.isEmpty {
            
            
            print("  \(language2) : \(wordName2)")
            flag = true
        }
    }
    
}

if flag != true {
    print("Not found")
}



//for (wordCode, wordName) in words {
//    let language =
//        String(wordCode[wordCode.startIndex]) + String(wordCode[wordCode.index(after: wordCode.startIndex)])
//
//    let startOfTheEnWord = wordCode.index(wordCode.startIndex, offsetBy: 2)
//    let neededWord = wordCode[startOfTheEnWord..<wordCode.endIndex]
//
//    if language == "en" {
//        print(wordName.lowercased())
//        for (secondWordCode, secondWordName) in words {
//            let secondLanguage = String(secondWordCode[secondWordCode.startIndex]) + String(secondWordCode[secondWordCode.index(after: secondWordCode.startIndex)])
//
//            let startOfTheWord = secondWordCode.index(secondWordCode.startIndex, offsetBy: 2)
//            let secondNeededWord = secondWordCode[startOfTheWord..<secondWordCode.endIndex]
//
//            if secondNeededWord == neededWord && !secondWordName.isEmpty {
//                print("  \(secondLanguage) : \(secondWordName)")
//            }
//        }
//
//    }
//}


