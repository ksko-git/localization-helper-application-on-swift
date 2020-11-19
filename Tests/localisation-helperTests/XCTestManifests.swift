import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(localisation_helperTests.allTests),
        testCase(TestArgumentParser.allTests),
        testCase(TestSearchOption.allTests),
        testCase(TestDeleteOption.allTests),
        testCase(TestUpdateOption.allTests)        
    ]
}
#endif
