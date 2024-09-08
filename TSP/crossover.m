function [f1 , f2]=crossover(v1,v2)

%f1 and f2 are the offspring individuals
%v1 and v2 are the parents selected for crossover
%one-point crossover

%choose a point where the crossover will occur
N=length(v1);
t=randi([1, (N-1)]); %crossover point

%since cities cannot be repeated, choose:
%for f1, the first t cities from v1 and the remaining from v2 in order
f1(1:t)=v1(1:t); 
v22=setdiff(v2,f1,'stable');
f1((t+1):N)=v22;

%for f2, the first t cities from v2 and the remaining from v1 in order
f2(1:t)=v2(1:t);
v11=setdiff(v1,f2,'stable');
f2((t+1):N)=v11;
