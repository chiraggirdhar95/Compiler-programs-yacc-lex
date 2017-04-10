#include<bits/stdc++.h>
using namespace std;

string production[100];
vector<char> first[100];
vector<char> follow[100];
vector<char> First[100];
vector<char> Follow[100];
map<char,bool> nonTerminals;
map<char,bool> nonTerminals2;

bool visited[100];
bool visited2[100];
bool epsilon[100];

bool isNonterminal(char a)
{
	return a >= 'A' && a <= 'Z';
}

vector<char> dummy;
vector<char> calFirst(char a)
{
	if(visited[a-'A'] == true)
	    return dummy;
	for(int i=0;i<first[a-'A'].size();++i){
		if(isNonterminal(first[a-'A'][i])){
			if(first[a-'A'][i] != a){
			
				vector<char> ans = calFirst(first[a-'A'][i]);
				for(int j=0;j<ans.size();++j)
				    First[a-'A'].push_back(ans[j]);
		    }
		    
		    if(epsilon[first[a-'A'][i]] == true){
		    	vector<char> ans = calFirst(follow[first[a-'A'][i]][0]);
				for(int j=0;j<ans.size();++j)
				    First[a-'A'].push_back(ans[j]);
		    }
		}
		else{
			First[a-'A'].push_back(first[a-'A'][i]);
		}
	}
	
	visited[a-'A'] = true;
	return First[a-'A'];
}

vector<char> calFollow(char a)
{
	if(visited2[a-'A'] == true)
	    return dummy;
	for(int i=0;i<follow[a-'A'].size();++i){
		vector<char> ans = calFirst(follow[a-'A'][i]);
		for(int j=0;j<ans.size();++j){
			Follow[a-'A'].push_back(ans[j]);
		}
	}
	
	visited2[a-'A'] = true;
	return Follow[a-'A'];
}

int main(){
	int n;
	
	printf("Enter the no of productions: ");
	scanf("%d",&n);
	
	
	for(int i=0;i<n;++i)
	    cin>>production[i];
	    
    for(int i=0;i<n;++i){
    	char nonTer = production[i][0];
    	nonTerminals[nonTer] = true;
    	first[nonTer-'A'].push_back(production[i][2]);
    	if(production[i][2] == '#')
    	    epsilon[nonTer-'A'] = true;
    	for(int j=2;j<production[i].size()-1;++j){
    		follow[production[i][j]].push_back(production[i][j+1]);
    		if(isNonterminal(production[i][j]))
    		    nonTerminals2[production[i][j]] = true;
    	}
    }
    
    map<char,bool>::iterator it;
    
    for(it = nonTerminals.begin();it != nonTerminals.end(); ++it){
    	calFirst(it->first);
    	printf("First of %c = {",it->first);
    	for(int i=0;i<First[it->first - 'A'].size();++i){
    		printf("\'%c\',",First[it->first - 'A'][i]);
    	}
    	printf("}\n");
    }
    
    /*for(it = nonTerminals2.begin();it != nonTerminals2.end(); ++it){
    	calFollow(it->first);
    	printf("Follow of %c = {",it->first);
    	for(int i=0;i<First[it->first - 'A'].size();++i){
    		printf("\'%c\',",Follow[it->first - 'A'][i]);
    	}
    	printf("}");
    }*/
    return 0;
}
