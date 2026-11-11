# Proveniência da classe `CUP-JNL-DTM.cls`

Arquivos: `.template/CUP-JNL-DTM.cls` e `.template/CUP_Logo.pdf`, cópia
de trabalho.
Baixados em 11/11/2026 de `https://latextemplates.com/downloads/cup-data-article.zip`,
que redistribui o "CUP Data Template" da galeria do Overleaf
(`https://www.overleaf.com/latex/templates/cup-data-template/kwrskzvmfxbq`,
autoria "Cambridge University Press e Overleaf").

## O que isso significa

- **Não é kit oficial da CUP.** O template do Overleaf é mantido por endereço
  `@overleaf.com`; a Cambridge não publica o `.cls` em CTAN nem em página própria.
- **Não há licença explícita para a classe.** O cabeçalho do `.cls` traz
  boilerplate genérico do LaTeX2e/LPPL, que se refere ao sistema base, não a este
  arquivo. A única string Creative Commons no arquivo está dentro da macro
  `\copytext`, que carimba CC-BY no artigo publicado, não na classe.
- **A cópia está aqui por conveniência de build**, não para redistribuição
  pública. Se o repositório for aberto, remover a pasta `.template/` e usar o template do Overleaf, que é o caminho que a revista
  recomenda.

## Por que usar mesmo assim

O parâmetro `journal=rsm` da classe seleciona o conjunto de estilos que a RSM
usa: biblatex com estilo NEJM e citação numérica sobrescrita, o que casa com as
referências em AMA pedidas pela revista. Compilar com essa classe é a forma mais
próxima de ver o PDF como o editor verá.

## Estado verificado

Compilado em 11/11/2026 com TeX Live 2023 (Debian), `pdflatex` + `biber`,
template vazio em 3 páginas. O artigo completo compila em 12 páginas.

Reproduzir:

```bash
make
```
