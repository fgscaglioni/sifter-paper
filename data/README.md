# Artefatos de medição

Os números do artigo vêm de duas fontes, ambas fora deste repositório, para não
duplicar dado que já tem dono.

1. **Banco de produção local do Sifter** (`sifter-ai-db-1`, base `sifterdb`),
   coletado por `01-Projects/SifterAI/artigo/medicoes/coletar_metricas.py`
   (somente leitura). O script foi corrigido em 11/11/2026 para o schema atual:
   o rótulo da triagem mora em `article.status` (`included`/`excluded`/`doubt`/
   `duplicate`), e a decisão humana de auditoria mora em `vote`
   (`purpose='audit'`, `stage='screening'`), não em `article.manual_decision`.
2. **Amostra cega do E1**, em `01-Projects/SifterAI/artigo/medicoes/e1-2026-11/`:
   - `revisor-326.csv` — arquivo da triagem, com a coluna `manual_decision` vazia
   - `gabarito-326.csv` — `id`, `status`, `estrato`, `n_estrato`, `n_amostra`, `peso`
   - `manifesto.json` — semente, tamanhos de estrato e filtro do frame
   - `PROTOCOLO.md` — regras da triagem e comando do cálculo
   - gerado por `gerar_amostra_cega.py --project 45 --n 300 --seed 20261111`

## Os três estratos e por que existe peso

| Estrato | Frame | Amostra | Peso |
|---|---|---|---|
| `included` | 1.030 | 100 | 10,3 |
| `excluded` | 3.580 | 200 | 17,9 |
| `doubt` | 26 | 26 | 1,0 |

A amostra é estratificada e desproporcional: 9,7% dos incluídos e 5,6% dos
excluídos. Calcular NNR e WSS direto sobre as 326 linhas super-representa os
incluídos em 1,5 vez, infla a precisão e subestima o trabalho humano. O
`calcular_kappa.py` estima a proporção de incluídos dentro de cada estrato e
expande para o tamanho do estrato no frame antes de calcular.

## Fórmulas usadas

- `NNR = 1/precisão = (TP+FP)/TP` — registros lidos por estudo incluído.
- `WSS@R = (TN+FN)/N − (1−R)` — fração não sinalizada menos o custo do recall
  alvo (Cohen et al. 2006, doi:10.1197/jamia.M1929).
- Se a sensibilidade observada ficar abaixo do alvo (0,95), o relatório informa
  o WSS no recall observado e diz que o WSS@0,95 não se aplica.

## O que já está no artigo

- Tabela 2 (registros e distribuição de decisões): seção "Panorama" do
  relatório de 21/10/2026, reproduzida por `coletar_metricas.py`.
- Tabela 3 (tokens e custo): seção "Custo e eficiência", com as três tarifas de
  referência. O modelo não fica gravado por registro no banco antigo; para a
  submissão é preciso registrar modelo, versão e data de acesso por decisão.
- Tabela 4 (concordância piloto): seção "Kappa" do relatório de 21/10/2026,
  com o alerta de que as decisões humanas de P1 a P3 têm data desconhecida.

## O que falta medir antes da submissão

| Métrica | Como produzir | Onde entra |
|---|---|---|
| κ, sensibilidade, especificidade no E1 | preencher `manual_decision` e rodar `calcular_kappa.py` | Tabela 4 |
| WSS e NNR | saem do mesmo comando, já com expansão por estrato | tabela nova |
| Tempo por registro do revisor | sessões cronometradas, registradas em `data/tempo-sessoes.csv` | Seção de avaliação |
| Validação externa | protocolo e corpus de outra equipe | Seção de avaliação |

## Regra de integridade

Nada de número inventado ou arredondado para cima. Se a amostra não estiver
completa, a tabela entra com a coluna declarada como pendente, como está hoje na
Seção 4.6.
