package vecf32

import "github.com/chewxy/math32"

func TanhRecv(a, retVal []float32) {
	retVal = retVal[:len(a)]
	for i, v := range a {
		retVal[i] = math32.Tanh(v)
	}
}

func Tanh(a []float32) {
	for i, v := range a {
		a[i] = math32.Tanh(v)
	}
}

func ExpRecv(a, retVal []float32) {
	retVal = retVal[:len(a)]
	for i, v := range a {
		retVal[i] = math32.Exp(v)
	}
}

func Exp(a []float32) {
	for i, v := range a {
		a[i] = math32.Exp(v)
	}
}

func LogRecv(a, retVal []float32) {
	retVal = retVal[:len(a)]
	for i, v := range a {
		retVal[i] = math32.Log(v)
	}
}

func Log(a []float32) {
	for i, v := range a {
		a[i] = math32.Log(v)
	}
}
