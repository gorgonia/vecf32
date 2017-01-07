package vecf32

import "github.com/chewxy/math32"

// Pow performs  a̅ ^ b̅ elementwise
func Pow(a, b []float32) {
	for i, v := range a {
		switch b[i] {
		case 0:
			a[i] = float32(1)
		case 1:
			a[i] = v
		case 2:
			a[i] = v * v
		case 3:
			a[i] = v * v * v
		default:
			a[i] = math32.Pow(v, b[i])
		}
	}
}

// TODO:Vectorize
func Scale(s float32, a []float32) {
	for i, v := range a {
		a[i] = v * s
	}
}

/// DivBy divides all numbers in the slice by a scalar
func DivBy(s float32, a []float32) {
	for i, v := range a {
		a[i] = s / v
	}
}

// Trans translates all thee numbers in the slice by a scalar (slice + scalar)
func Trans(s float32, a []float32) {
	for i, v := range a {
		a[i] = v + s
	}
}

// TransFrom translates all the numbers in a slice from a scalar (scalar - slice)
func TransFrom(s float32, a []float32) {
	for i, v := range a {
		a[i] = s - v
	}
}

// Power performs a^s elementwise
func Power(s float32, a []float32) {
	for i, v := range a {
		a[i] = math32.Pow(v, s)
	}
}

// PowerFrom performs s^a eleemntwise
func PowerFrom(s float32, a []float32) {
	for i, v := range a {
		a[i] = math32.Pow(s, v)
	}
}

// Max takes two slices, and compares them elementwise. The highest value is put into a
func Max(a, b []float32) {
	if len(a) != len(b) {
		panic("Index error")
	}

	a = a[:len(a)]
	b = b[:len(a)]

	for i, v := range a {
		bv := b[i]
		if bv > v {
			a[i] = bv
		}
	}
}

// Max takes two slices, and compares them elementwise. The lowest value is put into a
func Min(a, b []float32) {
	if len(a) != len(b) {
		panic("Index error")
	}

	a = a[:len(a)]
	b = b[:len(a)]

	for i, v := range a {
		bv := b[i]
		if bv < v {
			a[i] = bv
		}
	}
}

/* REDUCTION RELATED */

// Sum sums a slice of float32 and returns a float32
func Sum(a []float32) float32 {
	return Reduce(add, float32(0), a...)
}

// MaxOf finds the max of a []float32. it panics if the slice is empty
func MaxOf(a []float32) (retVal float32) {
	if len(a) < 1 {
		panic("Cannot find the max of an empty slice")
	}
	return Reduce(max, a[0], a[1:]...)
}

// MinOf finds the max of a []float32. it panics if the slice is empty
func MinOf(a []float32) (retVal float32) {
	if len(a) < 1 {
		panic("Cannot find the min of an empty slice")
	}
	return Reduce(min, a[0], a[1:]...)
}

// Argmax returns the index of the min in a slice
func Argmax(a []float32) int {
	var f float32
	var max int
	var set bool
	for i, v := range a {
		if !set {
			f = v
			max = i
			set = true

			continue
		}

		// TODO: Maybe error instead of this?
		if math32.IsNaN(v) || math32.IsInf(v, 1) {
			max = i
			f = v
			break
		}

		if v > f {
			max = i
			f = v
		}
	}
	return max
}

// Argmin returns the index of the min in a slice
func Argmin(a []float32) int {
	var f float32
	var min int
	var set bool
	for i, v := range a {
		if !set {
			f = v
			min = i
			set = true

			continue
		}

		// TODO: Maybe error instead of this?
		if math32.IsNaN(v) || math32.IsInf(v, -1) {
			min = i
			f = v
			break
		}

		if v < f {
			min = i
			f = v
		}
	}
	return min
}

/* FUNCTION VARIABLES */

var (
	add = func(a, b float32) float32 { return a + b }
	// sub = func(a, b float32) float32 { return a - b }
	// mul = func(a, b float32) float32 { return a * b }
	// div = func(a, b float32) float32 { return a / b }
	// mod = func(a, b float32) float32 { return math32.Mod(a, b) }

	min = func(a, b float32) float32 {
		if a < b {
			return a
		}
		return b
	}

	max = func(a, b float32) float32 {
		if a > b {
			return a
		}
		return b
	}
)
