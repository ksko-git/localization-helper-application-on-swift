import Foundation
import LHLibrary

let result = localisationHelper()

if case .success(let dict) = result {
    guard !dict.isEmpty else {
        exit(Int32(0))
    }
    print(dict)
    exit(Int32(0))
}
if case .failure(let error) = result {
    exit(Int32(error.errorCode))
}
