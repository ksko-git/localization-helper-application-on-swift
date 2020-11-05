import Foundation
import ArgumentParser

class Container {
    var argumentsParser: ArgumentsParserProtocol {
        return ArgumentsParser()
    }
}

func main() {
    
    let container = Container()
    let parser = container.argumentsParser
    parser.parse()
    
}

main()


