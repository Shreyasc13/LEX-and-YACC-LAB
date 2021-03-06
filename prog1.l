%option noyywrap
%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
	int num=0,op=0,i=0, top=-1;
	char stack[10], opr[10];
	int number[10];
%}

%%
[0-9]+ {number[num++]=atoi(yytext);}
"+" {opr[op++]='+';}
"*" {opr[op++]='*';}
"(" {stack[++top]= '(';}
")" {
	if(stack[top]=='(' && top!=-1)
	{
        top--;
	}
	else
	{ 
	printf("invalid expression");
	   exit(0);
	}
}
. ;
%%
int main()
{
	printf("Enter expression: ");
	yylex();
	if(top==-1&& num==op+1)
{
	printf("Valid expression\n");
	printf("Number of identifier: =%d\n",num);
	printf("The identifiers present are: \n");
	for(i=0;i<num;i++)
	{
	printf("%d\t", number[i]);
	}
	printf("\n",op);
	printf("Number of operators: %d\n",op);
	printf("The operators present are: \n");
	for(i=0;i<op;i++)
	{
	printf("%c\t", opr[i]);
	}

}
	else 
	{
	printf("inavlid exp");
	}
	return 0;
}