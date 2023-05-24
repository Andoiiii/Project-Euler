//i was thinking to something with palindrome generation, but then i realized
//it would be hard to grab a SPECIFIC set of divisiors - only prime factorization is ez
//so... we are going to do it the other way around.

//for reversing array
import java.util.*;

public class Q004 {
  public static boolean isPalindrome(Integer n) {
    String[] test = n.toString().split("");
    String[] reverse = new String[test.length];
    System.arraycopy(test, 0, reverse, 0, test.length); //hardcopy 
    Collections.reverse(Arrays.asList(reverse)); //so reverse can act on a seperate instance

    return (String.join("",test)).equals(String.join("",reverse));
  }

  public static void main(String[] args) {
    int max = -1;
    for (int i = 100; i < 1000; i++) {
      for (int j = 100; j < 1000; j++) {
        if (isPalindrome(i*j)) { 
          System.out.println(i + " * " + j + " = " + i*j + " is a Palindrome"); 
          max = Math.max(i*j, max);
        } 
      }
    }
    System.out.println("Biggest: " + max);
  }
}
