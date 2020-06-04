package vecf32

import "testing"

func goSum(a []float32) (retVal float32) {
	for _, v := range a {
		retVal += v
	}
	return
}

func BenchmarkSum(b *testing.B) {
	x := Range(0, niceprime)
	var v float32
	for n := 0; n < b.N; n++ {
		v = Sum(x)
	}
	_ = v
}

func BenchmarkGoSum(b *testing.B) {
	x := Range(0, niceprime)
	var v float32
	for n := 0; n < b.N; n++ {
		v = goSum(x)
	}
	_ = v
}
