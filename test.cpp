#include <bits/stdc++.h>
using namespace std;

#define int long long
int n;

int fib(int x){
	if (x<=2) return x;
	return fib(x-1)+fib(x-2);
}

signed main(){

	cin >> n;
	cout << fib(n);

	return 0;
}