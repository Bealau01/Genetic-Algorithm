function [dn,Mn]=selezione_migliori(npi,k,M,d)

%npi -> number of individuals to keep
%k -> groups of k individuals among which to choose the one with the best (shortest) distance
%M -> individuals matrix
%d -> distance vector of individuals
%dn -> new distance vector of selected individuals
%Mn -> new matrix of selected individuals
% The selection always includes the best individual in the population

[np , N]=size(M);

dn=zeros(1,npi);
Mn=zeros(npi,N);

for i=1:npi %select npi individuals 

    if k > np-i+1
    error('k cannot be greater than the number of rows in M');
    end

%Randomly select a group of k individuals
% Generate a random permutation of row indices from 1 to np (number of rows in M)
ind_casuali = randperm(np-i+1);

if i==1

    % Extract all indices to obtain the npi random rows to ensure that the best one is selected
    Mnp = M(ind_casuali(1:np), :); %temporary matrix (need to select the best individual)
    dnp = d(ind_casuali(1:np)); %temporary distance vector (need to select the minimum distance)

    [dn(i), pos]=min_pos(dnp);
    Mn(i,:)=Mnp(pos,:);

else

    % Extract the first k indices to obtain the k random rows
    Mnp = M(ind_casuali(1:k), :); %temporary matrix (need to select the best individual)
    dnp = d(ind_casuali(1:k)); %temporary distance vector (need to select the minimum distance)

    %find the best among the selected k individuals and place them in the new matrix Mn and in the distance vector dn
    [dn(i), pos]=min_pos(dnp);
    Mn(i,:)=Mnp(pos,:);

end

M(ind_casuali(pos),:)=[]; %remove the selected individual so it won't be selected again
d(ind_casuali(pos))=[]; %remove the distance of the selected individual

end

