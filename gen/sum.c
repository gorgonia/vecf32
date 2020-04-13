void sum(float a[], int len, float* retVal) {
	float acc = 0.0;
	for (int i = 0 ; i < len; i++){
		acc += a[i];
	}
	*retVal = acc;
}
