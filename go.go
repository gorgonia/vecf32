// +build !avx,!sse

package vecf32

import "github.com/chewxy/math32"

func Add(a, b []float32) {
	for i, v := range a {
		a[i] = v + b[i]
	}
}

func Sub(a, b []float32) {
	for i, v := range a {
		a[i] = v - b[i]
	}
}

func Mul(a, b []float32) {
	for i, v := range a {
		a[i] = v * b[i]
	}
}

func Div(a, b []float32) {
	for i, v := range a {
		if b[i] == 0 {
			a[i] = math32.Inf(0)
			continue
		}

		a[i] = v / b[i]
	}
}

func Sqrt(a []float32) {
	for i, v := range a {
		a[i] = math32.Sqrt(v)
	}
}

func InvSqrt(a []float32) {
	for i, v := range a {
		a[i] = float32(1) / math32.Sqrt(v)
	}
}
