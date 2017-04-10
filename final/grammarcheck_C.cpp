#include<bits/stdc++.h>
using namespace std;
int func1(string s);
int func(string s)
{
	if(s=="b")
		return 1;
	else if(s[s.length()-1]=='a')
		return func1(s.substr(0,s.length()-1));
	else
		return 0;
}
int func1(string s)
{
	if(s=="f")
		return 1;
	else if(s[s.length()-1]=='d')
		return func(s.substr(0,s.length()-1));
	else if(s[s.length()-1]=='c')
		return func1(s.substr(0,s.length()-1));
	else
		return 0;
}
int main()
{
	string s;
	cin>>s;
	int x = func(s);
	if(x==1)
		cout<<"True\n";
	else
		cout<<"False\n";
	return 0;
}