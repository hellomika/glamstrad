import glamstrad/basic/function.{type Function}
import glamstrad/basic/types
import gleam/list
import gleam/string
import nibble/lexer

pub type BasicToken {
  Command(types.Command)
  Function(Function)
  Literal(types.Literal)
  LParen
  RParen
  Comma
}

pub fn run(input: String) -> Result(List(lexer.Token(BasicToken)), lexer.Error) {
  lexer.run(
    input,
    lexer.simple(
      list.flatten([
        commands(),
        math_functions(),
        literals(),
        symbols(),
      ]),
    ),
  )
}

fn commands() {
  [
    command_token("CLS", types.CLS),
    command_token("PRINT", types.PRINT),
    lexer.token("?", Command(types.PRINT)),
  ]
}

fn command_token(command_name: String, command_type: types.Command) {
  token(command_name, Command(command_type))
}

fn math_functions() {
  [
    function_token("ABS", function.ABS),
    function_token("ATN", function.ATN),
    function_token("CINT", function.CINT),
    function_token("COS", function.COS),
    function_token("EXP", function.EXP),
    function_token("FIX", function.FIX),
    function_token("INT", function.INT),
    function_token("LOG10", function.LOG10),
    function_token("LOG", function.LOG),
    function_token("ROUND", function.ROUND),
    function_token("SGN", function.SGN),
    function_token("SIN", function.SIN),
    function_token("SQR", function.SQR),
    function_token("TAN", function.TAN),
  ]
}

fn function_token(function_name: String, function_type: Function) {
  token(function_name, Function(function_type))
}

fn token(function: String, token: BasicToken) {
  lexer.keep(fn(lexeme, _lookahead) {
    case string.uppercase(lexeme) == function {
      True -> Ok(token)
      False -> Error(Nil)
    }
  })
}

fn literals() {
  [
    lexer.string("\"", fn(str) { Literal(types.StringLiteral(str)) }),
    lexer.number(fn(int) { Literal(types.IntLiteral(int)) }, fn(float) {
      Literal(types.RealLiteral(float))
    }),
  ]
}

fn symbols() {
  [
    lexer.token("(", LParen),
    lexer.token(")", RParen),
    lexer.token(",", Comma),
    lexer.whitespace(Nil) |> lexer.ignore(),
  ]
}
