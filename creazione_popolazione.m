function M = creazione_popolazione(np,N)

%genero casualmente gli individui della popolazione senza ripetizione
%M->matrice individui (per righe) np x N
M=zeros(np,N); %ogni riga rappresenta un individuo


for i=1:np

% Genero una permutazione casuale degli indici
ind_permutati = randperm(N);

 % Verifico se la permutazione è già presente in M
        while ismember(ind_permutati, M(1:i, :), 'rows')
            ind_permutati = randperm(N);  % Genera una nuova permutazione
        end
        
% Uso gli indici per scombinare il vettore originale
M(i,:) = ind_permutati; %individui creati casualmente (sono le righe della matrice M)

end