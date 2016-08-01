package com.morano.util;

public class StringUtils {

    /**
     * Checks if String is palindrome.
     *
     * @param word
     *            the word
     * @return true, if is palindrome
     */
    public boolean isPalindrom(String word) {
	boolean isPalidrom = false;
	if (word == null) {
	    return isPalidrom;
	} else if (word.length() == 1) {
	    isPalidrom = true;
	} else {
	    String reverse = new StringBuffer(word).reverse().toString();
	    if (reverse.equalsIgnoreCase(word)) {
		isPalidrom = true;
	    }
	}

	return isPalidrom;

    }

}
