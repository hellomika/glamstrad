import glamstrad/basic/types.{
  type Error, type Literal, ImproperArgument, IntLiteral, IntNumber, RealLiteral,
  RealNumber, StringLiteral, SyntaxError, TypeMismatch,
}
import glamstrad/utils
import gleam/float
import gleam/int
import gleam/result
import gleam/string

pub fn call(
  function: types.StringFunction,
  literals: List(Literal),
) -> Result(Literal, Error) {
  case function {
    types.BIN -> bin(literals)
    types.HEX -> hex(literals)
    types.STR -> str(literals)
  }
}

fn bin(lits: List(Literal)) -> Result(Literal, Error) {
  to_base_string(lits, int.to_base2)
}

fn hex(lits: List(Literal)) -> Result(Literal, Error) {
  to_base_string(lits, int.to_base16)
}

fn to_base_string(
  lits: List(Literal),
  base_fun: fn(Int) -> String,
) -> Result(Literal, Error) {
  use #(n, p) <- result.try(base_args(lits))
  case n >= -32_768 && n <= 65_536 {
    True ->
      case p >= 0 && p <= 16 {
        True ->
          n
          |> to_unsigned_16()
          |> base_fun()
          |> string.pad_start(to: p, with: "0")
          |> StringLiteral()
          |> Ok()
        False -> Error(ImproperArgument)
      }
    False -> Error(SyntaxError)
  }
}

fn base_args(lits: List(Literal)) -> Result(#(Int, Int), Error) {
  case lits {
    [n_lit, p_lit] -> {
      use n_int <- result.try(to_int(n_lit))
      use p_int <- result.try(to_int(p_lit))
      Ok(#(n_int, p_int))
    }
    [n_lit] -> {
      use n_int <- result.try(to_int(n_lit))
      Ok(#(n_int, 0))
    }
    _ -> Error(SyntaxError)
  }
}

fn to_int(lit: Literal) -> Result(Int, Error) {
  case lit {
    IntLiteral(n) -> n |> Ok()
    RealLiteral(n) -> n |> float.round() |> Ok()
    _ -> Error(TypeMismatch)
  }
}

fn to_unsigned_16(n: Int) -> Int {
  case n < 0 {
    True -> n + 65_536
    False -> n
  }
}

fn str(lits: List(Literal)) -> Result(Literal, Error) {
  use lit <- result.try(utils.single_arg(lits))
  use num <- result.try(utils.to_number(lit))
  case num {
    IntNumber(n) -> n |> int.to_string() |> StringLiteral() |> Ok()
    RealNumber(n) -> n |> float.to_string() |> StringLiteral() |> Ok()
  }
}
