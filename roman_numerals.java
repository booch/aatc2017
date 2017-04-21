import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;

import java.util.*;

public class RomanNumeral {

    private int input;

    private Map<Integer, String> relation;

    public RomanNumeral(int input) {
        this.input = input;
        relation = relation();
    }

    public String getRomanNumeral() {

        int length = String.valueOf(input).length();

        int aux = input;
        Multimap<Integer, Integer> map = HashMultimap.create();
        int multiplier = 1;
        for (int i = 0; i < length; i++) {
            int rem = aux % 10;
            aux = aux / 10;
            if (rem != 0) {
                map.put(rem, multiplier);
            }
            multiplier *= 10;
        }

        List<Integer> list = new ArrayList<>();
        for (Map.Entry<Integer, Integer> entry : map.entries()) {
            list.add(entry.getKey() * entry.getValue());
            System.out.println(entry.getKey() * entry.getValue());
        }
        list.sort((o1, o2) -> o2 - o1);
        return calculateRoman(list);
    }

    private String calculateRoman(List<Integer> list) {
        StringBuilder sb = new StringBuilder();
        for (Integer i : list) {
            sb.append(relation.get(i));
        }
        return sb.toString();
    }

    private Map<Integer, String> relation() {
        Map<Integer, String> map = new HashMap<>();
        int i = 1;
        while (i <= 3000) {
            do {
                switch (i) {
                    case 1:
                        map.put(i, "I");
                        break;
                    case 2:
                        map.put(i, "II");
                        break;
                    case 3:
                        map.put(i, "III");
                        break;
                    case 4:
                        map.put(i, "IV");
                        break;
                    case 5:
                        map.put(i, "V");
                        break;
                    case 6:
                        map.put(i, "VI");
                        break;
                    case 7:
                        map.put(i, "VII");
                        break;
                    case 8:
                        map.put(i, "VIII");
                        break;
                    case 9:
                        map.put(i, "IX");
                        break;
                }
                i++;
            } while (i < 10);
            do {
                switch (i) {
                    case 10:
                        map.put(i, "X");
                        break;
                    case 20:
                        map.put(i, "XX");
                        break;
                    case 30:
                        map.put(i, "XXX");
                        break;
                    case 40:
                        map.put(i, "XL");
                        break;
                    case 50:
                        map.put(i, "L");
                        break;
                    case 60:
                        map.put(i, "LX");
                        break;
                    case 70:
                        map.put(i, "LXX");
                        break;
                    case 80:
                        map.put(i, "LXXX");
                        break;
                    case 90:
                        map.put(i, "XC");
                        break;
                }
                i += 10;
            } while (i < 100);
            do {
                switch (i) {
                    case 100:
                        map.put(i, "C");
                        break;
                    case 200:
                        map.put(i, "CC");
                        break;
                    case 300:
                        map.put(i, "CCC");
                        break;
                    case 400:
                        map.put(i, "CD");
                        break;
                    case 500:
                        map.put(i, "D");
                        break;
                    case 600:
                        map.put(i, "DC");
                        break;
                    case 700:
                        map.put(i, "DCC");
                        break;
                    case 800:
                        map.put(i, "DCCC");
                        break;
                    case 900:
                        map.put(i, "CM");
                        break;
                }
                i += 100;
            } while (i < 1000);
            do {
                switch (i) {
                    case 1000:
                        map.put(i, "M");
                        break;
                    case 2000:
                        map.put(i, "MM");
                        break;
                    case 3000:
                        map.put(i, "MMM");
                        break;
                }
                i += 1000;
            } while (i < 4000);
        }
        return map;
    }
}
