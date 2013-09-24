numPopulacao = input('Quantos indivíduos terá a população? ');
numGeracoes = input('Quantas gerações? ');

probCruzamento = input('Qual a probabilidade de cruzamento entre os indivíduos? (entre 0 e 1): ');
probMutacao = input('Qual a probabilidade de mutacao dos indivíduos? (entre 0 e 1): ');

elitismo = input('Deseja usar método elitista? (1 para SIM, 0 para NÃO): ');
tipoSelecao = input('Deseja usar qual selecao? (1 para ROLETA, 0 para TORNEIO): ');
tipoCruzamento = input('Deseja usar qual cruzamento? (1 para PONTO DE CORTE, 0 para UNIFORME): ');

%Gera População Inicial
populacao = GeraPopulacaoInicial(numPopulacao);
%disp('População Inicial:');
%disp(populacao);

%Executa função de avaliação para população inicial
fitness = ExecutaFuncaoAvaliacao(populacao);
disp('Fitness Inicial:');
disp(fitness);

melhoresFitness = zeros(1,numGeracoes);

%Executa os operadores genéticos para todas as gerações
for geracao = 1:numGeracoes
    %Executa a função de Elitismo
    [valorMax, indiceMax] = max(fitness);
    melhor = populacao(indiceMax,:);
    
    %Executa a função de Seleção
    pais = Selecao(populacao,fitness);
    
    %Executa a função de Cruzamento
    filhos = Cruzamento(pais,probCruzamento);
    
    %Executa a função de Mutação
    filhosMutados = Mutacao(filhos,probMutacao);
    
    %Armazena dados para gerar os gráficos
    
    populacao = filhosMutados;
    
    %Executa a função de avaliação
    fitness = ExecutaFuncaoAvaliacao(populacao);
    
    if elitismo == 1
        [valorMin, indiceMin] = min(fitness);
        populacao(indiceMin,:) = melhor;
        fitness(indiceMin) = valorMax;
    end
 
    melhoresFitness(1,geracao) = max(fitness);
    
end 
axis([0 200 0 30]);
plot(melhoresFitness);