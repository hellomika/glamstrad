import nibble/lexer

pub type Token {
  Print
  StringLiteral(String)
}

pub fn run(input: String) {
  lexer.run(input, lexer())
}

fn lexer() {
  lexer.simple([
    lexer.token("PRINT", Print),
    lexer.token("?", Print),
    lexer.string("\"", StringLiteral),
    lexer.whitespace(Nil) |> lexer.ignore(),
  ])
}
