import gleam/list
import gleam/string
import nibble/lexer.{type Error as NibbleError, type Token as NibbleToken} as nibble_lexer

pub type BasicToken {
  Print
  Command(String)
  Function(String)
  StringLiteral(String)
  RealLiteral(Float)
  IntLiteral(Int)
}

pub fn run(input: String) -> Result(List(NibbleToken(BasicToken)), NibbleError) {
  nibble_lexer.run(input, lexer())
}

fn lexer() {
  nibble_lexer.simple(
    list.flatten([
      print_tokens(),
      commands(),
      literals(),
      [
        nibble_lexer.whitespace(Nil) |> nibble_lexer.ignore(),
      ],
    ]),
  )
}

fn print_tokens() {
  [
    token("PRINT", Print),
    nibble_lexer.token("?", Print),
  ]
}

fn commands() {
  [
    command_token("CLS"),
  ]
}

fn command_token(command: String) {
  token(command, Command(command))
}

fn token(function: String, token: BasicToken) {
  nibble_lexer.keep(fn(lexeme, _lookahead) {
    case string.uppercase(lexeme) == function {
      True -> Ok(token)
      False -> Error(Nil)
    }
  })
}

fn literals() {
  [
    nibble_lexer.string("\"", StringLiteral),
    nibble_lexer.number(IntLiteral, RealLiteral),
  ]
}
