//I would do it with something fancy like a list comprehension
//but... idk, java doesn't seem the best... for it...
class Q001 {
  public static void main(String[] args) {
    int sum = 0;
    for (int i = 0; i < 1000; i++) {
      if (i % 3 == 0 || i % 5 == 0) sum += i;
    }
    System.out.println("Solution: " + sum);
  }
}