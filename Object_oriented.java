import java.util.Scanner;

class MaximumProductCalculator {
    private int[] nums;

    // Constructor to initialize the array
    public MaximumProductCalculator(int[] nums) {
        this.nums = nums;
    }

    // Method to calculate the maximum product of three numbers
    public int calculateMaximumProduct() {
        int min1 = Integer.MAX_VALUE, min2 = Integer.MAX_VALUE;
        int max1 = Integer.MIN_VALUE, max2 = Integer.MIN_VALUE, max3 = Integer.MIN_VALUE;

        for (int n : nums) {
            // Update the largest three values
            if (n > max3) {
                if (n > max2) {
                    max3 = max2;
                    if (n > max1) {
                        max2 = max1;
                        max1 = n;
                    } else {
                        max2 = n;
                    }
                } else {
                    max3 = n;
                }
            }

            // Update the smallest two values
            if (n < min2) {
                if (n < min1) {
                    min2 = min1;
                    min1 = n;
                } else {
                    min2 = n;
                }
            }
        }

        return Math.max(max1 * max2 * max3, max1 * min1 * min2);
    }
}

public class Object_oriented {
    public static void main(String[] args) {
        // Input handling
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the size of the array:");
        int size = scanner.nextInt();
        int[] nums = new int[size];

        System.out.print("Enter the elements of the array:");
        for (int i = 0; i < size; i++) {
            nums[i] = scanner.nextInt();
        }

        // Create an object of MaximumProductCalculator
        MaximumProductCalculator calculator = new MaximumProductCalculator(nums);

        // Calculate and display the result
        int result = calculator.calculateMaximumProduct();
        System.out.println("Maximum product of three numbers is: " + result);

        scanner.close();
    }
}
