import glamstrad/basic/types.{MathFunction as Mfn, StringFunction as Sfn}
import gleam/list
import gleam/string
import nibble/lexer

pub type BasicToken {
  Command(types.Command)
  Function(types.Function)
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
        string_functions(),
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
    function_token("ABS", Mfn(types.ABS)),
    function_token("ATN", Mfn(types.ATN)),
    function_token("CINT", Mfn(types.CINT)),
    function_token("COS", Mfn(types.COS)),
    function_token("EXP", Mfn(types.EXP)),
    function_token("FIX", Mfn(types.FIX)),
    function_token("INT", Mfn(types.INT)),
    function_token("LOG10", Mfn(types.LOG10)),
    function_token("LOG", Mfn(types.LOG)),
    function_token("ROUND", Mfn(types.ROUND)),
    function_token("SGN", Mfn(types.SGN)),
    function_token("SIN", Mfn(types.SIN)),
    function_token("SQR", Mfn(types.SQR)),
    function_token("TAN", Mfn(types.TAN)),
  ]
}

fn string_functions() {
  [
    function_token("BIN$", Sfn(types.BIN)),
    function_token("HEX$", Sfn(types.HEX)),
    function_token("STR$", Sfn(types.STR)),
  ]
}

fn function_token(function_name: String, function_type: types.Function) {
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
