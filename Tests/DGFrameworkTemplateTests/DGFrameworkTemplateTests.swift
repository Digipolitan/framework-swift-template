import XCTest
@testable import DGFrameworkTemplate

class DGFrameworkTemplateTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDescription() {
        let template = TemplateClass()
        XCTAssertEqual(template.description, "TemplateDescription")
    }
}
