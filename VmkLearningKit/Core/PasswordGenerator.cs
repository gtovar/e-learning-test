using System;

namespace VmkLearningKit.Core
{
    public class PasswordGenetrator
    {
        private static Random RandomGenerator = new Random();

        private static string[] Characters = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", 
                                        "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", 
                                        "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", 
                                        "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", 
                                        "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", 
                                        "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" };

        public PasswordGenetrator()
        {
        }

        public static string Generate(int length)
        {
            string result = String.Empty;

            for (int i = 0; i < length; i++)
            {
                result += Characters[RandomGenerator.Next(0, Characters.Length)];
            }

            return result;
        }
    }
}