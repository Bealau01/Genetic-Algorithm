function M = creazione_popolazione(np,N)

% Randomly generate the individuals of the population without repetition
% M-> matrix of individuals (by rows) np x N
M = zeros(np,N); % each row represents an individual

for i = 1:np

    % Generate a random permutation of the indices
    ind_permutati = randperm(N);

    % Check if the permutation is already present in M
    while ismember(ind_permutati, M(1:i, :), 'rows')
        ind_permutati = randperm(N);  % Generate a new permutation
    end
        
    % Use the indices to shuffle the original vector
    M(i,:) = ind_permutati; % randomly created individuals (they are the rows of the M matrix)

end
