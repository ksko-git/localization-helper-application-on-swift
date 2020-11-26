import Foundation
import localisation_helper

do {
    try localisationHelper()
    exit(Int32(0))
} catch let error as ValidationResult {
    print(error.errorDescription)
    exit(Int32(error.errorCode))
}
