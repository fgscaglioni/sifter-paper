# Comparativo com outras ferramentas e métricas de avaliação

Levantamento de 11/11/2026 para responder duas perguntas que o artigo atual não responde: com o que o Sifter se compara, e como se decide se a ferramenta é ruim, boa ou excelente.

## Resposta curta

1. **O artigo não compara.** A Seção 2 cita Rayyan, ASReview, SWIFT-Review, Covidence e DistillerSR em texto corrido, sem tabela, sem matriz de recursos e sem baseline executado. O único comparativo previsto (ASReview no mesmo corpus) está na tarefa T3.3 do plano e não foi rodado.
2. **Os pares não usaram um número só.** O padrão da área em 2006 virou WSS@95; o paper do Rayyan não mediu acurácia nenhuma (fez piloto de usabilidade em duas revisões Cochrane); ASReview mede em simulação; o pessoal de LLM mede acurácia ajustada por acaso e desequilíbrio. Quem decide com um número só erra.
3. **O veredito é por eixo, não por escore.** Seis eixos abaixo, cada um com faixa ruim/aceitável/bom/excelente. O Sifter hoje é forte em auditabilidade, fraco no que vem depois da triagem.

## 1. Matriz de recursos

Legenda: **✅** verificado no código do Sifter em 11/11/2026 · **🟡** fornecedor declara na página oficial (não testado) · **✗** ausente no código ou explicitamente fora do escopo · **🔒** não verificado nesta rodada.

| Recurso | Sifter | Rayyan | Covidence | DistillerSR | ASReview |
|---|---|---|---|---|---|
| Triagem dupla cega com regra (single, maioria, unânime, adjudicação) | ✅ `Decision.rule` + `conducting/adjudication` | 🟡 | 🟡 | 🟡 | ✗ |
| Decisão automática por LLM com justificativa por registro | ✅ | 🟡 ResearchPilot | 🟡 "surfaces likely includes" | 🟡 Smart Screening | ✗ (aprendizado ativo, não LLM) |
| Fila por aprendizado ativo com sementes | ✗ | 🟡 | 🔒 | 🟡 AI Re-Rank | 🟡 |
| Instrumento de risco de viés (RoB 2, ROBINS-I) | ✗ (etapa `quality` por critérios do protocolo, sem instrumento validado) | 🟡 módulo RoB | 🟡 | 🟡 templates Cochrane RoB | ✗ |
| Extração de dados | ✅ por campos do protocolo | 🟡 | 🟡 com sugestão ancorada no PDF | 🟡 SEE | ✗ |
| Meta-análise estatística | ✗ | ✗ | ✗ | ✗ (exporta) | ✗ |
| PRISMA automático | ✅ `/stats/prisma` + componente `PrismaFlow` | 🔒 | 🟡 | 🟡 | ✗ |
| Deduplicação | ✅ | 🟡 Auto-Resolver | 🟡 | 🟡 | ✗ |
| Executar a estratégia de busca em base | ✗ (guarda a string por fonte, não consulta) | ✗ | ✗ | 🟡 import agendado PubMed/Embase | ✗ |
| Recuperar texto completo | ✅ cadeia OA por DOI (arXiv etc.) | 🔒 | 🟡 via instituição | 🟡 RightFind e PMC | ✗ |
| App móvel | ✗ | 🟡 | ✗ | ✗ | ✗ |
| Trilha de auditoria por decisão | ✅ `ProjectLog` + histórico por artigo | 🔒 | 🟡 | 🟡 + SOC 2 | ✗ |
| **Validação cega embutida com κ e IC** | ✅ `/validation/kappa` e `/validation/sample` | ✗ | ✗ | ✗ | ✗ |
| **Multi-provedor de LLM, modelo gravado por decisão** | ✅ Gemini, Anthropic, OpenAI-compatível, Vertex | ✗ | ✗ | ✗ | ✗ |
| Código aberto e auto-hospedável | ✅ (licença a definir, D5 do plano) | ✗ | ✗ | ✗ | ✅ |
| Reuso de evidência entre projetos | ✗ | ✗ | ✗ | 🟡 CuratorCR | ✗ |

### O que eles têm e o Sifter não tem

Em ordem de custo para o usuário, não de facilidade de implementação:

1. **Instrumento de risco de viés com formulário validado.** É a lacuna mais cara: sem RoB 2/ROBINS-I o Sifter cobre a triagem e para na porta da avaliação crítica, que é onde o revisor passa a maior parte do tempo depois do full text. A etapa `quality` existe, mas avalia critérios do protocolo, não um instrumento com domínios e julgamentos padronizados.
2. **Execução da busca.** O Sifter guarda a string por fonte e não consulta PubMed, Scopus ou Embase. DistillerSR agenda importação; ninguém no grupo executa a busca, mas o DistillerSR chega mais perto.
3. **Meta-análise.** Ninguém do grupo faz; todos exportam. Não é lacuna competitiva, é limite de escopo: declarar que o Sifter termina na síntese qualitativa.
4. **App móvel.** Rayyan tem; é diferencial de adoção, não de método.
5. **Reuso de evidência entre projetos.** DistillerSR tem repositório corporativo. Para o alvo (pesquisador individual e grupo pequeno), é escopo alheio.

### O que o Sifter tem e eles não têm

Dois, e são os que sustentam o artigo:

- **Validação cega embutida**: sorteio, ocultação da decisão da IA, κ com IC e matriz calculados dentro do sistema. Nenhum concorrente oferece isso; é o que transforma "usamos IA" em "medimos a IA".
- **Modelo como parâmetro auditável**: provedor e modelo por decisão, com troca sem reescrever o projeto. Nos demais o modelo é proprietário e opaco.

## 2. O que os pares usaram como métrica

| Trabalho | O que mediu | O que isso ensina |
|---|---|---|
| Cohen et al. 2006 (JAMIA), classificador de citações | precisão, recall, F-measure e **WSS@95** | criou a métrica que a área usa até hoje: quanto do trabalho sobra quando se fixa o recall em 95%. Resultado considerado bom na época: redução em 11 de 15 tópicos, ≥50% em apenas 3 |
| Ouzzani et al. 2016 (Rayyan, Systematic Reviews) | **nenhuma acurácia**: piloto de usabilidade em duas revisões Cochrane (1.030 e 273 registros) + survey de usuários | o paper de ferramenta mais citado da área não mediu acurácia. Usabilidade e adoção foram o argumento |
| van de Schoot et al. 2021 (ASReview, Nat. Mach. Intell.) | simulação de revisões, curva de recall e economia de tempo | o padrão de "prova" virou simulação reproduzível em corpus publicado, não estudo em revisão viva |
| Khraisha et al. 2024 (RSM), GPT-4 | acurácia **ajustada por concordância ao acaso e desequilíbrio do dataset** | acurácia crua engana: o desempenho em triagem foi de "nenhum" em corpus equilibrado (~1:1) a "moderado" em desequilibrado (~1:3). Quem reporta só acurácia reporta inflação |
| Guia da RSM para IA generativa (Farotimi et al. 2025) | WSS, NNR, precisão, acurácia, especificidade, sensibilidade + validação externa | é a lista mínima que o parecerista vai cobrar; métrica nova pode complementar, nunca substituir |

Conclusão prática: a área não tem uma métrica única. Tem uma **hierarquia**: recall é o portão, WSS@95 é o ganho, NNR é o custo humano, e acurácia sozinha não decide nada.

## 3. Como dizer se está ruim, bom ou excelente

Seis eixos. As faixas marcadas com **(lit.)** vêm de fonte citada; as demais são **convenção deste projeto**, declaradas como tal no artigo para não passarem por medida.

| Eixo | Ruim | Aceitável | Bom | Excelente | Âncora |
|---|---|---|---|---|---|
| **Sensibilidade** (recall) | < 90% | 90 a 95% | 95 a 99% | 100% com limite inferior do IC ≥ 95% | (lit.) automação de triagem opera a 95% de recall, é o que define WSS@95 |
| **WSS@95** (trabalho poupado fixando 95% de recall) | < 20% | 20 a 35% | 35 a 50% | > 50% | (lit.) Cohen 2006: 50% foi ganho notável, em 3 de 15 tópicos |
| **NNR** (registros lidos por estudo incluído) | igual ao manual | 10 a 25% menor | ~50% menor | > 70% menor | convenção |
| **κ contra humano** | < 0,2 | 0,2 a 0,4 | 0,4 a 0,6 | > 0,6 com IC estreito | (lit.) Landis e Koch |
| **Custo por 1.000 registros** | > US$ 100 | 10 a 100 | 1 a 10 | < US$ 1 | convenção; piloto do Sifter ficou em 0,10 a 1,63 |
| **Tempo por registro** | sem ganho | < 30% | 30 a 60% | > 60% | convenção |

### A regra que evita autoengano

O critério não é o valor pontual, é o **limite inferior do intervalo**. Um recall de 100% em 6 positivos tem IC de Wilson começando perto de 61%: é indício, não garantia. A frase aceitável no artigo é "nenhuma inclusão perdida em 6 casos", não "recall de 100%".

### Aplicando ao piloto de hoje

| Eixo | Valor medido | Faixa | Leitura |
|---|---|---|---|
| Sensibilidade | 6/6, IC largo | inconclusivo | piloto, não resultado |
| Especificidade | 20/25 = 80% | aceitável | dentro do esperado para configuração orientada a recall |
| κ | 0,608 (IC 0,290 a 0,903) | bom no ponto, fraco no IC | precisa de n ≥ 300 |
| NNR | não calculado | — | depende do E1 |
| WSS@95 | não calculado | — | depende do E1 |
| Custo | US$ 0,10 a 1,63/1.000 | excelente | é o argumento mais forte hoje |

Veredito honesto: **promissor, não aprovado**. O único eixo em faixa excelente é custo, e custo não é o que a revista pede como prova de qualidade.

## 4. O que fazer com isso no artigo

1. Acrescentar uma subseção "Comparison with existing tools" na Seção 2, com a matriz acima reduzida a 8 linhas e 5 colunas, mantendo a legenda de evidência.
2. Trocar a frase genérica de limitação por uma tabela de veredito com as seis métricas, marcando o que está medido e o que está pendente.
3. Não afirmar superioridade em recurso: afirmar superioridade **no eixo de auditabilidade**, que é o que o artigo demonstra.
4. Citar Rayyan como precedente de paper de ferramenta sem acurácia (dá respaldo ao formato Software Focus) e Cohen 2006 como origem do WSS@95.

## Fontes (acesso em 11/11/2026)

- Rayyan, página oficial e menu de recursos: https://www.rayyan.ai/
- Covidence, página oficial (etapas e recursos): https://www.covidence.org/
- DistillerSR, página do produto: https://www.distillersr.com/products/distillersr-systematic-review-software
- ASReview, documentação: https://asreview.readthedocs.io/en/latest/
- Ouzzani M, et al. Rayyan, Systematic Reviews 2016;5. doi:10.1186/s13643-016-0384-4
- Cohen AM, et al. Reducing workload in systematic review preparation using automated citation classification. JAMIA 2006. doi:10.1197/jamia.M1929
- Khraisha Q, et al. Can large language models replace humans in systematic reviews? Res Synth Methods 2024;15:616-626. doi:10.1002/jrsm.1715
- Farotimi O, et al. Guidance for manuscript submissions testing generative AI. Res Synth Methods 2025. doi:10.1017/rsm.2025.10058
- Código do Sifter: `repos/sifter-ai` v3.20.0, commit `93731e1` (rotas, modelos e telas conferidos)
