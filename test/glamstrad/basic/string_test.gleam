import glamstrad/basic/string
import glamstrad/basic/types.{
  ImproperArgument, InputError, IntLiteral, Nothing, RealLiteral, StringLiteral,
  SyntaxError, TypeMismatch,
}
import gleeunit/should

// BIN$

pub fn bin_pos_int_test() {
  types.BIN
  |> string.call([IntLiteral(44)])
  |> should.be_ok()
  |> should.equal(StringLiteral("101100"))
}

pub fn bin_zero_int_test() {
  types.BIN
  |> string.call([IntLiteral(0)])
  |> should.be_ok()
  |> should.equal(StringLiteral("0"))
}

pub fn bin_neg_int_test() {
  types.BIN
  |> string.call([IntLiteral(-44)])
  |> should.be_ok()
  |> should.equal(StringLiteral("1111111111010100"))
}

pub fn bin_max_pos_test() {
  types.BIN
  |> string.call([IntLiteral(65_536)])
  |> should.be_ok()
  |> should.equal(StringLiteral("10000000000000000"))
}

pub fn bin_max_neg_test() {
  types.BIN
  |> string.call([IntLiteral(-32_768)])
  |> should.be_ok()
  |> should.equal(StringLiteral("1000000000000000"))
}

pub fn bin_overflow_pos_test() {
  types.BIN
  |> string.call([IntLiteral(65_537)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn bin_overflow_neg_test() {
  types.BIN
  |> string.call([IntLiteral(-32_769)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn bin_with_max_padding_test() {
  types.BIN
  |> string.call([IntLiteral(5), IntLiteral(16)])
  |> should.be_ok()
  |> should.equal(StringLiteral("0000000000000101"))
}

pub fn bin_with_zero_padding_test() {
  types.BIN
  |> string.call([IntLiteral(5), IntLiteral(0)])
  |> should.be_ok()
  |> should.equal(StringLiteral("101"))
}

pub fn bin_neg_padding_test() {
  types.BIN
  |> string.call([IntLiteral(5), IntLiteral(-1)])
  |> should.be_error()
  |> should.equal(ImproperArgument)
}

pub fn bin_padding_too_large_test() {
  types.BIN
  |> string.call([IntLiteral(5), IntLiteral(17)])
  |> should.be_error()
  |> should.equal(ImproperArgument)
}

pub fn bin_real_test() {
  types.BIN
  |> string.call([RealLiteral(44.7)])
  |> should.be_ok()
  |> should.equal(StringLiteral("101101"))
}

pub fn bin_string_test() {
  types.BIN
  |> string.call([StringLiteral("44")])
  |> should.be_error()
  |> should.equal(TypeMismatch)
}

pub fn bin_nothing_test() {
  types.BIN
  |> string.call([Nothing])
  |> should.be_error()
  |> should.equal(TypeMismatch)
}

pub fn bin_no_args_test() {
  types.BIN
  |> string.call([])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn bin_too_many_args_test() {
  types.BIN
  |> string.call([IntLiteral(5), IntLiteral(8), IntLiteral(1)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

// HEX$

pub fn hex_pos_int_test() {
  types.HEX
  |> string.call([IntLiteral(255)])
  |> should.be_ok()
  |> should.equal(StringLiteral("FF"))
}

pub fn hex_zero_int_test() {
  types.HEX
  |> string.call([IntLiteral(0)])
  |> should.be_ok()
  |> should.equal(StringLiteral("0"))
}

pub fn hex_neg_int_test() {
  types.HEX
  |> string.call([IntLiteral(-1)])
  |> should.be_ok()
  |> should.equal(StringLiteral("FFFF"))
}

pub fn hex_max_pos_test() {
  types.HEX
  |> string.call([IntLiteral(65_536)])
  |> should.be_ok()
  |> should.equal(StringLiteral("10000"))
}

pub fn hex_max_neg_test() {
  types.HEX
  |> string.call([IntLiteral(-32_768)])
  |> should.be_ok()
  |> should.equal(StringLiteral("8000"))
}

pub fn hex_overflow_pos_test() {
  types.HEX
  |> string.call([IntLiteral(65_537)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn hex_overflow_neg_test() {
  types.HEX
  |> string.call([IntLiteral(-32_769)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn hex_with_max_padding_test() {
  types.HEX
  |> string.call([IntLiteral(255), IntLiteral(16)])
  |> should.be_ok()
  |> should.equal(StringLiteral("00000000000000FF"))
}

pub fn hex_neg_padding_test() {
  types.HEX
  |> string.call([IntLiteral(255), IntLiteral(-1)])
  |> should.be_error()
  |> should.equal(ImproperArgument)
}

pub fn hex_real_test() {
  types.HEX
  |> string.call([RealLiteral(255.4)])
  |> should.be_ok()
  |> should.equal(StringLiteral("FF"))
}

pub fn hex_string_test() {
  types.HEX
  |> string.call([StringLiteral("FF")])
  |> should.be_error()
  |> should.equal(TypeMismatch)
}

pub fn hex_nothing_test() {
  types.HEX
  |> string.call([Nothing])
  |> should.be_error()
  |> should.equal(TypeMismatch)
}

pub fn hex_no_args_test() {
  types.HEX
  |> string.call([])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn hex_too_many_args_test() {
  types.HEX
  |> string.call([IntLiteral(255), IntLiteral(4), IntLiteral(1)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

// STR$

pub fn str_pos_int_test() {
  types.STR
  |> string.call([IntLiteral(42)])
  |> should.be_ok()
  |> should.equal(StringLiteral("42"))
}

pub fn str_zero_int_test() {
  types.STR
  |> string.call([IntLiteral(0)])
  |> should.be_ok()
  |> should.equal(StringLiteral("0"))
}

pub fn str_neg_int_test() {
  types.STR
  |> string.call([IntLiteral(-42)])
  |> should.be_ok()
  |> should.equal(StringLiteral("-42"))
}

pub fn str_pos_real_test() {
  types.STR
  |> string.call([RealLiteral(3.14)])
  |> should.be_ok()
  |> should.equal(StringLiteral("3.14"))
}

pub fn str_zero_real_test() {
  types.STR
  |> string.call([RealLiteral(0.0)])
  |> should.be_ok()
  |> should.equal(StringLiteral("0.0"))
}

pub fn str_neg_real_test() {
  types.STR
  |> string.call([RealLiteral(-3.14)])
  |> should.be_ok()
  |> should.equal(StringLiteral("-3.14"))
}

pub fn str_string_test() {
  types.STR
  |> string.call([StringLiteral("42")])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn str_nothing_test() {
  types.STR
  |> string.call([Nothing])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn str_no_args_test() {
  types.STR
  |> string.call([])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn str_multiple_args_test() {
  types.STR
  |> string.call([IntLiteral(42), IntLiteral(10)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}
