/**
 * @file TET grammar for tree-sitter
 * @author readf0x
 * @license GPL-v3.0
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

module.exports = grammar({
  name: "tet",

  rules: {
    source_file: $ => seq(
      optional(seq($.import_directive, /\n/)),
      $.content
    ),

    content: $ => seq(
      choice(
        /[^!]/,
        /![^!]/,
        /!![^i]/,
        /!!i[^m]/,
        /!!im[^p]/,
        /!!imp[^o]/,
        /!!impo[^r]/,
        /!!impor[^t]/,
        /!!import[^:]/,
      ),
      repeat1(choice(
        $.code,
        $.text
      ))
    ),

    import_directive: $ => seq(
      "!!import:",
      $.quoted_module,
      repeat(seq(" ", $.quoted_module))
    ),

    quoted_module: $ => seq(
      '"',
      /[^"]+/,
      '"'
    ),

    // anything that doesn't start a code block
    text: $ => token(/([^<]|<[^|])+/),

    code: $ => seq(
      $.code_open,
      optional($.code_function),
      $.raw_text,
      $.code_close
    ),

    code_open: $ => token("<|"),
    code_close: $ => token("|>"),

    code_function: $ => seq(":", /\w/),

    raw_text: $ => seq(
      /[^:]/,
      token(/([^|]|\|[^>])*/)
    )
  }
});
