function vm = mutazione2(v)

%vm -> mutated vector
%v -> vector to mutate
%the mutation consists of swapping two cities randomly

N=length(v);
t=randperm(N);
t1=t(1); %t1 and t2 are the positions where the cities are swapped
t2=t(2);

vm=v;
vm(t1)=v(t2);
vm(t2)=v(t1);
