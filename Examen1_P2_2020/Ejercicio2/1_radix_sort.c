#include <stdio.h>
 
int getMax(int arr[], int n) 
{
    int mx = arr[0];
    int i;
    for (i = 1; i < n; i++)
        if (arr[i] > mx)
            mx = arr[i];
    return mx;
}
 
void countSort(int arr[], int n, int exp) 
{
    int output[n]; // output array
    int i, count[10] = { 0 };
 
    // Store count of occurrences in count[]
    for (i = 0; i < n; i++)
        count[(arr[i] / exp) % 10]++;
 
    for (i = 1; i < 10; i++)
        count[i] += count[i - 1];
 
    // Build the output array
    for (i = n - 1; i >= 0; i--) {
        output[count[(arr[i] / exp) % 10] - 1] = arr[i];
        count[(arr[i] / exp) % 10]--;
    }
 
    for (i = 0; i < n; i++)
        arr[i] = output[i];
}
 
// The main function to that sorts arr[] of size n using Radix Sort
void radixsort(int arr[], int n) 
{
    int m = getMax(arr, n);
 
    for (int exp = 1; m / exp > 0; exp *= 10)
        countSort(arr, n, exp);
}
 
void print(int arr[], int n) 
{
    for (int i = 0; i < n; i++)
        printf("%d ", arr[i]);
    printf("\n");
}
 
int main() {
    int arr[] = { 74, 34, 227, 232, 4, 103, 181, 186, 192, 278, 142, 70, 13 };
    int n = sizeof(arr) / sizeof(arr[0]);
    radixsort(arr, n);
    printf("Sorted array: ");
    print(arr, n);
    return 0;
} 
