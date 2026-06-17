depth = -9999;

loja_itens = [
    ["+ Velocidade", "Dispara mais rápido\n(-1 espera de tiro)", 50, "velocidade"],
    ["+ Força",      "Causa mais dano\n(+2 de dano)",           80, "dano"],
];

loja_total   = array_length(loja_itens);
loja_opcao   = 0;   // item selecionado no momento

if (!variable_global_exists("ouro")) global.ouro = 200;