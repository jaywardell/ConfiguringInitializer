import XCTest
@testable import ConfiguringInitializer

final class ConfiguringInitializerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ConfiguringInitializer().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
