---
type: Readme
title: "sifter-paper - repositório do artigo do Sifter"
description: "Status, decisões de formato e como compilar o artigo do Sifter para a Research Synthesis Methods (Software Focus)."
status: active
domain: [phd, ai]
tags: [sifterai, artigo, latex, rsm, software-focus]
project: "[[SifterAI]]"
created: 2026-11-11
updated: 2026-11-11
---

# sifter-paper

Artigo do Sifter para a **Research Synthesis Methods** (Cambridge University Press), tipo **Software Focus**.

- Estrato: **A1** no ciclo 2025-2028 da Área 02 (percentil 97, estimativa do QualisComp lida em 11/11/2026).
- Levantamento de veículos e requisitos: `01-Projects/SifterAI/SifterAI - Mapa de periodicos para o artigo (2026-11-11).md` no vault.
- Código da ferramenta: `../sifter-ai` (v3.20.0, commit `93731e1`).

## Como compilar

```bash
make          # pdflatex + biber + 2x pdflatex, gera main.pdf
make clean    # remove auxiliares
```

Toolchain verificada em 11/11/2026: TeX Live 2023, `pdflatex` + `biber`, classe `CUP-JNL-DTM` com `journal=rsm` (biblatex estilo NEJM, citação numérica sobrescrita). O template vazio compila em 3 páginas.

## Como compilar no Overleaf

Menu → Main document = `main.tex`, compilador **LaTeX** (latexmk, o padrão). `main.tex`, `sections/`, `references.bib`, `CUP-JNL-DTM.cls` e `CUP_Logo.pdf` estão todos na raiz do projeto, então o build não depende de `latexmkrc` nem de `TEXINPUTS` — mesma razão pela qual `pdflatex main.tex` roda direto na raiz de um clone.

## Regras da revista que já estão no código

| Regra | Onde está |
|---|---|
| Resumo de até 250 palavras, sem citação | `main.tex`, bloco `Frontmatter` |
| Seção **Highlights** obrigatória, entre resumo e texto | `main.tex`, `\section*{Highlights}` |
| Referências em AMA (free format aceito na submissão) | `references.bib` + biblatex NEJM |
| Data and Code Availability Statement | `sections/06-conclusion.tex` |
| Declaração de uso de IA generativa | **falta no fonte** (o texto cita a exigência, não há bloco de declaração) |
| Revisão single anonymised (não precisa cegar o PDF) | `main.tex` |

## Pendências que travam a submissão

1. **E1 (300 pares cegos)** não executado. Sem ele o artigo é descrição de software. Arquivos já existem em `01-Projects/SifterAI/artigo/medicoes/` (`amostra-cega-300.csv`, `gabarito-300.csv`).
2. **Licença**: `../sifter-ai` não tem arquivo `LICENSE`. A RSM exige licença OSI aprovada no repositório.
3. **Repositório público**: confirmar que `github.com/fgscaglioni/sifter-ai` está acessível sem login.
4. **APC**: £1.960 / US$ 2.740, com pedido de waiver na submissão.
5. **ORCID** do autor correspondente.
6. **Autores e afiliações** ainda em placeholder no `main.tex`.

## Estrutura

```
main.tex               # preâmbulo, frontmatter (resumo, highlights), includes
sections/              # um arquivo por seção
references.bib         # AMA/NEJM via biblatex
figures/               # imagens de \includegraphics (alvo do \graphicspath)
CUP-JNL-DTM.cls        # classe da CUP, cópia de trabalho (ver PROVENANCE.md)
CUP_Logo.pdf           # logo que a classe insere na primeira página
PROVENANCE.md          # origem e situação de licença do template
data/                  # aponta para os artefatos de medição, não duplica
notes/                 # decisão de veículo e próximos passos
```
