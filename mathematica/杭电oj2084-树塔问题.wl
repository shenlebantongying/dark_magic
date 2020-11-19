(* ::Package:: *)

\:6709\:5982\:4e0b\:6240\:793a\:7684\:6570\:5854\:ff0c\:8981\:6c42\:4ece\:9876\:5c42\:8d70\:5230\:5e95\:5c42\:ff0c\:82e5\:6bcf\:4e00\:6b65\:53ea\:80fd\:8d70\:5230\:76f8\:90bb\:7684\:7ed3\:70b9\:ff0c\:5219\:7ecf\:8fc7\:7684\:7ed3\:70b9\:7684\:6570\:5b57\:4e4b\:548c\:6700\:5927\:662f\:591a\:5c11\:ff1f
Input
7
3 8
8 1 0
2 7 4 4
4 5 2 6 5
Output
30


reduce[data_]:=Replace[(Table[{#[[i]],#[[i+1]]},{i,1,Length[#]-1}])&[data],
                        {a_,b_}:>If[a>b,a,b],
                        2]


What is reduce?
reduce[{4,5,2,6,5}] => {5,5,6,6}
It compare {4,5} {5,2} {2,6} and {6,5} => 5,5,6,6.


(*\:5faa\:73af\:505a\:6cd5*)
data={{7},{3,8},{8,1,0},{2,7,4,4},{4,5,2,6,5}}
For[i=Length[data],i>=1,i--,data[[i-1]]=reduce[data[[i]]]+data[[i-1]]]
Print[data]


(*\:9012\:5f52\:505a\:6cd5*)
data={{7},{3,8},{8,1,0},{2,7,4,4},{4,5,2,6,5}}
decline[data_]:=If[Length[data]!=1,
	last=Length[data];
	data[[last-1]]=reduce[data[[last]]]+data[[last-1]];
	data=Drop[data,-1];
	decline[data]
]
SetAttributes[decline,HoldFirst]
decline[data]
Print[data]


$CharacterEncoding
