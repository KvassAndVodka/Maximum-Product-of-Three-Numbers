#include <iostream>
#include <vector>
#include <climits> // For INT_MIN and INT_MAX
#include <algorithm> // For max function

// Function to calculate the maximum product of three numbers
int maximumProduct(std::vector<int>& nums) {
    int min1 = INT_MAX, min2 = INT_MAX;
    int max1 = INT_MIN, max2 = INT_MIN, max3 = INT_MIN;

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

    return std::max(max1 * max2 * max3, max1 * min1 * min2);
}

int main() {
    size_t n;  // Use size_t for the number of elements

    std::cout << "Enter the number of elements: ";
    std::cin >> n;

    if (n == 0) {
        std::cerr << "The number of elements must be greater than zero!" << std::endl;
        return 1; // Exit with an error code
    }

    std::vector<int> nums(n);

    std::cout << "Enter the elements: ";
    for (size_t i = 0; i < n; ++i) {
        std::cin >> nums[i];
    }

    // Calculate and display the result
    int result = maximumProduct(nums);
    std::cout << "Maximum product is: " << result << std::endl;

    return 0;
}
