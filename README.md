# Game Tower Defence

> Jogo de ação top-down com elementos de RPG e tower defence, desenvolvido em **GameMaker 2026** com **Game Maker Language (GML)**.

---

## Gênero

**Action RPG / Tower Defence**

O jogador controla um personagem em visão top-down que deve defender uma base contra ondas de inimigos. Entre as ondas, é possível interagir com NPCs, comprar upgrades de arma em uma loja e gerenciar o inventário.

---

## Como Rodar

### Pré-requisitos

- [GameMaker](https://gamemaker.io/) versão **2026.0.0.16** ou superior
- Sistema operacional: Windows, macOS ou Ubuntu

### Passos

```
1. Clone o repositório
   git clone https://github.com/Nettzy/Game_Towe_Defence.git

2. Abra o GameMaker

3. Vá em File → Open Project

4. Selecione o arquivo:
   BLANK GAME4.yyp

5. Clique no botão ▶ Run (F5) para rodar o jogo
```

### Controles

| Tecla / Botão | Ação |
|---|---|
| `W` `A` `S` `D` | Mover o personagem |
| Mouse | Mirar |
| Botão esquerdo do mouse | Atirar |
| `E` (perto de NPC) | Interagir / Abrir menu |
| `↑` `↓` | Navegar no menu |
| `Esc` | Fechar menu / loja |

---

## Estrutura do Projeto

```
Game_Towe_Defence/
├── objects/
│   ├── obj_player/          # Personagem principal
│   ├── obj_arma/            # Sistema de arma e disparo
│   ├── obj_tiro/            # Projétil
│   ├── obj_inimigo_pai/     # Classe base dos inimigos
│   ├── obj_mal/             # Inimigo
│   ├── obj_pai_npc/         # Classe base dos NPCs
│   ├── obj_lojista/         # NPC lojista (menu de 3 opções)
│   ├── obj_loja/            # Interface da loja de upgrades
│   ├── obj_dialogo/         # Sistema de diálogo paginado
│   ├── Obj_camera/          # Câmera que segue o player
│   ├── Obj_barra_de_vida/   # HUD de vida
│   └── O_mask/              # Máscara de colisão do mapa
├── rooms/
│   ├── Room1/               # Tela inicial / menu
│   └── Room2/               # Fase principal (loja + NPCs)
├── scripts/
│   └── script_texto/        # Textos de diálogo dos NPCs
├── sprites/                 # Sprites do personagem, armas, inimigos
├── fonts/Font1/             # Fonte usada na UI
└── BLANK GAME4.yyp          # Arquivo de projeto GameMaker
```

---

## Algoritmos Implementados

| # | Algoritmo | Onde é usado |
|---|---|---|
| 1 | **SAT simplificado por eixo** | Colisão do player com paredes (`O_mask`) |
| 2 | **Interpolação linear (lerp)** | Desaceleração suave do movimento |
| 3 | **Acesso sequencial em array** | Paginação do sistema de diálogo |
| 4 | **Navegação circular (mod)** | Menu de opções do lojista |
| 5 | **Lookup table com array 2D** | Catálogo de itens da loja |
| 6 | **Rate limiting por contador** | Cooldown de disparo da arma |
| 7 | **Guard clause** | Proteção contra erros em objetos persistent |

---

## Objetos Principais

| Objeto | Responsabilidade |
|---|---|
| `obj_player` | Movimento, disparo, interação com NPCs |
| `obj_arma` | Mira pelo mouse, cooldown, variável `dano` |
| `obj_tiro` | Projétil disparado pela arma |
| `obj_lojista` | NPC com menu de 3 opções (diálogo / loja / vender) |
| `obj_loja` | Interface de compra de upgrades com `global.ouro` |
| `obj_dialogo` | Exibição paginada de textos via Draw GUI |
| `obj_inimigo_pai` | Classe base com comportamento de perseguição |

---

## Tecnologias

- **Engine:** GameMaker 2026
- **Linguagem:** GML (Game Maker Language)
- **Renderização de UI:** Draw GUI (sistema nativo do GameMaker)
- **Controle de versão:** Git + GitHub
