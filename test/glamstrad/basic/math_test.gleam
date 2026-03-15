import glamstrad/basic/math
import glamstrad/basic/types.{
  ImproperArgument, InputError, IntLiteral, Nothing, OverflowWith, RealLiteral,
  StringLiteral, SyntaxError,
}
import gleeunit/should

// ABS

pub fn abs_pos_int_test() {
  types.ABS
  |> math.call([IntLiteral(4)])
  |> should.be_ok()
  |> should.equal(IntLiteral(4))
}

pub fn abs_zero_int_test() {
  types.ABS
  |> math.call([IntLiteral(0)])
  |> should.be_ok()
  |> should.equal(IntLiteral(0))
}

pub fn abs_neg_int_test() {
  types.ABS
  |> math.call([IntLiteral(-4)])
  |> should.be_ok()
  |> should.equal(IntLiteral(4))
}

pub fn abs_pos_real_test() {
  types.ABS
  |> math.call([RealLiteral(4.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(4.0))
}

pub fn abs_zero_real_test() {
  types.ABS
  |> math.call([RealLiteral(0.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.0))
}

pub fn abs_neg_real_test() {
  types.ABS
  |> math.call([RealLiteral(-4.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(4.0))
}

pub fn abs_string_test() {
  types.ABS
  |> math.call([StringLiteral("4")])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn abs_nothing_test() {
  types.ABS
  |> math.call([Nothing])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn abs_no_args_test() {
  types.ABS
  |> math.call([])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn abs_multiple_args_test() {
  types.ABS
  |> math.call([IntLiteral(4), IntLiteral(-4)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

// ATN

pub fn atn_pos_int_test() {
  types.ATN
  |> math.call([IntLiteral(1)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.7853981633974483))
}

pub fn atn_zero_int_test() {
  types.ATN
  |> math.call([IntLiteral(0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.0))
}

pub fn atn_neg_int_test() {
  types.ATN
  |> math.call([IntLiteral(-1)])
  |> should.be_ok()
  |> should.equal(RealLiteral(-0.7853981633974483))
}

pub fn atn_pos_real_test() {
  types.ATN
  |> math.call([RealLiteral(1.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.7853981633974483))
}

pub fn atn_zero_real_test() {
  types.ATN
  |> math.call([RealLiteral(0.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.0))
}

pub fn atn_neg_real_test() {
  types.ATN
  |> math.call([RealLiteral(-1.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(-0.7853981633974483))
}

pub fn atn_string_test() {
  types.ATN
  |> math.call([StringLiteral("1")])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn atn_nothing_test() {
  types.ATN
  |> math.call([Nothing])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn atn_no_args_test() {
  types.ATN
  |> math.call([])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn atn_multiple_args_test() {
  types.ATN
  |> math.call([IntLiteral(1), IntLiteral(2)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

// CINT

pub fn cint_pos_int_test() {
  types.CINT
  |> math.call([IntLiteral(4)])
  |> should.be_ok()
  |> should.equal(IntLiteral(4))
}

pub fn cint_zero_int_test() {
  types.CINT
  |> math.call([IntLiteral(0)])
  |> should.be_ok()
  |> should.equal(IntLiteral(0))
}

pub fn cint_neg_int_test() {
  types.CINT
  |> math.call([IntLiteral(-4)])
  |> should.be_ok()
  |> should.equal(IntLiteral(-4))
}

pub fn cint_pos_real_up_test() {
  types.CINT
  |> math.call([RealLiteral(4.6)])
  |> should.be_ok()
  |> should.equal(IntLiteral(5))
}

pub fn cint_pos_real_down_test() {
  types.CINT
  |> math.call([RealLiteral(4.4)])
  |> should.be_ok()
  |> should.equal(IntLiteral(4))
}

pub fn cint_zero_real_test() {
  types.CINT
  |> math.call([RealLiteral(0.0)])
  |> should.be_ok()
  |> should.equal(IntLiteral(0))
}

pub fn cint_neg_real_up_test() {
  types.CINT
  |> math.call([RealLiteral(-4.4)])
  |> should.be_ok()
  |> should.equal(IntLiteral(-4))
}

pub fn cint_neg_real_down_test() {
  types.CINT
  |> math.call([RealLiteral(-4.6)])
  |> should.be_ok()
  |> should.equal(IntLiteral(-5))
}

pub fn cint_string_test() {
  types.CINT
  |> math.call([StringLiteral("4")])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn cint_nothing_test() {
  types.CINT
  |> math.call([Nothing])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn cint_no_args_test() {
  types.CINT
  |> math.call([])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn cint_multiple_args_test() {
  types.CINT
  |> math.call([IntLiteral(4), IntLiteral(5)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

// COS

pub fn cos_pos_int_test() {
  types.COS
  |> math.call([IntLiteral(1)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.5403023058681398))
}

pub fn cos_zero_int_test() {
  types.COS
  |> math.call([IntLiteral(0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(1.0))
}

pub fn cos_neg_int_test() {
  types.COS
  |> math.call([IntLiteral(-1)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.5403023058681398))
}

pub fn cos_pos_real_test() {
  types.COS
  |> math.call([RealLiteral(1.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.5403023058681398))
}

pub fn cos_zero_real_test() {
  types.COS
  |> math.call([RealLiteral(0.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(1.0))
}

pub fn cos_neg_real_test() {
  types.COS
  |> math.call([RealLiteral(-1.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.5403023058681398))
}

pub fn cos_string_test() {
  types.COS
  |> math.call([StringLiteral("1")])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn cos_nothing_test() {
  types.COS
  |> math.call([Nothing])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn cos_no_args_test() {
  types.COS
  |> math.call([])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn cos_multiple_args_test() {
  types.COS
  |> math.call([IntLiteral(1), IntLiteral(2)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn cos_pos_overflow_test() {
  types.COS
  |> math.call([IntLiteral(300_000)])
  |> should.be_error()
  |> should.equal(ImproperArgument)
}

pub fn cos_neg_overflow_test() {
  types.COS
  |> math.call([IntLiteral(-300_000)])
  |> should.be_error()
  |> should.equal(ImproperArgument)
}

// EXP

pub fn exp_pos_int_test() {
  types.EXP
  |> math.call([IntLiteral(1)])
  |> should.be_ok()
  |> should.equal(RealLiteral(2.718281828459045))
}

pub fn exp_zero_int_test() {
  types.EXP
  |> math.call([IntLiteral(0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(1.0))
}

pub fn exp_neg_int_test() {
  types.EXP
  |> math.call([IntLiteral(-1)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.36787944117144233))
}

pub fn exp_pos_real_test() {
  types.EXP
  |> math.call([RealLiteral(1.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(2.718281828459045))
}

pub fn exp_zero_real_test() {
  types.EXP
  |> math.call([RealLiteral(0.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(1.0))
}

pub fn exp_neg_real_test() {
  types.EXP
  |> math.call([RealLiteral(-1.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.36787944117144233))
}

pub fn exp_string_test() {
  types.EXP
  |> math.call([StringLiteral("1")])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn exp_nothing_test() {
  types.EXP
  |> math.call([Nothing])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn exp_no_args_test() {
  types.EXP
  |> math.call([])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn exp_multiple_args_test() {
  types.EXP
  |> math.call([IntLiteral(1), IntLiteral(2)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn exp_overflow_test() {
  types.EXP
  |> math.call([IntLiteral(89)])
  |> should.be_error()
  |> should.equal(OverflowWith(RealLiteral(math.max_float32)))
}

// FIX

pub fn fix_pos_int_test() {
  types.FIX
  |> math.call([IntLiteral(4)])
  |> should.be_ok()
  |> should.equal(IntLiteral(4))
}

pub fn fix_zero_int_test() {
  types.FIX
  |> math.call([IntLiteral(0)])
  |> should.be_ok()
  |> should.equal(IntLiteral(0))
}

pub fn fix_neg_int_test() {
  types.FIX
  |> math.call([IntLiteral(-4)])
  |> should.be_ok()
  |> should.equal(IntLiteral(-4))
}

pub fn fix_pos_real_test() {
  types.FIX
  |> math.call([RealLiteral(4.6)])
  |> should.be_ok()
  |> should.equal(IntLiteral(4))
}

pub fn fix_zero_real_test() {
  types.FIX
  |> math.call([RealLiteral(0.0)])
  |> should.be_ok()
  |> should.equal(IntLiteral(0))
}

pub fn fix_neg_real_test() {
  types.FIX
  |> math.call([RealLiteral(-4.6)])
  |> should.be_ok()
  |> should.equal(IntLiteral(-4))
}

pub fn fix_string_test() {
  types.FIX
  |> math.call([StringLiteral("4")])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn fix_nothing_test() {
  types.FIX
  |> math.call([Nothing])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn fix_no_args_test() {
  types.FIX
  |> math.call([])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn fix_multiple_args_test() {
  types.FIX
  |> math.call([IntLiteral(4), IntLiteral(5)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

// INT

pub fn int_pos_int_test() {
  types.INT
  |> math.call([IntLiteral(4)])
  |> should.be_ok()
  |> should.equal(IntLiteral(4))
}

pub fn int_zero_int_test() {
  types.INT
  |> math.call([IntLiteral(0)])
  |> should.be_ok()
  |> should.equal(IntLiteral(0))
}

pub fn int_neg_int_test() {
  types.INT
  |> math.call([IntLiteral(-4)])
  |> should.be_ok()
  |> should.equal(IntLiteral(-4))
}

pub fn int_pos_real_test() {
  types.INT
  |> math.call([RealLiteral(4.6)])
  |> should.be_ok()
  |> should.equal(IntLiteral(4))
}

pub fn int_zero_real_test() {
  types.INT
  |> math.call([RealLiteral(0.0)])
  |> should.be_ok()
  |> should.equal(IntLiteral(0))
}

pub fn int_neg_real_test() {
  types.INT
  |> math.call([RealLiteral(-4.6)])
  |> should.be_ok()
  |> should.equal(IntLiteral(-5))
}

pub fn int_string_test() {
  types.INT
  |> math.call([StringLiteral("4")])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn int_nothing_test() {
  types.INT
  |> math.call([Nothing])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn int_no_args_test() {
  types.INT
  |> math.call([])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn int_multiple_args_test() {
  types.INT
  |> math.call([IntLiteral(4), IntLiteral(5)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

// LOG

pub fn log_pos_int_test() {
  types.LOG
  |> math.call([IntLiteral(1)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.0))
}

pub fn log_zero_int_test() {
  types.LOG
  |> math.call([IntLiteral(0)])
  |> should.be_error()
  |> should.equal(OverflowWith(IntLiteral(0)))
}

pub fn log_neg_int_test() {
  types.LOG
  |> math.call([IntLiteral(-1)])
  |> should.be_error()
  |> should.equal(OverflowWith(IntLiteral(-1)))
}

pub fn log_pos_real_test() {
  types.LOG
  |> math.call([RealLiteral(1.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.0))
}

pub fn log_zero_real_test() {
  types.LOG
  |> math.call([RealLiteral(0.0)])
  |> should.be_error()
  |> should.equal(OverflowWith(RealLiteral(0.0)))
}

pub fn log_neg_real_test() {
  types.LOG
  |> math.call([RealLiteral(-1.0)])
  |> should.be_error()
  |> should.equal(OverflowWith(RealLiteral(-1.0)))
}

pub fn log_string_test() {
  types.LOG
  |> math.call([StringLiteral("1")])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn log_nothing_test() {
  types.LOG
  |> math.call([Nothing])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn log_no_args_test() {
  types.LOG
  |> math.call([])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn log_multiple_args_test() {
  types.LOG
  |> math.call([IntLiteral(1), IntLiteral(2)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

// LOG10

pub fn log10_pos_int_test() {
  types.LOG10
  |> math.call([IntLiteral(1)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.0))
}

pub fn log10_zero_int_test() {
  types.LOG10
  |> math.call([IntLiteral(0)])
  |> should.be_error()
  |> should.equal(OverflowWith(IntLiteral(0)))
}

pub fn log10_neg_int_test() {
  types.LOG10
  |> math.call([IntLiteral(-1)])
  |> should.be_error()
  |> should.equal(OverflowWith(IntLiteral(-1)))
}

pub fn log10_pos_real_test() {
  types.LOG10
  |> math.call([RealLiteral(1.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.0))
}

pub fn log10_zero_real_test() {
  types.LOG10
  |> math.call([RealLiteral(0.0)])
  |> should.be_error()
  |> should.equal(OverflowWith(RealLiteral(0.0)))
}

pub fn log10_neg_real_test() {
  types.LOG10
  |> math.call([RealLiteral(-1.0)])
  |> should.be_error()
  |> should.equal(OverflowWith(RealLiteral(-1.0)))
}

pub fn log10_string_test() {
  types.LOG10
  |> math.call([StringLiteral("1")])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn log10_nothing_test() {
  types.LOG10
  |> math.call([Nothing])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn log10_no_args_test() {
  types.LOG10
  |> math.call([])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn log10_multiple_args_test() {
  types.LOG10
  |> math.call([IntLiteral(1), IntLiteral(2)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

// ROUND

pub fn round_pos_int_test() {
  types.ROUND
  |> math.call([IntLiteral(4)])
  |> should.be_ok()
  |> should.equal(IntLiteral(4))
}

pub fn round_zero_int_test() {
  types.ROUND
  |> math.call([IntLiteral(0)])
  |> should.be_ok()
  |> should.equal(IntLiteral(0))
}

pub fn round_neg_int_test() {
  types.ROUND
  |> math.call([IntLiteral(-4)])
  |> should.be_ok()
  |> should.equal(IntLiteral(-4))
}

pub fn round_pos_real_up_test() {
  types.ROUND
  |> math.call([RealLiteral(4.6)])
  |> should.be_ok()
  |> should.equal(IntLiteral(5))
}

pub fn round_pos_real_down_test() {
  types.ROUND
  |> math.call([RealLiteral(4.4)])
  |> should.be_ok()
  |> should.equal(IntLiteral(4))
}

pub fn round_zero_real_test() {
  types.ROUND
  |> math.call([RealLiteral(0.0)])
  |> should.be_ok()
  |> should.equal(IntLiteral(0))
}

pub fn round_neg_real_up_test() {
  types.ROUND
  |> math.call([RealLiteral(-4.4)])
  |> should.be_ok()
  |> should.equal(IntLiteral(-4))
}

pub fn round_neg_real_down_test() {
  types.ROUND
  |> math.call([RealLiteral(-4.6)])
  |> should.be_ok()
  |> should.equal(IntLiteral(-5))
}

pub fn round_with_pos_int_precision_test() {
  types.ROUND
  |> math.call([RealLiteral(4.567), IntLiteral(2)])
  |> should.be_ok()
  |> should.equal(RealLiteral(4.57))
}

pub fn round_with_neg_int_precision_test() {
  types.ROUND
  |> math.call([IntLiteral(4567), IntLiteral(-2)])
  |> should.be_ok()
  |> should.equal(IntLiteral(4600))
}

pub fn round_with_pos_real_precision_test() {
  types.ROUND
  |> math.call([RealLiteral(4.567), RealLiteral(2.2)])
  |> should.be_ok()
  |> should.equal(RealLiteral(4.57))
}

pub fn round_with_neg_real_precision_test() {
  types.ROUND
  |> math.call([IntLiteral(4567), RealLiteral(-2.2)])
  |> should.be_ok()
  |> should.equal(IntLiteral(4600))
}

pub fn round_string_test() {
  types.ROUND
  |> math.call([StringLiteral("4")])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn round_nothing_test() {
  types.ROUND
  |> math.call([Nothing])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn round_no_args_test() {
  types.ROUND
  |> math.call([])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn round_too_many_args_test() {
  types.ROUND
  |> math.call([IntLiteral(4), IntLiteral(2), IntLiteral(1)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

// SGN

pub fn sgn_pos_int_test() {
  types.SGN
  |> math.call([IntLiteral(4)])
  |> should.be_ok()
  |> should.equal(IntLiteral(1))
}

pub fn sgn_zero_int_test() {
  types.SGN
  |> math.call([IntLiteral(0)])
  |> should.be_ok()
  |> should.equal(IntLiteral(0))
}

pub fn sgn_neg_int_test() {
  types.SGN
  |> math.call([IntLiteral(-4)])
  |> should.be_ok()
  |> should.equal(IntLiteral(-1))
}

pub fn sgn_pos_real_test() {
  types.SGN
  |> math.call([RealLiteral(4.0)])
  |> should.be_ok()
  |> should.equal(IntLiteral(1))
}

pub fn sgn_zero_real_test() {
  types.SGN
  |> math.call([RealLiteral(0.0)])
  |> should.be_ok()
  |> should.equal(IntLiteral(0))
}

pub fn sgn_neg_real_test() {
  types.SGN
  |> math.call([RealLiteral(-4.0)])
  |> should.be_ok()
  |> should.equal(IntLiteral(-1))
}

pub fn sgn_string_test() {
  types.SGN
  |> math.call([StringLiteral("4")])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn sgn_nothing_test() {
  types.SGN
  |> math.call([Nothing])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn sgn_no_args_test() {
  types.SGN
  |> math.call([])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn sgn_multiple_args_test() {
  types.SGN
  |> math.call([IntLiteral(4), IntLiteral(5)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

// SIN

pub fn sin_pos_int_test() {
  types.SIN
  |> math.call([IntLiteral(1)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.8414709848078965))
}

pub fn sin_zero_int_test() {
  types.SIN
  |> math.call([IntLiteral(0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.0))
}

pub fn sin_neg_int_test() {
  types.SIN
  |> math.call([IntLiteral(-1)])
  |> should.be_ok()
  |> should.equal(RealLiteral(-0.8414709848078965))
}

pub fn sin_pos_real_test() {
  types.SIN
  |> math.call([RealLiteral(1.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.8414709848078965))
}

pub fn sin_zero_real_test() {
  types.SIN
  |> math.call([RealLiteral(0.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.0))
}

pub fn sin_neg_real_test() {
  types.SIN
  |> math.call([RealLiteral(-1.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(-0.8414709848078965))
}

pub fn sin_string_test() {
  types.SIN
  |> math.call([StringLiteral("1")])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn sin_nothing_test() {
  types.SIN
  |> math.call([Nothing])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn sin_no_args_test() {
  types.SIN
  |> math.call([])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn sin_multiple_args_test() {
  types.SIN
  |> math.call([IntLiteral(1), IntLiteral(2)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn sin_pos_overflow_test() {
  types.SIN
  |> math.call([IntLiteral(300_000)])
  |> should.be_error()
  |> should.equal(ImproperArgument)
}

pub fn sin_neg_overflow_test() {
  types.SIN
  |> math.call([IntLiteral(-300_000)])
  |> should.be_error()
  |> should.equal(ImproperArgument)
}

// SQR

pub fn sqr_pos_int_test() {
  types.SQR
  |> math.call([IntLiteral(4)])
  |> should.be_ok()
  |> should.equal(RealLiteral(2.0))
}

pub fn sqr_zero_int_test() {
  types.SQR
  |> math.call([IntLiteral(0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.0))
}

pub fn sqr_neg_int_test() {
  types.SQR
  |> math.call([IntLiteral(-1)])
  |> should.be_error()
  |> should.equal(ImproperArgument)
}

pub fn sqr_pos_real_test() {
  types.SQR
  |> math.call([RealLiteral(4.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(2.0))
}

pub fn sqr_zero_real_test() {
  types.SQR
  |> math.call([RealLiteral(0.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.0))
}

pub fn sqr_neg_real_test() {
  types.SQR
  |> math.call([RealLiteral(-1.0)])
  |> should.be_error()
  |> should.equal(ImproperArgument)
}

pub fn sqr_string_test() {
  types.SQR
  |> math.call([StringLiteral("4")])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn sqr_nothing_test() {
  types.SQR
  |> math.call([Nothing])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn sqr_no_args_test() {
  types.SQR
  |> math.call([])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn sqr_multiple_args_test() {
  types.SQR
  |> math.call([IntLiteral(4), IntLiteral(9)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

// TAN

pub fn tan_pos_int_test() {
  types.TAN
  |> math.call([IntLiteral(1)])
  |> should.be_ok()
  |> should.equal(RealLiteral(1.5574077246549023))
}

pub fn tan_zero_int_test() {
  types.TAN
  |> math.call([IntLiteral(0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.0))
}

pub fn tan_neg_int_test() {
  types.TAN
  |> math.call([IntLiteral(-1)])
  |> should.be_ok()
  |> should.equal(RealLiteral(-1.5574077246549023))
}

pub fn tan_pos_real_test() {
  types.TAN
  |> math.call([RealLiteral(1.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(1.5574077246549023))
}

pub fn tan_zero_real_test() {
  types.TAN
  |> math.call([RealLiteral(0.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(0.0))
}

pub fn tan_neg_real_test() {
  types.TAN
  |> math.call([RealLiteral(-1.0)])
  |> should.be_ok()
  |> should.equal(RealLiteral(-1.5574077246549023))
}

pub fn tan_string_test() {
  types.TAN
  |> math.call([StringLiteral("1")])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn tan_nothing_test() {
  types.TAN
  |> math.call([Nothing])
  |> should.be_error()
  |> should.equal(InputError)
}

pub fn tan_no_args_test() {
  types.TAN
  |> math.call([])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn tan_multiple_args_test() {
  types.TAN
  |> math.call([IntLiteral(1), IntLiteral(2)])
  |> should.be_error()
  |> should.equal(SyntaxError)
}

pub fn tan_pos_overflow_test() {
  types.TAN
  |> math.call([IntLiteral(300_000)])
  |> should.be_error()
  |> should.equal(ImproperArgument)
}

pub fn tan_neg_overflow_test() {
  types.TAN
  |> math.call([IntLiteral(-300_000)])
  |> should.be_error()
  |> should.equal(ImproperArgument)
}
