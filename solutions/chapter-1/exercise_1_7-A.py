# A version of the 1.17 problem where I needed to get better formatting

import math
import bitstring


def print_float_parts(number):
    if number == 0.0:
        sign = 0
        exponent = 0
        mantissa = 0
    else:
        # Get sign
        sign = -1 if math.copysign(1, number) < 0 else 1

        # Use frexp to get mantissa and exponent in base 2
        mantissa, exponent = math.frexp(number)

    print(f"Number: {number}")
    print(f"Sign: {sign}")
    print(f"Exponent: {exponent}")
    print(f"Mantissa: {mantissa}")
    print(f"N: {mantissa * 2**exponent}")
    print(f"N: {3513641.75}")


# Example usage
print_float_parts(25.75)


def square(x):
    return x * x


def good_enough(guess, x):
    return abs(square(guess) - x) < 0.001


def improve(guess, x):
    print(f"guess       = {bitstring.BitArray(float=guess, length=64).bin} | {guess:.20f}")
    print(f"x / guess   = {bitstring.BitArray(float=x / guess, length=64).bin} | {x / guess:.20f}")
    return average(guess, x / guess)


def average(x, y):
    print(f"(x + y)     = {bitstring.BitArray(float=(x + y), length=64).bin} | {(x + y):.20f}")
    print(f"(x + y) / 2 = {bitstring.BitArray(float=((x + y) / 2), length=64).bin} | {((x + y) / 2):.20f}")
    return (x + y) / 2


def sqrt_iter(guess, x, nth):
    print(f"| {nth} | {guess:.6f} | {improve(guess, x):.6f} | {square(guess) - x:.6f} | ")
    if good_enough(guess, x) or nth > 30:
        return guess
    else:
        return sqrt_iter(improve(guess, x), x, nth + 1)


def sqrt(x):
    print(f"\n(sqrt {x})")
    print("| iteration | guess | (improve guess x) | (- (square guess) x) |")
    print("| --------- | ----- | ----------------- | ------------------- |")
    return sqrt_iter(1.0, x, 0)


# Example usage:
sqrt(12345678901234)


print_float_parts(3513641.8288200637)

f1 = bitstring.BitArray(float=3513641.8288200637, length=32)
print(bitstring.BitArray(float=3513641.8288200637, length=32).bin)
print("01001010010101100111010010100111")

guess_string1 = "0100000101001010110011101001010011101010000101101100011010011110"
guess_float1 = bitstring.BitArray(bin=guess_string1).float
print(f"{guess_string1}  =>  {guess_float1:.30f}")


guess_string2 = "0100000101001010110011101001010011101010000101101100011010011101"
guess_float2 = bitstring.BitArray(bin=guess_string2).float
print(f"{guess_string2}  => {guess_float2:.30f}")
print(f"delta  => {guess_float1 - guess_float2:.30f}")
print(f"(square guess1))  => {guess_float1 * guess_float1:.30f}")
print(f"(square guess2))  => {guess_float2 * guess_float2:.30f}")
x = 12345678901234
print(f"x                 => {x}")
print(f"(- (square guess1) x)  => {(guess_float1 * guess_float1) - x:.30f}")
print(f"(- (square guess2) x)  => {(guess_float2 * guess_float2) - x:.30f}")


print(f"delta  =>  {(guess_float1 * guess_float1) - (guess_float2 * guess_float2):.30f}")

