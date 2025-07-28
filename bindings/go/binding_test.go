package tree_sitter_tet_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_tet "github.com/readf0x/templating-engine/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_tet.Language())
	if language == nil {
		t.Errorf("Error loading Templating Engine Template grammar")
	}
}
