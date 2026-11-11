# Artefatos de medição

Os números do artigo vêm de duas fontes, ambas fora deste repositório, para não
duplicar dado que já tem dono.

1. **Banco de produção local do Sifter** (`sifter-ai-db-1`, base `sifterdb`),
   coletado por `01-Projects/SifterAI/artigo/medicoes/coletar_metricas.py`
   (somente leitura). Saída bruta em
   `01-Projects/SifterAI/artigo/medicoes/medicoes-2026-10-21.json`.
2. **Amostra cega de 300 pares** para o estudo de concordância, em
   `01-Projects/SifterAI/artigo/medicoes/`:
   `gerar_amostra_cega.py`, `amostra-cega-300.csv`, `gabarito-300.csv`,
   `calcular_kappa.py`, `analisar_e2_e4.py`.

## O que já está no artigo

- Tabela 2 (registros e distribuição de decisões): seção "Panorama" do
  relatório de 21/10/2026.
- Tabela 3 (tokens e custo): seção "Custo e eficiência", com as três tarifas de
  referência. O modelo não fica gravado por registro no banco antigo; para a
  submissão é preciso registrar modelo, versão e data de acesso por decisão.
- Tabela 4 (concordância): seção "Kappa", incluindo o alerta de que as decisões
  manuais de P1 a P3 têm data desconhecida.

## O que falta medir antes da submissão

| Métrica | Como produzir | Onde entra |
|---|---|---|
| WSS (work saved over screening) | re-triagem cega dos 300 pares, comparando com o que a IA decidiu | Tabela 4b |
| NNR (number needed to read) | derivado da mesma amostra | Tabela 4b |
| Tempo por registro do revisor | sessão cronometrada com e sem primeira passada automatizada | Seção de avaliação |
| Validação externa | protocolo e corpus de outra equipe | Seção de avaliação |

## Regra de integridade

Nada de número inventado ou arredondado para cima. Se a amostra não estiver
completa, a tabela entra com a coluna declarada como pendente, como está hoje na
Seção 4.6.
