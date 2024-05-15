# Adapter

## Definição

É um padrão de projeto estrutural que permite objetos com interfaces incompatíveis colaborarem entre si.

## Como implementar

1. O adaptador obtém uma interface, compatível com um dos objetos existentes.
2. Usando essa interface, o objeto existente pode chamar os métodos do adaptador com segurança.
3. Ao receber a chamada, o adaptador passa o pedido para o segundo objeto, mas em um formato e ordem que o segundo objeto espera.
