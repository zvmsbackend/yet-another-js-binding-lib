

///|
/// Represents TypeScript union `T1 | T2`.
#external
type U2[T1, T2]

///|
/// Creates a `U2` from `T1`.
pub fn[T1, T2] U2::from_t1(obj : T1) -> U2[T1, T2] = "%identity"

///|
/// Casts a `U2` to `T1` without runtime check.
pub fn[T1, T2] U2::unsafe_as_t1(self : U2[T1, T2]) -> T1 = "%identity"

///|
/// Creates a `U2` from `T2`.
pub fn[T1, T2] U2::from_t2(obj : T2) -> U2[T1, T2] = "%identity"

///|
/// Casts a `U2` to `T2` without runtime check.
pub fn[T1, T2] U2::unsafe_as_t2(self : U2[T1, T2]) -> T2 = "%identity"

///|
/// Represents TypeScript union `T1 | T2 | T3`.
#external
type U3[T1, T2, T3]

///|
/// Creates a `U3` from `T1`.
pub fn[T1, T2, T3] U3::from_t1(obj : T1) -> U3[T1, T2, T3] = "%identity"

///|
/// Casts a `U3` to `T1` without runtime check.
pub fn[T1, T2, T3] U3::unsafe_as_t1(self : U3[T1, T2, T3]) -> T1 = "%identity"

///|
/// Creates a `U3` from `T2`.
pub fn[T1, T2, T3] U3::from_t2(obj : T2) -> U3[T1, T2, T3] = "%identity"

///|
/// Casts a `U3` to `T2` without runtime check.
pub fn[T1, T2, T3] U3::unsafe_as_t2(self : U3[T1, T2, T3]) -> T2 = "%identity"

///|
/// Creates a `U3` from `T3`.
pub fn[T1, T2, T3] U3::from_t3(obj : T3) -> U3[T1, T2, T3] = "%identity"

///|
/// Casts a `U3` to `T3` without runtime check.
pub fn[T1, T2, T3] U3::unsafe_as_t3(self : U3[T1, T2, T3]) -> T3 = "%identity"

///|
/// Represents TypeScript union `T1 | T2 | T3 | T4`.
#external
type U4[T1, T2, T3, T4]

///|
/// Creates a `U4` from `T1`.
pub fn[T1, T2, T3, T4] U4::from_t1(obj : T1) -> U4[T1, T2, T3, T4] = "%identity"

///|
/// Casts a `U4` to `T1` without runtime check.
pub fn[T1, T2, T3, T4] U4::unsafe_as_t1(self : U4[T1, T2, T3, T4]) -> T1 = "%identity"

///|
/// Creates a `U4` from `T2`.
pub fn[T1, T2, T3, T4] U4::from_t2(obj : T2) -> U4[T1, T2, T3, T4] = "%identity"

///|
/// Casts a `U4` to `T2` without runtime check.
pub fn[T1, T2, T3, T4] U4::unsafe_as_t2(self : U4[T1, T2, T3, T4]) -> T2 = "%identity"

///|
/// Creates a `U4` from `T3`.
pub fn[T1, T2, T3, T4] U4::from_t3(obj : T3) -> U4[T1, T2, T3, T4] = "%identity"

///|
/// Casts a `U4` to `T3` without runtime check.
pub fn[T1, T2, T3, T4] U4::unsafe_as_t3(self : U4[T1, T2, T3, T4]) -> T3 = "%identity"

///|
/// Creates a `U4` from `T4`.
pub fn[T1, T2, T3, T4] U4::from_t4(obj : T4) -> U4[T1, T2, T3, T4] = "%identity"

///|
/// Casts a `U4` to `T4` without runtime check.
pub fn[T1, T2, T3, T4] U4::unsafe_as_t4(self : U4[T1, T2, T3, T4]) -> T4 = "%identity"

///|
/// Represents TypeScript union `T1 | T2 | T3 | T4 | T5`.
#external
type U5[T1, T2, T3, T4, T5]

///|
/// Creates a `U5` from `T1`.
pub fn[T1, T2, T3, T4, T5] U5::from_t1(obj : T1) -> U5[T1, T2, T3, T4, T5] = "%identity"

///|
/// Casts a `U5` to `T1` without runtime check.
pub fn[T1, T2, T3, T4, T5] U5::unsafe_as_t1(self : U5[T1, T2, T3, T4, T5]) -> T1 = "%identity"

///|
/// Creates a `U5` from `T2`.
pub fn[T1, T2, T3, T4, T5] U5::from_t2(obj : T2) -> U5[T1, T2, T3, T4, T5] = "%identity"

///|
/// Casts a `U5` to `T2` without runtime check.
pub fn[T1, T2, T3, T4, T5] U5::unsafe_as_t2(self : U5[T1, T2, T3, T4, T5]) -> T2 = "%identity"

///|
/// Creates a `U5` from `T3`.
pub fn[T1, T2, T3, T4, T5] U5::from_t3(obj : T3) -> U5[T1, T2, T3, T4, T5] = "%identity"

///|
/// Casts a `U5` to `T3` without runtime check.
pub fn[T1, T2, T3, T4, T5] U5::unsafe_as_t3(self : U5[T1, T2, T3, T4, T5]) -> T3 = "%identity"

///|
/// Creates a `U5` from `T4`.
pub fn[T1, T2, T3, T4, T5] U5::from_t4(obj : T4) -> U5[T1, T2, T3, T4, T5] = "%identity"

///|
/// Casts a `U5` to `T4` without runtime check.
pub fn[T1, T2, T3, T4, T5] U5::unsafe_as_t4(self : U5[T1, T2, T3, T4, T5]) -> T4 = "%identity"

///|
/// Creates a `U5` from `T5`.
pub fn[T1, T2, T3, T4, T5] U5::from_t5(obj : T5) -> U5[T1, T2, T3, T4, T5] = "%identity"

///|
/// Casts a `U5` to `T5` without runtime check.
pub fn[T1, T2, T3, T4, T5] U5::unsafe_as_t5(self : U5[T1, T2, T3, T4, T5]) -> T5 = "%identity"

///|
/// Represents TypeScript union `T1 | T2 | T3 | T4 | T5 | T6`.
#external
type U6[T1, T2, T3, T4, T5, T6]

///|
/// Creates a `U6` from `T1`.
pub fn[T1, T2, T3, T4, T5, T6] U6::from_t1(obj : T1) -> U6[T1, T2, T3, T4, T5, T6] = "%identity"

///|
/// Casts a `U6` to `T1` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6] U6::unsafe_as_t1(self : U6[T1, T2, T3, T4, T5, T6]) -> T1 = "%identity"

///|
/// Creates a `U6` from `T2`.
pub fn[T1, T2, T3, T4, T5, T6] U6::from_t2(obj : T2) -> U6[T1, T2, T3, T4, T5, T6] = "%identity"

///|
/// Casts a `U6` to `T2` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6] U6::unsafe_as_t2(self : U6[T1, T2, T3, T4, T5, T6]) -> T2 = "%identity"

///|
/// Creates a `U6` from `T3`.
pub fn[T1, T2, T3, T4, T5, T6] U6::from_t3(obj : T3) -> U6[T1, T2, T3, T4, T5, T6] = "%identity"

///|
/// Casts a `U6` to `T3` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6] U6::unsafe_as_t3(self : U6[T1, T2, T3, T4, T5, T6]) -> T3 = "%identity"

///|
/// Creates a `U6` from `T4`.
pub fn[T1, T2, T3, T4, T5, T6] U6::from_t4(obj : T4) -> U6[T1, T2, T3, T4, T5, T6] = "%identity"

///|
/// Casts a `U6` to `T4` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6] U6::unsafe_as_t4(self : U6[T1, T2, T3, T4, T5, T6]) -> T4 = "%identity"

///|
/// Creates a `U6` from `T5`.
pub fn[T1, T2, T3, T4, T5, T6] U6::from_t5(obj : T5) -> U6[T1, T2, T3, T4, T5, T6] = "%identity"

///|
/// Casts a `U6` to `T5` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6] U6::unsafe_as_t5(self : U6[T1, T2, T3, T4, T5, T6]) -> T5 = "%identity"

///|
/// Creates a `U6` from `T6`.
pub fn[T1, T2, T3, T4, T5, T6] U6::from_t6(obj : T6) -> U6[T1, T2, T3, T4, T5, T6] = "%identity"

///|
/// Casts a `U6` to `T6` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6] U6::unsafe_as_t6(self : U6[T1, T2, T3, T4, T5, T6]) -> T6 = "%identity"

///|
/// Represents TypeScript union `T1 | T2 | T3 | T4 | T5 | T6 | T7`.
#external
type U7[T1, T2, T3, T4, T5, T6, T7]

///|
/// Creates a `U7` from `T1`.
pub fn[T1, T2, T3, T4, T5, T6, T7] U7::from_t1(obj : T1) -> U7[T1, T2, T3, T4, T5, T6, T7] = "%identity"

///|
/// Casts a `U7` to `T1` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7] U7::unsafe_as_t1(self : U7[T1, T2, T3, T4, T5, T6, T7]) -> T1 = "%identity"

///|
/// Creates a `U7` from `T2`.
pub fn[T1, T2, T3, T4, T5, T6, T7] U7::from_t2(obj : T2) -> U7[T1, T2, T3, T4, T5, T6, T7] = "%identity"

///|
/// Casts a `U7` to `T2` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7] U7::unsafe_as_t2(self : U7[T1, T2, T3, T4, T5, T6, T7]) -> T2 = "%identity"

///|
/// Creates a `U7` from `T3`.
pub fn[T1, T2, T3, T4, T5, T6, T7] U7::from_t3(obj : T3) -> U7[T1, T2, T3, T4, T5, T6, T7] = "%identity"

///|
/// Casts a `U7` to `T3` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7] U7::unsafe_as_t3(self : U7[T1, T2, T3, T4, T5, T6, T7]) -> T3 = "%identity"

///|
/// Creates a `U7` from `T4`.
pub fn[T1, T2, T3, T4, T5, T6, T7] U7::from_t4(obj : T4) -> U7[T1, T2, T3, T4, T5, T6, T7] = "%identity"

///|
/// Casts a `U7` to `T4` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7] U7::unsafe_as_t4(self : U7[T1, T2, T3, T4, T5, T6, T7]) -> T4 = "%identity"

///|
/// Creates a `U7` from `T5`.
pub fn[T1, T2, T3, T4, T5, T6, T7] U7::from_t5(obj : T5) -> U7[T1, T2, T3, T4, T5, T6, T7] = "%identity"

///|
/// Casts a `U7` to `T5` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7] U7::unsafe_as_t5(self : U7[T1, T2, T3, T4, T5, T6, T7]) -> T5 = "%identity"

///|
/// Creates a `U7` from `T6`.
pub fn[T1, T2, T3, T4, T5, T6, T7] U7::from_t6(obj : T6) -> U7[T1, T2, T3, T4, T5, T6, T7] = "%identity"

///|
/// Casts a `U7` to `T6` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7] U7::unsafe_as_t6(self : U7[T1, T2, T3, T4, T5, T6, T7]) -> T6 = "%identity"

///|
/// Creates a `U7` from `T7`.
pub fn[T1, T2, T3, T4, T5, T6, T7] U7::from_t7(obj : T7) -> U7[T1, T2, T3, T4, T5, T6, T7] = "%identity"

///|
/// Casts a `U7` to `T7` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7] U7::unsafe_as_t7(self : U7[T1, T2, T3, T4, T5, T6, T7]) -> T7 = "%identity"

///|
/// Represents TypeScript union `T1 | T2 | T3 | T4 | T5 | T6 | T7 | T8`.
#external
type U8[T1, T2, T3, T4, T5, T6, T7, T8]

///|
/// Creates a `U8` from `T1`.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8] U8::from_t1(obj : T1) -> U8[T1, T2, T3, T4, T5, T6, T7, T8] = "%identity"

///|
/// Casts a `U8` to `T1` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8] U8::unsafe_as_t1(self : U8[T1, T2, T3, T4, T5, T6, T7, T8]) -> T1 = "%identity"

///|
/// Creates a `U8` from `T2`.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8] U8::from_t2(obj : T2) -> U8[T1, T2, T3, T4, T5, T6, T7, T8] = "%identity"

///|
/// Casts a `U8` to `T2` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8] U8::unsafe_as_t2(self : U8[T1, T2, T3, T4, T5, T6, T7, T8]) -> T2 = "%identity"

///|
/// Creates a `U8` from `T3`.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8] U8::from_t3(obj : T3) -> U8[T1, T2, T3, T4, T5, T6, T7, T8] = "%identity"

///|
/// Casts a `U8` to `T3` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8] U8::unsafe_as_t3(self : U8[T1, T2, T3, T4, T5, T6, T7, T8]) -> T3 = "%identity"

///|
/// Creates a `U8` from `T4`.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8] U8::from_t4(obj : T4) -> U8[T1, T2, T3, T4, T5, T6, T7, T8] = "%identity"

///|
/// Casts a `U8` to `T4` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8] U8::unsafe_as_t4(self : U8[T1, T2, T3, T4, T5, T6, T7, T8]) -> T4 = "%identity"

///|
/// Creates a `U8` from `T5`.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8] U8::from_t5(obj : T5) -> U8[T1, T2, T3, T4, T5, T6, T7, T8] = "%identity"

///|
/// Casts a `U8` to `T5` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8] U8::unsafe_as_t5(self : U8[T1, T2, T3, T4, T5, T6, T7, T8]) -> T5 = "%identity"

///|
/// Creates a `U8` from `T6`.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8] U8::from_t6(obj : T6) -> U8[T1, T2, T3, T4, T5, T6, T7, T8] = "%identity"

///|
/// Casts a `U8` to `T6` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8] U8::unsafe_as_t6(self : U8[T1, T2, T3, T4, T5, T6, T7, T8]) -> T6 = "%identity"

///|
/// Creates a `U8` from `T7`.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8] U8::from_t7(obj : T7) -> U8[T1, T2, T3, T4, T5, T6, T7, T8] = "%identity"

///|
/// Casts a `U8` to `T7` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8] U8::unsafe_as_t7(self : U8[T1, T2, T3, T4, T5, T6, T7, T8]) -> T7 = "%identity"

///|
/// Creates a `U8` from `T8`.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8] U8::from_t8(obj : T8) -> U8[T1, T2, T3, T4, T5, T6, T7, T8] = "%identity"

///|
/// Casts a `U8` to `T8` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8] U8::unsafe_as_t8(self : U8[T1, T2, T3, T4, T5, T6, T7, T8]) -> T8 = "%identity"

///|
/// Represents TypeScript union `T1 | T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9`.
#external
type U9[T1, T2, T3, T4, T5, T6, T7, T8, T9]

///|
/// Creates a `U9` from `T1`.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8, T9] U9::from_t1(obj : T1) -> U9[T1, T2, T3, T4, T5, T6, T7, T8, T9] = "%identity"

///|
/// Casts a `U9` to `T1` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8, T9] U9::unsafe_as_t1(self : U9[T1, T2, T3, T4, T5, T6, T7, T8, T9]) -> T1 = "%identity"

///|
/// Creates a `U9` from `T2`.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8, T9] U9::from_t2(obj : T2) -> U9[T1, T2, T3, T4, T5, T6, T7, T8, T9] = "%identity"

///|
/// Casts a `U9` to `T2` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8, T9] U9::unsafe_as_t2(self : U9[T1, T2, T3, T4, T5, T6, T7, T8, T9]) -> T2 = "%identity"

///|
/// Creates a `U9` from `T3`.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8, T9] U9::from_t3(obj : T3) -> U9[T1, T2, T3, T4, T5, T6, T7, T8, T9] = "%identity"

///|
/// Casts a `U9` to `T3` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8, T9] U9::unsafe_as_t3(self : U9[T1, T2, T3, T4, T5, T6, T7, T8, T9]) -> T3 = "%identity"

///|
/// Creates a `U9` from `T4`.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8, T9] U9::from_t4(obj : T4) -> U9[T1, T2, T3, T4, T5, T6, T7, T8, T9] = "%identity"

///|
/// Casts a `U9` to `T4` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8, T9] U9::unsafe_as_t4(self : U9[T1, T2, T3, T4, T5, T6, T7, T8, T9]) -> T4 = "%identity"

///|
/// Creates a `U9` from `T5`.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8, T9] U9::from_t5(obj : T5) -> U9[T1, T2, T3, T4, T5, T6, T7, T8, T9] = "%identity"

///|
/// Casts a `U9` to `T5` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8, T9] U9::unsafe_as_t5(self : U9[T1, T2, T3, T4, T5, T6, T7, T8, T9]) -> T5 = "%identity"

///|
/// Creates a `U9` from `T6`.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8, T9] U9::from_t6(obj : T6) -> U9[T1, T2, T3, T4, T5, T6, T7, T8, T9] = "%identity"

///|
/// Casts a `U9` to `T6` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8, T9] U9::unsafe_as_t6(self : U9[T1, T2, T3, T4, T5, T6, T7, T8, T9]) -> T6 = "%identity"

///|
/// Creates a `U9` from `T7`.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8, T9] U9::from_t7(obj : T7) -> U9[T1, T2, T3, T4, T5, T6, T7, T8, T9] = "%identity"

///|
/// Casts a `U9` to `T7` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8, T9] U9::unsafe_as_t7(self : U9[T1, T2, T3, T4, T5, T6, T7, T8, T9]) -> T7 = "%identity"

///|
/// Creates a `U9` from `T8`.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8, T9] U9::from_t8(obj : T8) -> U9[T1, T2, T3, T4, T5, T6, T7, T8, T9] = "%identity"

///|
/// Casts a `U9` to `T8` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8, T9] U9::unsafe_as_t8(self : U9[T1, T2, T3, T4, T5, T6, T7, T8, T9]) -> T8 = "%identity"

///|
/// Creates a `U9` from `T9`.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8, T9] U9::from_t9(obj : T9) -> U9[T1, T2, T3, T4, T5, T6, T7, T8, T9] = "%identity"

///|
/// Casts a `U9` to `T9` without runtime check.
pub fn[T1, T2, T3, T4, T5, T6, T7, T8, T9] U9::unsafe_as_t9(self : U9[T1, T2, T3, T4, T5, T6, T7, T8, T9]) -> T9 = "%identity"
