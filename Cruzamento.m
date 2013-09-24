function filhos = Cruzamento(pais,probCruzamento)
global tipoCruzamento;
filhos = zeros(size(pais));
[tamanho,genes] = size(pais); 
for i = 1:2:tamanho
    %Verifica se vai cruzar
    if rand(1) <= probCruzamento
        %Método de Ponto de Corte
        if tipoCruzamento == 1 
            %Define o ponto de corte 
            a = 5;
            b = 30;
            pontoCorte = round(a + (b-a).*rand(1));
            %Gera os filhos     
            filhos(i,:) = [pais(i,1:pontoCorte) pais(i+1,pontoCorte+1:genes)];
            filhos(i+1,:) = [pais(i+1,1:pontoCorte) pais(i,pontoCorte+1:genes)];
        else %Método Uniforme
            for j = 1:genes
                if rand(1) <= 0.5
                    filhos(i,j) = pais(i,j);
                    filhos(i+1,j) = pais(i+1,j);
                else
                    filhos(i,j) = pais(i+1,j);
                    filhos(i+1,j) = pais(i,j);
                end    
            end 
        end
        %Passa pai para proxima geracao, caso nao tenha par
        if tamanho-1 == i && mod(tamanho,2) == 1
            filhos(i+2,:) = pais(i+2,:);
        end
    end
end    