using System;
using System.Text;

public static class RomanNumerals
{
    public static string[][] RomanTable = new string[][] {
        new string[] {"I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"} ,
        new string[] {"X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"} ,
        new string[] {"C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"} ,
        new string[] {"M", "MM", "MMM"}
    };

    public static string ToRoman (this int arabic)
    {
        StringBuilder result = new StringBuilder();

        if(arabic > 3999 || arabic < 1)
        {
            return result.ToString();
        }
        if(arabic >= 1000)
        {
            result.Append(RomanTable[3][arabic / 1000 - 1]);
            arabic %= 1000;
        }
        if(arabic >= 100)
        {
            result.Append(RomanTable[2][arabic / 100 - 1]);
            arabic %= 100;
        }
        if(arabic >= 10)
        {
            result.Append(RomanTable[1][arabic / 10 - 1]);
            arabic %= 10;
        }
        if(arabic >= 1)
        {
            result.Append(RomanTable[0][arabic - 1]);
        }

        return result.ToString();
    }

}
