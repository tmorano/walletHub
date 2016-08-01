package com.morano.util;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class FileUtils {

    public static List<Entry<String, Integer>> findMostFrequent(String localPath, String fileName) {
	Path path = Paths.get(localPath, fileName);
	Map<String, Integer> words = new HashMap<>();
	try (Stream<String> lines = Files.lines(path, StandardCharsets.UTF_8)) {
	    for (String line : (Iterable<String>) lines::iterator) {
		String[] phrasesInLine = line.split("\\|");
		for (int i = 0; i < phrasesInLine.length; i++) {
		    for (String eachPhrase : phrasesInLine) {
			if (!words.containsKey(eachPhrase)) {
			    words.put(eachPhrase, 1);
			} else {
			    words.put(eachPhrase, (words.get(eachPhrase) + 1));
			}
		    }
		}

	    }

	} catch (Exception e) {
	    System.out.println("Error while reading file");
	    e.printStackTrace();
	}
	List<Map.Entry<String, Integer>> entries = new ArrayList<>(words.entrySet());
	Collections.sort(entries, (e1, e2) -> Integer.compare(e2.getValue(), e1.getValue()));
	return entries.stream().limit(100000).collect(Collectors.toList());
    }

}
