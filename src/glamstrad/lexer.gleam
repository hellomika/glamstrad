import glamstrad/basic/types.{MathFunction}
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
    function_token("ABS", MathFunction(types.ABS)),
    function_token("ATN", MathFunction(types.ATN)),
    function_token("CINT", MathFunction(types.CINT)),
    function_token("COS", MathFunction(types.COS)),
    function_token("EXP", MathFunction(types.EXP)),
    function_token("FIX", MathFunction(types.FIX)),
    function_token("INT", MathFunction(types.INT)),
    function_token("LOG10", MathFunction(types.LOG10)),
    function_token("LOG", MathFunction(types.LOG)),
    function_token("ROUND", MathFunction(types.ROUND)),
    function_token("SGN", MathFunction(types.SGN)),
    function_token("SIN", MathFunction(types.SIN)),
    function_token("SQR", MathFunction(types.SQR)),
    function_token("TAN", MathFunction(types.TAN)),
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
