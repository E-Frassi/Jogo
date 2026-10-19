# 🪙 Masmorra das Moedas

Trabalho Prático de **Introdução ao Desenvolvimento de Jogos** — IFMG Campus Ribeirão das Neves
Curso Técnico Integrado em Informática · Professora: Camila Laranjeira da Silva
Dupla: **Integrante 1** e **Integrante 2** *(substituam pelos nomes de vocês)*
Engine: **Godot 4**

---

# 📄 Entrega 1 — Documento de Proposta

## 1. Título do jogo
**Masmorra das Moedas**

## 2. Narrativa / tema
Krog, um pequeno goblin ladrão, descobre que o Rei da Masmorra roubou o tesouro da sua vila. Durante a noite ele invade a masmorra para **recuperar todas as moedas**. Mas o lugar é vigiado por guardas e assombrado por fantasmas que não querem visitas.

## 3. Objetivo do jogo
Coletar **todas as 10 moedas** espalhadas pela masmorra sem perder as 3 vidas.

## 4. Ações do jogador

| Ação | Controle |
|---|---|
| Mover | `W` `A` `S` `D` ou setas |
| Atirar uma bola de energia (na última direção em que andou) | `Espaço` |
| Pausar / continuar | `Esc` ou `P` |
| Navegar nos menus | Mouse ou teclado |

## 5. Inimigos e obstáculos

| Elemento | Comportamento |
|---|---|
| **Guarda** (3 na fase) | Patrulha: anda de um lado para o outro e inverte a direção ao bater na parede ou ao chegar no limite. Leva 2 tiros para cair. |
| **Fantasma** | Persegue o jogador (mais lento que ele). Surge em um ponto aleatório longe do jogador a cada 8 segundos, até 4 ao mesmo tempo. Cai com 1 tiro. |
| **Paredes** | Bloqueiam o movimento do jogador, dos inimigos e dos tiros. |

Tocar em um inimigo tira **1 vida** e dá 1,5 s de invulnerabilidade (o personagem pisca).

## 6. Itens e coletáveis

| Item | O que faz |
|---|---|
| **Moeda** (10 na fase) | +10 pontos e aproxima da vitória |
| **Coração** (2 na fase) | +1 vida (máximo de 5) |

## 7. Condições de vitória
Coletar as 10 moedas.

## 8. Condições de derrota
Perder as 3 vidas ao ser atingido por inimigos.

## 9. Progressão / dificuldade
- Fase única, mas a dificuldade **aumenta com o tempo**: novos fantasmas aparecem a cada 8 s.
- **Pontuação:** moeda = 10 · guarda derrotado = 25 · fantasma derrotado = 15 · bônus de 20 pontos por vida restante ao vencer.
- O **recorde** da sessão aparece na tela final.

## 10. Referências visuais / estéticas
Pixel art 16x16 com paleta escura de masmorra, feita para o projeto. Inspirações: *The Legend of Zelda* (visão de cima, masmorras), *Pac-Man* (coletar enquanto foge de perseguidores) e *Gauntlet* (masmorra com tiros).

---

# 🛠️ Entrega 2 — Status do desenvolvimento

- [x] Menu inicial (Iniciar, Créditos, Sair)
- [x] Cena principal com `TileMapLayer` (cenário)
- [x] Jogador com movimentação e câmera seguindo (com limites de mundo)
- [ ] Itens coletáveis (moedas e corações)
- [ ] Inimigo guarda com patrulha
- [ ] HUD (vidas, moedas e pontos)
- [ ] Inimigo fantasma que persegue, instanciado dinamicamente
- [ ] Menu de pause (`CanvasLayer`)
- [ ] Tiros do jogador (projéteis instanciados) que derrotam inimigos
- [ ] Tela final (vitória/derrota) com reiniciar e voltar ao menu
- [ ] Condições de vitória/derrota completas + recorde

## Estrutura do projeto

```
assets/        sprites/ e tilesets/ (imagens)
resources/     TileSet do cenário
scenes/
  ui/          MenuInicial, HUD, MenuPause, TelaFinal
  levels/      Fase (cena principal)
  entities/    Jogador, inimigos, itens e projétil
scripts/       GameState (autoload) + scripts organizados espelhando scenes/
```

## Como rodar
1. Abra o Godot 4, clique em **Importar** e selecione o arquivo `project.godot`.
2. Aperte **F5**. A cena inicial é o menu.

## Convenções da equipe
- Nomes de nós, arquivos e variáveis em português.
- Um commit por funcionalidade, com mensagem descritiva (ex.: `adiciona movimentação do inimigo patrulheiro`).
- Os dois integrantes fazem commits toda semana.
