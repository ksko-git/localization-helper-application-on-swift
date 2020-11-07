import Foundation
import ArgumentParser

class Container {
    var argumentsParser: ArgumentsParserProtocol {
        return ArgumentsParser()
    }
}

func main() {
    
    let container = Container()

    let arguments = container.argumentsParser.parse()
    
    if case .search(let key, let language) = arguments {
        let search = Search()
        
        if let key: String = key, let language: String = language {
            search.search(key: key, language: language)
        } else if let key: String = key {
            search.search(key: key, language: "")
        } else if let language: String = language {
            search.search(key: "", language: language)
        } else {
            search.defaultSearch()
        }
        
    } else if case .update(let word, let key, let language) = arguments {
        let update = Update()
        
        if let thisWord = word, let key: String = key, let language: String = language {
            update.update(newWord: thisWord, key: key, language: language)
        } else if let thisWord = word, let key: String = key {
            update.update(newWord: thisWord, key: key, language: "")
        } else if let thisWord = word, let language: String = language {
            update.update(newWord: thisWord, key: "", language: language)
        } else {
            print(Commands.helpMessage())
        }
    } else if case .delete(let key, let language) = arguments {
        let delete = Delete()
        
        if let key: String = key, let language: String = language {
            delete.delete(key: key, language: language)
        } else if let key: String = key {
            delete.delete(key: key, language: "")
        } else if let language: String = language {
            delete.delete(key: "", language: language)
        } else {
            print(Commands.helpMessage())
        }
    }
    
}

main()


