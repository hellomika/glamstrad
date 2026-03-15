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

fn call(function, literals) {
  case function {
    types.MathFunction(function) -> math.call(function, literals)
  }
}
