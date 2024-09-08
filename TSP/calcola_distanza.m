function [d,dmin,vbest]=calcola_distanza(M,A)

% d -> npx1 vector that indicates the total distance of each individual's route
% M -> npxN matrix containing the individuals (by rows)
% A -> (N+1)x2 matrix where N is the length of each individual and 2 columns for the x and y of each point (the +1 indicates the starting point from where the traveler begins)
% dmin -> number indicating the shortest distance among all individuals
% vbest -> vector of the best individual in the population (the one with the shortest distance)

[np , N]=size(M);
%np -> number of individuals
%N -> number of cities to visit

AA=A(2:N+1,:); %remove the starting point from matrix A

d=zeros(1,np); %initialize the distance vector for the routes of all individuals (np)
for j=1:np

    di=zeros(1,N); %distance vector from one point to the next (including the starting point)

%permute the rows of AA according to the order of indices of the various individuals
vj=M(j,:);
AAperm=AA(vj,:); %permuted matrix according to the indices, now it's possible to calculate the distance from one point to the next

for i=1:N
if i==1 %calculate the distance between the starting point and the first city
    punti=[A(1,1),A(1,2) ; AAperm(i,:)]; %points matrix to calculate the distance
    di(i)=sqrt((punti(1,1)-punti(2,1))^2+(punti(1,2)-punti(2,2))^2);
else %calculate the distance between one point and the next
    punti=AAperm(i-1:i,:);
    di(i)=sqrt((punti(1,1)-punti(2,1))^2+(punti(1,2)-punti(2,2))^2);
end

end

d(j)=sum(di); %the sum of the distances is the total distance of the route for the j-th individual -> fitness function

%Find the best individual: the one with the lowest fitness
if j==1
    dmin=d(j);
    vbest=M(j,:);
else
    if dmin>d(j)
     dmin=d(j);
     vbest=M(j,:);
    end
end

end





