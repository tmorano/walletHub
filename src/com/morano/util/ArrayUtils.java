package com.morano.util;

public class ArrayUtils {

    /**
     * Find complementary k given int Array.
     *
     * @param k
     *            the k
     * @param A
     *            the array
     * @return the int
     */
    public int findComplementary(int k, int[] A) {
	int count = 0;
	for (int i = 0; i < A.length; i++) {
	    for (int j = i; j < A.length; j++) {
		if (A[i] + A[j] == k) {
		    if (i != j) {
			count += 2;
		    } else {
			count++;
		    }
		}
	    }
	}
	return count;

    }

}
