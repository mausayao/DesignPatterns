# Singleton

## Definição

É um padrão de projeto criacional que garante a existência de apenas uma instância de uma classe, mantendo um ponto global de acesso ao seu objeto.

## Onde usar uma Singleton

- Em conexão de banco de dados
- Controlar a concorrência de acesso a recursos compartilhados
- Quando uma classe é utilizada com frequência por varais partes distintas do sistema
- Em logs de sistemas
- Em variáveis de configuração
- Em acesso a recursos de hardware compartilhado

## Como implementar um Singleton

1. Deixar o construtor privado, para ninguém conseguir instanciar a classe, apenas o próprio singleton
2. Criar um atributo privado e estático do mesmo tipo da classe.
3. Criar o método getInstace(), será o ponto principal da classse. Ele verifica se a variável já foi iniciada, caso não tenha sido, ele faz sua criação pela primeira vez.
4. Para realizar a chamada da classe Singleton, deve ser feito da seguinte forma: ClasseSingleton.getInstance()
