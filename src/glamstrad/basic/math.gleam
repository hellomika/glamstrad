import glamstrad/basic/types.{
  type Error, type Literal, ImproperArgument, InputError, IntLiteral,
  OverflowWith, RealLiteral, SyntaxError,
}
import gleam/float
import gleam/int
import gleam/result
import gleam_community/maths

type Number {
  Int(Int)
  Real(Float)
}

pub const max_float32 = 1.70141e38

const max_exp = 89.0

const max_trig: Float = 205_884.27455

pub fn abs(lits: List(Literal)) -> Result(Literal, Error) {
  use lit <- result.try(single_arg(lits))
  use num <- result.try(to_number(lit))
  case num {
    Int(n) ->
      n
      |> int.absolute_value()
      |> IntLiteral()
      |> Ok()
    Real(n) ->
      n
      |> float.absolute_value()
      |> RealLiteral()
      |> Ok()
  }
}

pub fn atn(lits: List(Literal)) -> Result(Literal, Error) {
  use lit <- result.try(single_arg(lits))
  use num <- result.try(to_number(lit))
  num
  |> to_float()
  |> float_op(maths.atan)
}

pub fn cint(lits: List(Literal)) -> Result(Literal, Error) {
  use lit <- result.try(single_arg(lits))
  use num <- result.try(to_number(lit))
  case num {
    Real(n) -> n |> float.round() |> IntLiteral() |> Ok()
    Int(n) -> n |> IntLiteral() |> Ok()
  }
}

pub fn cos(lits: List(Literal)) -> Result(Literal, Error) {
  use lit <- result.try(single_arg(lits))
  use num <- result.try(to_number(lit))
  num
  |> to_float()
  |> trig_op(maths.cos)
}

pub fn exp(lits: List(Literal)) -> Result(Literal, Error) {
  use lit <- result.try(single_arg(lits))
  use num <- result.try(to_number(lit))
  case to_float(num) {
    n if n <. max_exp -> float_op(n, maths.exponential)
    _ -> Error(OverflowWith(RealLiteral(max_float32)))
  }
}

pub fn fix(lits: List(Literal)) -> Result(Literal, Error) {
  use lit <- result.try(single_arg(lits))
  use num <- result.try(to_number(lit))
  case num {
    Real(n) -> n |> float.truncate() |> IntLiteral() |> Ok()
    Int(n) -> n |> IntLiteral() |> Ok()
  }
}

pub fn int(lits: List(Literal)) -> Result(Literal, Error) {
  use lit <- result.try(single_arg(lits))
  use num <- result.try(to_number(lit))
  case num {
    Real(n) -> n |> float.floor() |> float.truncate() |> IntLiteral() |> Ok()
    Int(n) -> n |> IntLiteral() |> Ok()
  }
}

pub fn log(lits: List(Literal)) -> Result(Literal, Error) {
  use lit <- result.try(single_arg(lits))
  use num <- result.try(to_number(lit))
  let n = to_float(num)
  case maths.natural_logarithm(n) {
    Ok(value) -> Ok(RealLiteral(value))
    Error(Nil) -> Error(OverflowWith(lit))
  }
}

pub fn log10(lits: List(Literal)) -> Result(Literal, Error) {
  use lit <- result.try(single_arg(lits))
  use num <- result.try(to_number(lit))
  let n = to_float(num)
  case maths.logarithm_10(n) {
    Ok(value) -> Ok(RealLiteral(value))
    Error(Nil) -> Error(OverflowWith(lit))
  }
}

pub fn round(lits: List(Literal)) -> Result(Literal, Error) {
  case lits {
    [n_lit, p_lit] -> do_round(n_lit, p_lit)
    [n_lit] -> do_round(n_lit, IntLiteral(0))
    _ -> Error(SyntaxError)
  }
}

fn do_round(n_lit: Literal, p_lit: Literal) -> Result(Literal, Error) {
  use n_num <- result.try(to_number(n_lit))
  use p_num <- result.try(to_number(p_lit))
  let p = to_int(p_num)
  let r = n_num |> to_float() |> maths.round_to_nearest(p)

  case p {
    _ if p > 0 -> r |> RealLiteral() |> Ok()
    _ -> r |> float.truncate() |> IntLiteral() |> Ok()
  }
}

pub fn sgn(lits: List(Literal)) -> Result(Literal, Error) {
  use lit <- result.try(single_arg(lits))
  use num <- result.try(to_number(lit))
  num
  |> to_float()
  |> float_op(maths.sign)
  |> result.try(fn(result) { fix([result]) })
}

pub fn sin(lits: List(Literal)) -> Result(Literal, Error) {
  use lit <- result.try(single_arg(lits))
  use num <- result.try(to_number(lit))
  num
  |> to_float()
  |> trig_op(maths.sin)
}

pub fn sqr(lits: List(Literal)) -> Result(Literal, Error) {
  use lit <- result.try(single_arg(lits))
  use num <- result.try(to_number(lit))
  let n = to_float(num)
  case float.square_root(n) {
    Ok(value) -> Ok(RealLiteral(value))
    Error(Nil) -> Error(ImproperArgument)
  }
}

pub fn tan(lits: List(Literal)) -> Result(Literal, Error) {
  use lit <- result.try(single_arg(lits))
  use num <- result.try(to_number(lit))
  num
  |> to_float()
  |> trig_op(maths.tan)
}

fn single_arg(lits: List(Literal)) -> Result(Literal, Error) {
  case lits {
    [lit] -> Ok(lit)
    _ -> Error(SyntaxError)
  }
}

fn to_number(lit: Literal) -> Result(Number, Error) {
  case lit {
    IntLiteral(n) -> Ok(Int(n))
    RealLiteral(n) -> Ok(Real(n))
    _ -> Error(InputError)
  }
}

fn to_float(num: Number) -> Float {
  case num {
    Int(n) -> int.to_float(n)
    Real(n) -> n
  }
}

fn to_int(num: Number) -> Int {
  case num {
    Int(n) -> n
    Real(n) -> float.round(n)
  }
}

fn float_op(n: Float, fun: fn(Float) -> Float) -> Result(Literal, Error) {
  n |> fun() |> RealLiteral() |> Ok()
}

fn trig_op(n: Float, fun: fn(Float) -> Float) -> Result(Literal, Error) {
  case float.absolute_value(n) <=. max_trig {
    True -> float_op(n, fun)
    False -> Error(ImproperArgument)
  }
}
