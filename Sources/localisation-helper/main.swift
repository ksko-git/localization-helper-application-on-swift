import Foundation
import ArgumentParser

class Container {
    var argumentsParser: ArgumentsParserProtocol {
        return ArgumentsParser()
    }
    var search: SearchProtocol {
        return Search()
    }
    var update: UpdateProtocol {
        return Update()
    }
    var delete: DeleteProtocol {
        return Delete()
    }
}

func main() {
    
    let container = Container()

    let arguments = container.argumentsParser.parse()
    
    
    if case .search(let key, let language) = arguments {
        if let key: String = key, let language: String = language {
            container.search.search(key: key, language: language)
        } else if let key: String = key {
            container.search.search(key: key, language: "")
        } else if let language: String = language {
            container.search.search(key: "", language: language)
        } else {
            container.search.defaultSearch()
        }
        
    } else if case .update(let word, let key, let language) = arguments {
        if let thisWord = word, let key: String = key, let language: String = language {
            container.update.update(newWord: thisWord, key: key, language: language)
        } else if let thisWord = word, let key: String = key {
            container.update.update(newWord: thisWord, key: key, language: "")
        } else if let thisWord = word, let language: String = language {
            container.update.update(newWord: thisWord, key: "", language: language)
        } else {
            print(Commands.helpMessage())
        }
    } else if case .delete(let key, let language) = arguments {        
        if let key: String = key, let language: String = language {
            container.delete.delete(key: key, language: language)
        } else if let key: String = key {
            container.delete.delete(key: key, language: "")
        } else if let language: String = language {
            container.delete.delete(key: "", language: language)
        } else {
            print(Commands.helpMessage())
        }
    }
    
}

main()


