#include <iostream>
#include <vector>

using namespace std;

// Big Numbers are represented as vectors with most significant digit at the end
struct Solver { // I do not care about private stuff this is a quick solve ok
    vector<int> arr = {1};

    void standardize() {
        int carry = 0;
        for (int i = 0; i < arr.size() - 1; ++i) {
            carry = arr[i] / 10;
            arr[i] = arr[i] % 10;
            arr[i+1] += carry;
        }
        // End Case Handling
        carry = arr[arr.size()-1] / 10;
        arr[arr.size()-1] = arr[arr.size()-1] % 10;
        if (carry != 0) { arr.emplace_back(carry); }
    }

    void doubleNum() {
        for (int& i : arr) { i *= 2; }
        standardize();
    }

    void getDigitSum() {
        int sum = 0;
        for (int i : arr) { sum += i; }
        cout << sum << endl;
    }
};

ostream& operator<<(ostream& out, Solver a) {
        for (auto i = a.arr.rbegin(); i != a.arr.rend(); i++) {
            out << *i;
        }
        return out;
    }

int main() {
    Solver a; 
    for( int i = 0; i < 1000; ++i) { a.doubleNum(); }
    cout << a << endl;
    a.getDigitSum();
};