import gleam/list
import nibble/lexer

pub type Token {
  Print
  Cls
  StringLiteral(String)
}

pub fn run(input: String) {
  lexer.run(input, lexer())
}

fn lexer() {
  lexer.simple(
    list.flatten([
      commands(),
      [
        lexer.string("\"", StringLiteral),
        lexer.whitespace(Nil) |> lexer.ignore(),
      ],
    ]),
  )
}

fn commands() {
  [
    lexer.token("PRINT", Print),
    lexer.token("?", Print),
    lexer.token("CLS", Cls),
  ]
}
