/**
 * @file Tet grammar for tree-sitter
 * @author readf0x
 * @license GPL-v3.0
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

module.exports = grammar({
  name: "tet",

  rules: {
    // TODO: add the actual grammar rules
    source_file: $ => "hello"
  }
});
