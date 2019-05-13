/*
 * CS:APP Data Lab
 *
 * <Please put your name and userid here>
 *
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:

  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code
  must conform to the following style:

  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>

  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.


  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting if the shift amount
     is less than 0 or greater than 31.


EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implement floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants. You can use any arithmetic,
logical, or comparison operations on int or unsigned data.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to
     check the legality of your solutions.
  2. Each function has a maximum number of operations (integer, logical,
     or comparison) that you are allowed to use for your implementation
     of the function.  The max operator count is checked by dlc.
     Note that assignment ('=') is not counted; you may use as many of
     these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 *
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce
 *      the correct answers.
 */


#endif
//1
/*
 * bitXor - x^y using only ~ and &
 *   Example: bitXor(4, 5) = 1
 *   Legal ops: ~ &
 *   Max ops: 14
 *   Rating: 1
 */
int bitXor(int x, int y) {
/*
 * x^y  = (x & ~y) | (~x & y)
 *      = ~(~(x & ~y) & (~x & y))
 */
  return ~(~(x & ~y) & ~(~x & y));
}
/*
 * tmin - return minimum two's complement integer
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 4
 *   Rating: 1
 */
int tmin(void) {
  return (1 << 31);
}
//2
/*
 * isTmax - returns 1 if x is the maximum, two's complement number,
 *     and 0 otherwise
 *   Legal ops: ! ~ & ^ | +
 *   Max ops: 10
 *   Rating: 1
 */
int isTmax(int x) {
/*
 * if x is Tmax(0x7fffffff)
 *  -> x+1              - 0x80000000
 *  -> ~(x+1)           - 0x7fffffff
 *  -> (x ^ (~(x+1)))   - 0
 *
 * however, if x is 0xffffffff
 *  -> x+1              - 0x0
 *  -> ~(x+1)           - 0xffffffff
 *  -> (x ^ (~(x+1)))   - 0
 *
 *  so we need to exclude 0xffffffff
 *
 *  when x is 0xffffffff
 *  ~x      - 0x0
 *  !(~x)   - 0x1
 *
 *  Summary
 *  - x is 0x7fffffff
 *      - (x ^ (~(x+1)))                - 0
 *      - !(~x)                         - 0
 *      - !((x ^ (~(x+1))) | (!(~x)))   - 1
 *  - x is 0xffffffff
 *      - (x ^ (~(x+1)))                - 0
 *      - !(~x)                         - 1
 *      - !((x ^ (~(x+1))) | (!(~x)))   - 0
 *  - others
 *      - (x ^ (~(x+1)))                - 1
 *      - !((x ^ (~(x+1))) | (!(~x)))   - 0
 *
 *  only x == 0x7fffffff, isTmax return 1
 */

  return !((x ^ (~(x+1))) | (!(~x)));
}
/*
 * allOddBits - return 1 if all odd-numbered bits in word set to 1
 *   where bits are numbered from 0 (least significant) to 31 (most significant)
 *   Examples allOddBits(0xFFFFFFFD) = 0, allOddBits(0xAAAAAAAA) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 2
 */
int allOddBits(int x) {
    /*
     * (x & 0xaa) ^ 0xaa        - if x low 8 odd digits is 1, return 1
     * ((x>>8) 0xaa) ^ 0xaa     - if x 9~16 odd digits is 1, return 1
     * ((x>>16) 0xaa) ^ 0xaa    - if x 17~24 odd digits is 1, return 1
     * ((x>>24) 0xaa) ^ 0xaa    - if x 25~32 odd digits is 1, return 1
     */
    return !((x & (x>>8) & (x>>16) & (x>>24) & 0xaa) ^ 0xaa);
}
/*
 * negate - return -x
 *   Example: negate(1) = -1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 *   Rating: 2
 */
int negate(int x) {
  return ~x+1;
}
//3
/*
 * isAsciiDigit - return 1 if 0x30 <= x <= 0x39 (ASCII codes for characters '0' to '9')
 *   Example: isAsciiDigit(0x35) = 1.
 *            isAsciiDigit(0x3a) = 0.
 *            isAsciiDigit(0x05) = 0.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 3
 */
int isAsciiDigit(int x) {
/*
 * '0' to '9' - 0x30 - 0x39
 * !(x>>8)                  - high 26 bits are 0
 * !((x&0x30)^0x30)         - 5th and 6th digits are 1
 * (!(x&(0x8)) | !(x&0x6))  - 4th digit is 0 or 1st and 2nd are 0
 */
  return (!(x>>6)) & !((x&0x30)^0x30) & (!(x&(0x8)) | !(x&0x6));
}
/*
 * conditional - same as x ? y : z
 *   Example: conditional(2,4,5) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 3
 */
int conditional(int x, int y, int z) {
/*
 * 1. x = !!x
 *          - if x is not 0, then x will be 1
 * 2. x = ~x+1
 *          - ~1 equals to 0xfffffffe and ~0 equals to 0xffffffff
 *          - ~1+1 - 0xffffffff
 *          - ~0+1 - 0x00000000
 *          - 1 - 0xffffffff
 *          - 0 - 0x00000000
 * combinate step 1 and 2, if x is not 0, then x will be 0xffffffff;
 */
    x = (!!x);
    x = ~x+1;
    return (x & y) | (~x & z);
}
/*
 * isLessOrEqual - if x <= y  then return 1, else return 0
 *   Example: isLessOrEqual(4,5) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isLessOrEqual(int x, int y) {
/*
 * neg - negative number
 * pos - positive number
 * xmy - result of x minus y
 * return 1 when
 *  - x equals to y                         - !(x^y)
 *  - x is neg and y is pos                 - xn_yp
 *  - x is neg and y is neg and xmy is neg  - xn_yn
 *  - x is pos and y is pos and xmy is neg  - xp_yp
 *
 *  In this way, I don't need to consider negative and positive overflow
 */
  int x_sign = (x>>31)&0x1;
  int y_sign = (y>>31)&0x1;
  int xmy_sign = ((x+(~y+1))>>31)&0x1;

  int eq = (!(x^y));
  int xn_yp = (x_sign & (!y_sign));
  int xn_yn = (x_sign & y_sign & xmy_sign);
  int xp_yp = ((!x_sign) & (!y_sign) & xmy_sign);
  return (eq | xn_yp | xn_yn | xp_yp);
}
//4
/*
 * logicalNeg - implement the ! operator, using all of
 *              the legal operators except !
 *   Examples: logicalNeg(3) = 0, logicalNeg(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 4
 */
int logicalNeg(int x) {
/*
 * return 0 - when neg is 0 and pos is 0
 * when x is neg                - neg return 0
 * when x is pos and x is not 0 - pos return 0
 * when x is 0                  - neg retrun 1 and pos return 1
 */
  int neg = ((x>>31)&0x1)^0x1;
  int pos = (((~x+1)>>31)&0x1)^0x1;
  return neg & pos;
}
/* howManyBits - return the minimum number of bits required to represent x in
 *             two's complement
 *  Examples: howManyBits(12) = 5
 *            howManyBits(298) = 10
 *            howManyBits(-5) = 4
 *            howManyBits(0)  = 1
 *            howManyBits(-1) = 1
 *            howManyBits(0x80000000) = 32
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 90
 *  Rating: 4
 */
int howManyBits(int x) {
/*
 * It's just like binary search.
 * First, we need preprocess.
 * then we test if high 16 digits is not 0:
 *      - if not 0, then shift16 will be 16, and x will be itself's low 16 bits.
 *      - if is, do nothing;
 * then we test rest 16 bits;
 *
 * http://sworduo.net/2019/03/07/CSAPP-lab1/
 */
  int sign, shift16, shift8, shift4, shift2, shift1, shift0;
  sign = x>>31;
  x = (sign & ~x) | (~sign & x);
  shift16 = (!!(x>>16))<<4;
  x = x >> shift16;
  shift8 = (!!(x>>8))<<3;
  x = x >> shift8;
  shift4 = (!!(x>>4))<<2;
  x = x >> shift4;
  shift2 = (!!(x>>2))<<1;
  x = x >> shift2;
  shift1 = (!!(x>>1));
  x = x >> shift1;
  shift0 = (!!x);
  return shift16 + shift8 + shift4 + shift2 + shift1 + shift0 + 1;
}
//float
/*
 * floatScale2 - Return bit-level equivalent of expression 2*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned floatScale2(unsigned uf) {
/*      sign(1)     exp(8)         frac(23)
 *      x        | xxxx xxxx | xxx xxxx xxxx xxxx xxxx xxxx
 */
  unsigned sign = uf&(1<<31);
  unsigned exp = (uf>>23)&0xff;
  unsigned frac = uf&0x007fffff;
  // NAN and Infinity and 0
  if (exp == 0xff || uf == 0 || uf == (1<<31)) {
    return uf;
  }
  // others
  if (exp == 0 && frac != 0) {
    frac = frac<<1;
  } else {
    exp = exp+1;
  }

  return (sign | (exp<<23) | frac);
}
/*
 * floatFloat2Int - Return bit-level equivalent of expression (int) f
 *   for floating point argument f.
 *   Argument is passed as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point value.
 *   Anything out of range (including NaN and infinity) should return
 *   0x80000000u.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
int floatFloat2Int(unsigned uf) {
  unsigned sign, exp, res;
  sign = (uf>>31)&1;
  exp = (uf>>23)&0xff;
  res = (uf&0x007fffff) | (1<<23);

  if (exp <= 126) {
    res = 0; // zero overflow
  } else if (exp <= 150) {
    res = res >> (150-exp);
  } else if (exp <= 159) {
    res = res << (159-exp);
  } else {
    return 0x80000000u; // out of range
  }

  if (sign) {
    res = ~res+1;  
  }

  return res;
}
/*
 * floatPower2 - Return bit-level equivalent of the expression 2.0^x
 *   (2.0 raised to the power x) for any 32-bit integer x.
 *
 *   The unsigned value that is returned should have the identical bit
 *   representation as the single-precision floating-point number 2.0^x.
 *   If the result is too small to be represented as a denorm, return
 *   0. If too large, return +INF.
 *
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. Also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned floatPower2(int x) {
    if (x < -126) {
        return 0; // too small;
    } else if (x > 127) {
        return 0x7f800000; // to large;
    }

    return (x+127)<<23;
}
