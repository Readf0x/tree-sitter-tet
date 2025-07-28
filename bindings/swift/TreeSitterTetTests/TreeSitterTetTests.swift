import XCTest
import SwiftTreeSitter
import TreeSitterTet

final class TreeSitterTetTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_tet())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Templating Engine Template grammar")
    }
}
