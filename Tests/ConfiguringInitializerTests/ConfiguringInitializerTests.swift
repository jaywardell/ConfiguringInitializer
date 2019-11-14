import XCTest
@testable import ConfiguringInitializer

final class Dummy {
        
    var someValue : String?
}
extension Dummy : ConfiguringInitializer {}

// MARK:-

final class ConfiguringInitializerTests: XCTestCase {


    func testDummyClass() {
        
        let testValue = "Hello"
        let dummyToo = Dummy {
            $0.someValue = testValue
        }

        XCTAssertEqual(dummyToo.someValue, testValue)
        
        let dummythree = Dummy().configure {
            $0.someValue = testValue
        }

        XCTAssertEqual(dummythree.someValue, testValue)
    }
    
    
    #if (os(macOS) || os(iOS) || os(watchOS) || os(tvOS))

    func testDateFormatterCreation() {
        
        let oldway = DateFormatter()
        oldway.dateStyle = .short
        oldway.timeStyle = .long
        
        let newway = DateFormatter() {
            $0.dateStyle = .short
            $0.timeStyle = .long
        }
        
        XCTAssertEqual(oldway.string(from: Date()), newway.string(from: Date()))
    }
    
    func testDateFormatterCreation2() {
        
        let oldway = DateFormatter()
        oldway.dateStyle = .short
        oldway.timeStyle = .long
        
        let newway : DateFormatter = DateFormatter().configure {
            $0.dateStyle = .short
            $0.timeStyle = .long
        }
        
        XCTAssertEqual(oldway.string(from: Date()), newway.string(from: Date()))
    }

    #endif

}
