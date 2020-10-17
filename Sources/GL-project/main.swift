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
    
    if terminalArray.count == 3 || terminalArray.count == 5 {
        for element in 0...terminalArray.count - 2 {
            
            if terminalArray[element] == "-k" {
                var count = 0
                for el in languagesArray {
                    if terminalArray[element + 1] != el && terminalArray[element + 1] != "-l" {
                        count += 1
                    }
                }
                if count == languagesArray.count {
                    keyK = terminalArray[element]
                    word = terminalArray[element + 1]
                }
            }
            
            if terminalArray[element] == "-l" {
                for el in languagesArray {
                    if terminalArray[element + 1] == el && terminalArray[element + 1] != "-k"  {
                        keyL = terminalArray[element]
                        lang = terminalArray[element + 1]
                    }
                }
            }
        }
        
        if terminalArray.count == 5 && !keyK.isEmpty && !word.isEmpty && !keyL.isEmpty && !lang.isEmpty {
        }
        else if terminalArray.count == 3 && keyK.isEmpty && word.isEmpty && !keyL.isEmpty && !lang.isEmpty {
        }
        else if terminalArray.count == 3 && !keyK.isEmpty && !word.isEmpty && keyL.isEmpty && lang.isEmpty {
        } else {
            exit(1)
        }
        
    } else {
        exit(1)
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
    if !keyL.isEmpty && keyK.isEmpty && !lang.isEmpty && language.lowercased() == lang.lowercased() {
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
        
        // for default
        if keyL.isEmpty && keyK.isEmpty && language == "en" && dictionaryWord == dictionaryWord2  && !wordName2.isEmpty {
            
            print("  \(language2) : \(wordName2)")
            flag = true
        }
        
        // -k
        if !keyK.isEmpty && keyL.isEmpty && !word.isEmpty && word.lowercased() == wordName.lowercased() && dictionaryWord2 == dictionaryWord && !wordName2.isEmpty {
            print("  \(language2) : \(wordName2)")
            flag = true
        }
        // -k -l
        if !keyL.isEmpty && !keyK.isEmpty && !word.isEmpty && !lang.isEmpty && word.lowercased() == wordName.lowercased() && dictionaryWord2 == dictionaryWord && language2.lowercased() == lang.lowercased() && !wordName2.isEmpty {
            print("  \(language2) : \(wordName2)")
            flag = true
        }
        
    }
    
}

if flag != true {
    print("Not found")
}
