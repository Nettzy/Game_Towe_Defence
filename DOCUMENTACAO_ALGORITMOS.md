# Documentação de Escolhas Algorítmicas

**Projeto:** Game Tower Defence  
**Engine:** GameMaker 2026 — GML  
**Repositório:** https://github.com/Nettzy/Game_Towe_Defence

---

## 1. Colisão por Separação de Eixos (SAT simplificado)

**Onde:** `obj_player` — Step Event (`move_and_collide`)  
**Complexidade:** O(1) por frame

O movimento e a colisão contra `O_mask` são testados separando os eixos X e Y em loops independentes com `place_meeting`. A cada iteração, o player avança um pixel na direção desejada e para quando há colisão.

**Por que essa escolha:**  
Testar X e Y juntos causaria "travamento em cantos" — o player pararia completamente ao encostar em qualquer ângulo de parede. Separar os eixos permite que o personagem deslize ao longo de superfícies, comportamento esperado em jogos de ação top-down. A solução é simples, sem necessidade de polígonos de colisão ou física complexa, adequada para um jogo com movimento baseado em grade.

---

## 2. Interpolação Linear (lerp) para Desaceleração

**Onde:** `obj_player` — Step Event, cálculo de `vel`  
**Complexidade:** O(1) por frame

Ao soltar as teclas de movimento, a velocidade não zera instantaneamente — ela é aproximada de zero via `lerp(vel, 0, 0.1)` a cada frame.

**Por que essa escolha:**  
Parada brusca (vel = 0) deixa o movimento mecânico e pouco responsivo. O lerp cria uma desaceleração proporcional — quanto maior a velocidade, mais rápido ela cai — resultando em sensação de peso natural sem precisar de física. O fator `0.1` foi escolhido empiricamente para equilibrar responsividade e suavidade.

---

## 3. Array com Índice para Paginação de Diálogo

**Onde:** `obj_dialogo` — Create e Step  
**Complexidade:** O(1) por avanço de página

Os textos de cada NPC são carregados via `scr_textos()` em um array `texto[]` e exibidos um a um com um índice `pagina`. Clique avança o índice; quando ultrapassa o tamanho do array, o diálogo é destruído.

**Por que essa escolha:**  
Arrays com acesso por índice são a estrutura mais eficiente para sequências de comprimento fixo conhecidas em tempo de execução. A alternativa seria uma fila (queue), mas desnecessariamente complexa para diálogos lineares. O `switch/case` em `scr_textos()` centraliza todos os textos do jogo em um único script, facilitando edição sem tocar na lógica de exibição.

---

## 4. Aritmética Modular para Navegação Circular

**Onde:** `obj_lojista` — Step Event (menu de opções)  
**Complexidade:** O(1) por pressionamento de tecla

A navegação entre as opções do menu usa `(menu_opcao + 1) mod menu_total` para avançar e `(menu_opcao - 1 + menu_total) mod menu_total` para voltar, garantindo que o índice sempre fique dentro dos limites do array de forma circular.

**Por que essa escolha:**  
A alternativa com `if/else` exigiria verificar manualmente os limites inferior e superior. O módulo resolve em uma operação e escala automaticamente — adicionar uma quarta opção não exige nenhuma mudança no código de navegação. É o mesmo princípio usado em buffers circulares e filas de prioridade.

---

## 5. Lookup Table com Array 2D para Catálogo da Loja

**Onde:** `obj_loja` — Create e Step  
**Complexidade:** O(n) para renderizar, O(1) para comprar

Os itens da loja são armazenados como array bidimensional:
```
loja_itens[i] = [nome, descrição, custo, tipo]
```
Um único loop percorre o array para renderizar todos os itens. A compra acessa `loja_itens[loja_opcao]` diretamente.

**Por que essa escolha:**  
Uma lookup table separa dados de lógica — para adicionar um novo item à loja, basta adicionar uma linha ao array sem tocar no código de compra ou renderização. A alternativa seria um objeto dedicado por item (mais flexível em jogos grandes), mas desnecessariamente pesada para um catálogo pequeno e estático.

---

## 6. Rate Limiting por Contador para Cooldown de Disparo

**Onde:** `obj_arma` — Step Event  
**Complexidade:** O(1) por frame

Um contador é decrementado a cada frame. O tiro só é disparado quando o contador chega a zero, momento em que ele é reiniciado com o valor de `espera_tiro`. Upgrades de velocidade reduzem `espera_tiro`, aumentando a cadência.

**Por que essa escolha:**  
Alarms do GameMaker seriam uma alternativa, mas exigem callbacks separados e são mais difíceis de modificar dinamicamente. O contador é uma variável simples, modificável em tempo real pela loja (um upgrade comprado reflete imediatamente na cadência sem precisar reprogramar alarmes). É o mesmo padrão de throttling usado em sistemas de input e requisições de API.

---

## 7. Guard Clause com `instance_exists()`

**Onde:** `obj_player` — Step Event, lógica de interação com lojista  
**Complexidade:** O(1)

Antes de verificar se o NPC mais próximo é o lojista, o código checa `instance_exists(obj_lojista)`. Se o objeto não existir no room atual, a lógica de menu é pulada inteiramente.

**Por que essa escolha:**  
`obj_player` é `persistent` — ele existe em todos os rooms. Sem a guarda, em rooms sem `obj_lojista`, `instance_nearest` poderia retornar outro objeto ou a tentativa de acessar `menu_ativo` em uma instância inexistente causaria um erro em tempo de execução. A guard clause falha rápido e limpo, sem propagação do erro — princípio de "fail fast" aplicado ao ciclo de vida de instâncias no GameMaker.

---

## Resumo

| Algoritmo | Complexidade | Alternativa considerada | Motivo da escolha |
|---|---|---|---|
| SAT por eixo | O(1)/frame | Colisão conjunta X+Y | Evita travamento em cantos |
| Lerp | O(1)/frame | vel = 0 imediato | Sensação de peso natural |
| Array + índice | O(1)/página | Fila (queue) | Simples para sequência linear |
| Módulo (mod) | O(1)/tecla | if/else nos limites | Escalável sem alterar código |
| Array 2D (lookup) | O(n)/render | Objeto por item | Separa dados de lógica |
| Contador (rate limit) | O(1)/frame | Alarm do GameMaker | Modificável em tempo real |
| Guard clause | O(1) | try/catch | Falha rápida e explícita |
