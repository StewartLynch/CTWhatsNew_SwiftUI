import XCTest
@testable import CTWhatsNew

final class CTWhatsNewTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CTWhatsNew().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
