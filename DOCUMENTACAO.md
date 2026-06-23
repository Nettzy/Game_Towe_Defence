# Documentação de Escolhas Algorítmicas

**Projeto:** Game Tower Defence  
**Engine:** GameMaker 2026 — GML  
**Repositório:** https://github.com/Nettzy/Game_Towe_Defence

<br>

## 1. Colisão por Separação de Eixos (SAT simplificado)

**Onde:** `obj_player` — Step Event (`move_and_collide`)  
**Complexidade:** O(1) por frame

O movimento e a colisão contra `O_mask` são testados separando os eixos X e Y em loops independentes com `place_meeting`. A cada iteração, o player avança um pixel e para quando há colisão.

**Por que essa escolha:**
Testar X e Y juntos causaria "travamento em cantos" — o player pararia completamente ao encostar em qualquer ângulo de parede. Separar os eixos permite deslizar ao longo de superfícies, comportamento esperado em jogos top-down. Simples e sem necessidade de física complexa.

<br>

## 2. Interpolação Linear (lerp) para Desaceleração

**Onde:** `obj_player` — Step Event, cálculo de `vel`  
**Complexidade:** O(1) por frame

Ao soltar as teclas, a velocidade é aproximada de zero via `lerp(vel, 0, 0.1)` a cada frame em vez de zerar instantaneamente.

**Por que essa escolha:**
Parada brusca deixa o movimento mecânico. O lerp cria desaceleração proporcional — quanto maior a velocidade, mais rápido ela cai — resultando em sensação de peso natural sem fisica. O fator `0.1` foi ajustado empiricamente para equilibrar responsividade e suavidade.

<br>

## 3. Array com Índice para Paginação de Diálogo

**Onde:** `obj_dialogo` — Create e Step  
**Complexidade:** O(1) por avanço de página

Os textos são carregados em `texto[]` via `scr_textos()` e exibidos com um índice `pagina`. Clique avança o índice; ao ultrapassar o tamanho do array o diálogo é destruído.

**Por que essa escolha:**
Arrays com acesso por índice são ideais para sequências de comprimento fixo. Uma fila (queue) seria desnecessariamente complexa para diálogos lineares. O `switch/case` em `scr_textos()` centraliza todos os textos em um único script, separando conteúdo de lógica de exibição.

<br>

## 4. Aritmética Modular para Navegação Circular

**Onde:** `obj_lojista` — Step Event (menu de opções)  
**Complexidade:** O(1) por pressionamento de tecla

```gml
menu_opcao = (menu_opcao + 1) mod menu_total  // avança
menu_opcao = (menu_opcao - 1 + menu_total) mod menu_total  // volta
```

**Por que essa escolha:**
A alternativa com `if/else` exigiria verificar manualmente os limites. O módulo resolve em uma operação e escala automaticamente — adicionar uma quarta opção não exige nenhuma mudança no código de navegação. Mesmo princípio de buffers circulares e filas de prioridade.

<br>

## 5. Lookup Table com Array 2D para Catálogo da Loja

**Onde:** `obj_loja` — Create e Step  
**Complexidade:** O(n) para renderizar · O(1) para comprar

```gml
loja_itens[i] = [nome, descrição, custo, tipo]
```

Um único loop percorre o array para renderizar. A compra acessa `loja_itens[loja_opcao]` diretamente.

**Por que essa escolha:**
Lookup table separa dados de lógica — para adicionar um novo item basta inserir uma linha no array, sem tocar no código de compra ou renderização. Alternativa de objeto por item seria mais flexível em jogos grandes, mas desnecessariamente pesada para um catálogo pequeno e estático.

<br>

## 6. Rate Limiting por Contador para Cooldown de Disparo

**Onde:** `obj_arma` — Step Event  
**Complexidade:** O(1) por frame

Um contador é decrementado a cada frame. O tiro só é disparado quando chega a zero, momento em que é reiniciado com `espera_tiro`. Upgrades de velocidade reduzem `espera_tiro` diretamente.

**Por que essa escolha:**
Alarms do GameMaker exigem callbacks separados e são difíceis de modificar em tempo real. O contador é uma variável simples — um upgrade comprado na loja reflete imediatamente na cadência sem reprogramar alarmes. Mesmo padrão de throttling de requisições de API e debounce de input.

<br>

## 7. Guard Clause com `instance_exists()`

**Onde:** `obj_player` — Step Event, interação com lojista  
**Complexidade:** O(1)

```gml
if instance_exists(obj_lojista) {
    // só então verifica proximidade e abre menu
}
```

**Por que essa escolha:**
`obj_player` é `persistent` — existe em todos os rooms. Sem a guarda, em rooms sem `obj_lojista`, o acesso a `menu_ativo` causaria erro em tempo de execução. A guard clause aplica o princípio de "fail fast" — falha rápida e explícita antes de propagar o erro.

<br>

## Resumo

| # | Algoritmo | Complexidade | Por que foi escolhido |
|---|---|---|---|
| 1 | SAT por eixo | O(1)/frame | Evita travamento em cantos |
| 2 | Lerp | O(1)/frame | Desaceleração natural sem física |
| 3 | Array + índice | O(1)/página | Simples para sequência linear |
| 4 | Módulo (mod) | O(1)/tecla | Navegação circular sem if/else |
| 5 | Array 2D (lookup) | O(n)/render | Separa dados de lógica |
| 6 | Contador (rate limit) | O(1)/frame | Modificável em tempo real |
| 7 | Guard clause | O(1) | Falha rápida em objetos persistent |
