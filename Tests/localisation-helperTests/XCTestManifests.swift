import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(TestArgumentParser.allTests),
        testCase(TestDeleteOption.allTests),
        testCase(TestSearchOption.allTests),
        testCase(TestUpdateOption.allTests),
        testCase(TestDictionary.allTests),
    ]
}
#endif
