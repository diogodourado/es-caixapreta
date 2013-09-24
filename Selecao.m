function selecionados = Selecao(populacao,fitness)
global tipoSelecao;
selecionados = zeros(size(populacao));
totalFitness = sum(fitness);
valorProp = fitness/totalFitness;
tamanho = length(valorProp);
for i = 2:tamanho
    valorProp(i) = valorProp(i) + valorProp(i-1);
end 
if tipoSelecao == 1
    %Seleção utilizando roleta
    for i = 1:tamanho
        sorteado = rand(1);
        for j = 1:tamanho
            if sorteado <= valorProp(j)
               selecionados(i,:) = populacao(j,:);
                break;
            end    
        end
    end     
else
    %Seleção utilizando torneio
    for i = 1:tamanho
        ind1 = ceil(tamanho*rand(1));
        ind2 = ceil(tamanho*rand(1));
        if fitness(ind1) < fitness(ind2)
            menor = ind1;
            maior = ind2;
        else
            menor = ind2;
            maior = ind1;
        end    
        if rand(1) <= 0.8
            selecionados(i,:) = populacao(maior,:);
        else
            selecionados(i,:) = populacao(menor,:);
        end
    end
end