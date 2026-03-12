import glamstrad/basic/function
import glamstrad/basic/math
import glamstrad/basic/screen
import glamstrad/basic/types
import glamstrad/lexer
import glamstrad/parser
import gleam/list
import gleam/result
import gleam/string

pub fn init() -> Nil {
  screen.init()
}

pub fn run() -> Nil {
  case interpret() {
    Error(_) -> screen.syntax_error()
    _ -> Nil
  }
}

fn interpret() {
  use input <- result.try(prompt())
  use tokens <- result.try(lex(input))
  use statement_ast <- result.try(parse(tokens))
  eval_statement(statement_ast)
}

fn prompt() {
  screen.prompt()
  |> result.map_error(fn(_) { types.InputError })
}

fn lex(input) {
  input
  |> string.trim()
  |> lexer.run()
  |> result.map_error(fn(_) { types.LexError })
}

fn parse(tokens) {
  tokens
  |> parser.run()
  |> result.map_error(fn(_) { types.ParseError })
}

fn eval_statement(statement_ast) {
  let types.Statement(command, expression_ast) = statement_ast
  use literal <- result.try(eval_expression(expression_ast))
  execute(command, literal)
}

fn eval_expression(expression_ast) {
  case expression_ast {
    types.Call(function, args) -> {
      use literals <- result.try(list.try_map(args, eval_expression))
      call(function, literals)
    }

    types.Literal(literal) -> Ok(literal)
  }
}

fn execute(command, literal) {
  case command {
    types.PRINT -> screen.print(literal)
    types.CLS -> screen.cls()
  }
}

fn call(
  function: function.Function,
  literals: List(types.Literal),
) -> Result(types.Literal, types.Error) {
  case function {
    function.ABS -> math.abs(literals)
    function.ATN -> math.atn(literals)
    function.CINT -> math.cint(literals)
    function.COS -> math.cos(literals)
    function.EXP -> math.exp(literals)
    function.FIX -> math.fix(literals)
    function.INT -> math.int(literals)
    function.LOG10 -> math.log10(literals)
    function.LOG -> math.log(literals)
    function.ROUND -> math.round(literals)
    function.SGN -> math.sgn(literals)
    function.SIN -> math.sin(literals)
    function.SQR -> math.sqr(literals)
    function.TAN -> math.tan(literals)
  }
}
