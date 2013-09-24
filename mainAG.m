numPopulacao = input('Quantos indiv�duos ter� a popula��o? ');
numGeracoes = input('Quantas gera��es? ');

probCruzamento = input('Qual a probabilidade de cruzamento entre os indiv�duos? (entre 0 e 1): ');
probMutacao = input('Qual a probabilidade de mutacao dos indiv�duos? (entre 0 e 1): ');

elitismo = input('Deseja usar m�todo elitista? (1 para SIM, 0 para N�O): ');
tipoSelecao = input('Deseja usar qual selecao? (1 para ROLETA, 0 para TORNEIO): ');
tipoCruzamento = input('Deseja usar qual cruzamento? (1 para PONTO DE CORTE, 0 para UNIFORME): ');

%Gera Popula��o Inicial
populacao = GeraPopulacaoInicial(numPopulacao);
%disp('Popula��o Inicial:');
%disp(populacao);

%Executa fun��o de avalia��o para popula��o inicial
fitness = ExecutaFuncaoAvaliacao(populacao);
disp('Fitness Inicial:');
disp(fitness);

melhoresFitness = zeros(1,numGeracoes);

%Executa os operadores gen�ticos para todas as gera��es
for geracao = 1:numGeracoes
    %Executa a fun��o de Elitismo
    [valorMax, indiceMax] = max(fitness);
    melhor = populacao(indiceMax,:);
    
    %Executa a fun��o de Sele��o
    pais = Selecao(populacao,fitness);
    
    %Executa a fun��o de Cruzamento
    filhos = Cruzamento(pais,probCruzamento);
    
    %Executa a fun��o de Muta��o
    filhosMutados = Mutacao(filhos,probMutacao);
    
    %Armazena dados para gerar os gr�ficos
    
    populacao = filhosMutados;
    
    %Executa a fun��o de avalia��o
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