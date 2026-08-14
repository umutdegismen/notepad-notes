
	Map<String,String> mapSample = new LinkedHashMap<>();
	mapSample.put("key1","value2");
	mapSample.put("key2","value2");
	mapSample.put("key3","value3");
	mapSample.put("key4","value4");
	
	// Sadece "key"leri almak icin "keySet()" metodu kullanip "Set<String>" olusturuyoruz
	Set<String> keys = mapSample.keySet();
	
	// Sadece "value" lari almak icin "values()" metodu kullanip "Collection<String>" olusturuyoruz
	Collection<String> values = mapSample.values();
	
	// Key-Value pair seklinde almak icin "entrySet()" metodu kulanip "Entry<String,String>" olusturuyoruz.
	Set<Entry<String,String>> entries = mapSample.entrySet<>();
	
	// 2 sekilde iterate edebiliriz
		
		// 1. "Set<Entry<Object,Object>>" olusturup, for loop ile donerek "getKey()" - "getValue()" metodlari ile "key-value" pair cekeriz.
		// 2. "Set<Object" olusturup, set icinde for loop ile donerek elde ettigimiz "key"i, map'imize parametre olarak verip value cekeriz.
		//    Bu sekilde de key+value pair elde etmis oluruz.\
		
	// 1st way Ornek:
		
		// "PAIR" olarak almak icin "ENTRY" kullanacagiz
		Set<Entry<String,String>> entries = dictionaryMap.entrySet();
		
		// now we can iterate the map
		for(Entry<String,String> pair: entries) {
			String key = pair.getKey();			// key
			String value = pair.getValue();		// value
			System.out.println(key + " -> " + value); 
		}
	
	// 2nd way Ornek:
	
		// get(object) metodu ile de entrySet kullanmadan da key verip value alarak pair'leri cekebiliriz
		Set<String> keys = dictionaryMap.keySet(); 	// I got the "key"
		for (String k : keys) {
			String value = dictionaryMap.get(k);	// provide the key - get the value
			System.out.println(k + " -> " + value);
		}
		
	
	