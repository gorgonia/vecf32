// +build !noasm
// +build sse avx

package vecf32

import "unsafe"

//go:noescape
func sum(a []float32, retVal unsafe.Pointer)

// Sum sums a slice of float32 and returns a float32
func Sum(a []float32) float32 {
	var retVal float32
	sum(a, unsafe.Pointer(&retVal))
	return retVal
}
