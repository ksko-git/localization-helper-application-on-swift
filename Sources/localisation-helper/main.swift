import Foundation
import ArgumentParser

class Container {
    
    var parser = ArgumentsParser()
    var updating = Update(dictionary: Dictionary(), terminalOutput: TerminalOutput())
    var deleting = Delete(dictionary: Dictionary(), terminalOutput: TerminalOutput())
    var searching = Search(dictionary: Dictionary(), terminalOutput: TerminalOutput())
    
    var argumentsParser: ArgumentsParserProtocol {
        parser
    }
    var search: SearchProtocol {
        searching
    }
    var update: UpdateProtocol {
        updating
    }
    var delete: DeleteProtocol {
        deleting
    }
    var message: TerminalOutputProtocol {
        return TerminalOutput()
    }  
    
}

func main() {
    
    let container = Container()

    let arguments = container.argumentsParser.parse()
    
    if case .search(let key, let language) = arguments {
        container.search.search(key: key, language: language)
    } else if case .update(let word, let key, let language) = arguments {
        container.update.update(newWord: word, key: key, language: language)
    } else if case .delete(let key, let language) = arguments {
        container.delete.delete(key: key, language: language)
    } else if case .help(let message) = arguments {
        container.message.consoleOutput(word: message)
    }
    
}

main()


