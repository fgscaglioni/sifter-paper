# Plano para fechar as deficiências do artigo do Sifter

**Objetivo:** levar o manuscrito de `repos/sifter-paper` ao estado submissível à *Research Synthesis Methods* (tipo Software Focus), fechando as doze deficiências identificadas em 11/11/2026.

**Estado de partida (medido):** 12 páginas compilando com `make`, 0 overfull, 5.298 palavras, 13 referências com DOI verificado, piloto com 14.219 registros triados, custo e concordância já escritos nas Tabelas 2 a 4. O que falta é o que transforma descrição de software em artigo aceitável: validação, proveniência, licença, dados depositados e decisões administrativas.

**Regra do plano:** cada tarefa diz quem executa. `filho` é delegável a subagente; `orquestrador` é desta sessão; `Fabrício` é trabalho humano que nenhum agente faz (triagem cega, decisões, envio).

---

## 1. As deficiências e o que cada uma bloqueia

| ID | Deficiência | Consequência se ficar aberta | Peso | Sprint |
|---|---|---|---|---|
| D1 | E1 não executado: sem WSS, NNR e sensibilidade em amostra nova | O guia de IA generativa da RSM exige métrica de carga de trabalho; sem ela o artigo é recusado como descrição de software | **Bloqueante** | S2 |
| D2 | Tempo de revisor não medido (E2) | Sem "horas economizadas", a única métrica de eficiência é custo de token, que não é o que o leitor quer | Alto | S3 |
| D3 | Validação externa ausente | O guia exige validação em amostra independente; revisor vai pedir | Alto | S4 |
| D4 | Proveniência por decisão incompleta (modelo, versão, data de acesso, prompt) | Exigência explícita do guia; hoje o banco não garante o dado e o texto promete mais do que o schema entrega | **Bloqueante** | S1 |
| D5 | `sifter-ai` sem arquivo `LICENSE` | Política de código da RSM exige licença OSI aprovada | **Bloqueante** | S1 |
| D6 | Disponibilidade pública do repositório não confirmada | O revisor de pesquisa reproduzível precisa clonar e subir | Alto | S1 |
| D7 | Dataset não depositado, sem DOI | *Data Availability Statement* fica com placeholder | **Bloqueante** | S5 |
| D8 | Autoria, ordem e afiliação em placeholder; ORCID não confirmado | Submissão não abre sem autor correspondente e ORCID | **Bloqueante** | S0 |
| D9 | APC de £1.960 / US$ 2.740 sem pedido de waiver | Custo financeiro desnecessário; a revista concede waiver | Médio | S7 |
| D10 | Declaração de uso de IA não escrita | Política da CUP; seção vazia no manuscrito | **Bloqueante** | S6 |
| D11 | Sem baseline ASReview ou Parsifal | O guia pede comparação com método manual e com automação existente | Médio | S3 |
| D12 | Escolha da revista não alinhada com o orientador | Decisão de 22/10 condicionava a revista à submissão do colega do Marilton | Alto | S0 |

Deficiências que já estão fechadas e não voltam ao plano: resumo ≤250 palavras (D13), seção Highlights (D14), template oficial compilando (D15), referências em AMA (D16), declaração de financiamento e conflito de interesse (D17).

---

## 2. Decisões que este plano assume

Cada uma cabe em um token e pode ser revertida sem reescrever o plano.

| Decisão | Valor assumido | Alternativa rejeitada e motivo |
|---|---|---|
| Licença do código | **Apache-2.0** | MIT não tem cláusula de patente; AGPL fecha a porta de uso comercial que o Sifter pode querer depois. Apache exige decisão sobre a patente (D5b) |
| Repositório de dados | **Zenodo** | OSF serve, mas Zenodo emite DOI de conceito e de versão, o que casa com reprodutibilidade por versão |
| Tamanho da amostra cega | **300 pares** (100 incluídos, 200 excluídos) | 150 pares dariam IC largo demais para sensibilidade |
| Semente do sorteio | Fixa e registrada no export | Sem semente, a amostra não é reproduzível |
| Idioma | Inglês | RSM não aceita outro |
| Ordem de autoria | Fabrício primeiro, orientadores depois | Confirmar com eles (T0.1) |
| Prazo alvo | Submissão até **15/01/2027** | Sem prazo da revista (fluxo contínuo), o prazo é o do doutorado |

---

## 3. Calendário

| Sprint | Janela | Entrega |
|---|---|---|
| S0 | 12 a 13/11/2026 | Decisões travadas, baseline medido, checklist de submissão criado |
| S1 | 14 a 20/11/2026 | Proveniência por decisão, licença, repositório público, export de auditoria |
| S2 | 21/11 a 04/12/2026 | E1 executado: 300 pares cegos, WSS, NNR, sensibilidade, especificidade |
| S3 | 05 a 11/12/2026 | E2 (tempo) e baseline ASReview |
| S4 | 12 a 19/12/2026 | Validação externa em protocolo de outra equipe |
| S5 | 20 a 22/12/2026 | Dataset empacotado e depositado no Zenodo com DOI |
| S6 | 05 a 09/01/2027 | Manuscrito fechado, revisão de conformidade, revisão por par |
| S7 | 12 a 14/01/2027 | Submissão no ScholarOne, waiver de APC, acompanhamento |

Recesso de 23/12 a 04/01 é folga, não dependência. Se S2 atrasar, S3 e S4 deslizam e S7 vai para fevereiro.

---

## 4. Tarefas

### Sprint 0 — travas e baseline (2 dias)

#### T0.1 Levar a escolha da RSM ao Marilton e fechar autoria
**Dono:** Fabrício · **Depende de:** nada · **Bloqueia:** T6.1, T7.4
1. Mensagem curta com: estrato A1 (97%), tipo Software Focus, requisitos, custo com waiver, e o fato de que a decisão de 22/10 era esperar o colega.
2. Perguntar três coisas: (a) concordam com a RSM; (b) ordem de autoria; (c) se o Julius entra como coautor.
**Pronto quando:** resposta registrada em `notes/venue-decision.md`, item "Pendências" marcado.

#### T0.2 Confirmar ORCID e dados do autor correspondente
**Dono:** Fabrício · **Depende de:** nada
1. Verificar se existe ORCID; se não, criar em `orcid.org/register`.
2. Anotar nome de publicação, e-mail institucional e afiliação completa na forma que o ScholarOne pede.
**Pronto quando:** ORCID e afiliação escritos em `notes/venue-decision.md`.

#### T0.3 Decidir o estado da patente antes de abrir o código
**Dono:** Fabrício · **Depende de:** nada · **Bloqueia:** T1.1
**Por quê:** a pauta 6 da orientação (patente INPI) segue aberta desde 21/10, e abrir repositório público é ato de divulgação.
**Passo:** decidir entre (a) depositar antes de publicar, (b) publicar sem patente, (c) manter privado e enviar cópia ao revisor.
**Pronto quando:** uma das três está escolhida em `notes/venue-decision.md`.

#### T0.4 Congelar a versão do Sifter que o artigo descreve
**Dono:** filho · **Depende de:** nada
**Arquivos:** `repos/sifter-ai` (tag), `repos/sifter-paper/README.md`
1. Conferir que a árvore está limpa: `git -C repos/sifter-ai status --porcelain` → vazio.
2. Criar tag anotada: `git -C repos/sifter-ai tag -a v3.20.0-rsm -m "versão descrita no artigo (RSM Software Focus)"`.
3. Registrar hash e data no README do artigo.
**Verificação:** `git -C repos/sifter-ai describe --tags` → `v3.20.0-rsm`.
**Por quê:** o artigo cita 3.20.0 e commit `93731e1`; sem tag, o número não é reconstruível.

#### T0.5 Medir o baseline de testes e cobertura
**Dono:** filho · **Depende de:** containers de pé
```bash
cd repos/sifter-ai && docker compose up -d
docker exec sifter-ai-api-1 pytest -q | tail -25
```
**Esperado:** registrar `BASELINE_PYTEST` (coletados/passados/pulados) e `BASELINE_COV` (a linha `TOTAL` do relatório de cobertura, que o `pytest.ini` já emite com `--cov=src`). O artigo afirma 260/259/1 e 75,11%, então o valor medido tem de casar; se não casar, o texto é corrigido, não o número.
**Pronto quando:** os dois números estão no README do artigo.

#### T0.6 Criar o checklist de submissão
**Dono:** filho · **Arquivo:** `repos/sifter-paper/paper/CHECKLIST-SUBMISSAO.md`
Lista de caixas derivada da tabela de requisitos da RSM: resumo ≤250, Highlights, DAS com DOI, licença OSI, código público, ORCID, CRediT, declaração de IA, carta de apresentação, waiver.
**Verificação:** o arquivo existe e cada item aponta para a seção do manuscrito que o cumpre.

---

### Sprint 1 — proveniência, licença e reprodutibilidade (1 semana)

#### T1.1 Criar `LICENSE` com Apache-2.0
**Dono:** orquestrador (escrita em arquivo raiz de repositório alheio) · **Depende de:** T0.3
**Arquivos:** `repos/sifter-ai/LICENSE`, `repos/sifter-ai/README.md`
1. `curl -sL https://www.apache.org/licenses/LICENSE-2.0.txt -o repos/sifter-ai/LICENSE`
2. Acrescentar ao README a linha "Licensed under the Apache License, Version 2.0".
3. Conferir que a licença aparece na lateral do GitHub depois do push.
**Verificação:** `head -3 repos/sifter-ai/LICENSE` → "Apache License" e "Version 2.0".
**Risco:** se T0.3 escolher patentear antes, esta tarefa espera.

#### T1.2 Persistir proveniência por decisão
**Dono:** filho · **Depende de:** nada · **Bloqueia:** T1.3, T2.5, T5.1
**Arquivos:**
- Modificar: `repos/sifter-ai/backend/src/core/models.py` (classe `Decision`)
- Criar: `repos/sifter-ai/backend/migrations/versions/<prefixo>_proveniencia_de_decisao.py`
- Teste: `repos/sifter-ai/backend/tests/test_decision_provenance.py`
1. Escrever teste que cria uma decisão com `model_id`, `prompt_version` e `accessed_at` e relê do banco.
2. Rodar e ver falhar: `docker exec sifter-ai-api-1 pytest -q --no-cov tests/test_decision_provenance.py` → erro de atributo.
3. Acrescentar à classe: `provider: str | None`, `model_id: str | None`, `model_version: str | None`, `prompt_version: str | None`, `accessed_at: datetime | None`.
4. Migração Alembic com as cinco colunas, nullable, sem default inventado.
5. `docker exec sifter-ai-api-1 alembic upgrade head` e rodar o teste de novo.
**Esperado:** 1 passed no arquivo novo; `BASELINE_PYTEST + 1` na suíte completa.
**Regra:** coluna nova nullable porque as 14.219 decisões antigas não têm o dado e não serão reescritas com valor falso.

#### T1.3 Export de auditoria com proveniência
**Dono:** filho · **Depende de:** T1.2
**Arquivos:** `repos/sifter-paper/data/export_auditoria.py`, saída `repos/sifter-paper/data/audit-<AAAA-MM-DD>.csv`
1. Script que lê do Postgres e escreve uma linha por decisão com: project_id, article_id, doi, stage, outcome, rule, provider, model_id, model_version, prompt_version, accessed_at, tokens_in, tokens_out, decided_at.
2. `python3 repos/sifter-paper/data/export_auditoria.py --out data/audit-2026-11-14.csv`
**Verificação:** `wc -l` do CSV ≈ 14.219 + 1; `cut -d, -f7-11 | sort -u | wc -l` mostra quantos modelos distintos existem. **Esse número vira frase no artigo**: se todas as decisões do piloto têm o mesmo modelo, o texto pode afirmar isso; se não, precisa separar por projeto.
**Por quê:** é a métrica que o revisor de pesquisa reproduzível vai olhar.

#### T1.4 Provar instalação limpa em máquina sem estado
**Dono:** filho · **Depende de:** T1.1
1. Num diretório vazio, `curl -O https://raw.githubusercontent.com/fgscaglioni/sifter-ai/main/docker-compose.prod.yml`.
2. `docker compose -f docker-compose.prod.yml up -d` e esperar `curl -s -o /dev/null -w "%{http_code}" http://localhost:8000/docs` → `200`.
3. Rodar `alembic upgrade head` no container e registrar a saída.
**Esperado:** 200 e banco criado do zero, sem `.env` copiado à mão.
**Se falhar:** é o defeito que o RRE encontraria depois do aceite; corrigir agora, não depois.

#### T1.5 Documentar o desenvolvimento dos prompts
**Dono:** filho · **Depende de:** T1.2
**Arquivo:** `repos/sifter-paper/data/prompts.md`
1. Listar as versões de prompt do piloto (`v1`, `v2`, `v3`, conforme P1 a P3), com data, modelo associado e o que mudou entre elas.
2. Citar o arquivo que guarda o texto de cada versão no código.
**Por quê:** o guia exige "como o prompt foi desenvolvido e testado", e a Tabela 2 mostra três configurações diferentes sobre o mesmo corpus. Sem esse histórico, a variação de 12,1% para 22,1% na taxa de inclusão fica sem explicação.

#### T1.6 Congelar e documentar a semente do sorteio
**Dono:** filho · **Depende de:** nada
**Arquivos:** `repos/sifter-paper/data/README.md`, `repos/sifter-paper/data/seed.txt`
Ao gerar a amostra em T2.1, gravar a semente usada em `seed.txt` e citá-la no artigo.
**Verificação:** `sha256sum data/seed.txt` registrado no README.

---

### Sprint 2 — E1, o estudo que destrava o artigo (2 semanas)

#### T2.1 Regerar a amostra cega com semente explícita
**Dono:** filho · **Depende de:** T1.2 (para o export casar)
**Armadilha do script:** ele nomeia a saída pelo **número de linhas**, não pelo prefixo. Rodar com `--prefixo amostra-cega-2026-11` grava `amostra-cega-2026-11-300.csv` e `gabarito-300.csv` no diretório atual, e o segundo **sobrescreve** o gabarito antigo. Por isso a amostra nova nasce em subdiretório próprio.
```bash
cd 01-Projects/SifterAI/artigo/medicoes
mkdir -p e1-2026-11 && cd e1-2026-11
python3 ../gerar_amostra_cega.py --project 45 --n 300 --prefixo amostra
```
**Esperado:** `amostra-300.csv` (300 linhas, sem coluna de IA) e `gabarito-300.csv` (300 linhas `id;ia_decision`), com 100 incluídos e 200 excluídos.
**Verificação:** `awk -F';' 'NR>1{print $2}' gabarito-300.csv | sort | uniq -c` e `wc -l *.csv`.
**Nota:** a amostra antiga da raiz de `medicoes/` fica intocada como histórico.

#### T2.2 Triagem cega dos 300 registros, cronometrada
**Dono:** Fabrício · **Depende de:** T2.1 · **Bloqueia:** T2.3
**Como:** preencher a coluna `manual_decision` em `e1-2026-11/amostra-300.csv` sem abrir o `gabarito-300.csv`, em 2 a 3 sessões. Marcar hora de início e fim de cada sessão e pausas.
**Estimativa:** 1 a 2 min por registro, 5 a 10 h no total.
**Arquivo de tempo:** `data/tempo-sessoes.csv` com `sessao,inicio,fim,pausas_min,registros`.
**Por que cronometrado:** é o mesmo dado que alimenta o E2 (D2). Duas deficiências, uma sessão de trabalho.

#### T2.3 Calcular concordância, WSS e NNR
**Dono:** filho · **Depende de:** T2.2
```bash
cd /home/fabricio/vault/01-Projects/SifterAI/artigo/medicoes/e1-2026-11
python3 ../calcular_kappa.py --revisor amostra-300.csv --gabarito gabarito-300.csv --saida relatorio-e1.md
python3 ../analisar_e2_e4.py --tempo /home/fabricio/vault/repos/sifter-paper/data/tempo-sessoes.csv
```
**Esperado:** relatório com κ, IC bootstrap, matriz 2x2, sensibilidade e especificidade; o valor **não tem meta**, é registrado como sair.
**WSS:** calcular como proporção de registros que a IA excluiu e que o humano também excluiria, sobre o total que o humano precisaria ler sem automação. Fórmula escrita no relatório antes de rodar.
**NNR:** registros lidos para cada incluído = (excluídos que sobraram após a primeira passada + incluídos) / incluídos.

#### T2.4 Atualizar a Tabela 4 e criar a tabela de WSS e NNR
**Dono:** filho · **Depende de:** T2.3
**Arquivos:** `repos/sifter-paper/paper/sections/04-evaluation.tex`
1. Substituir a linha P4 da Tabela 4 pelos números do E1 novo, mantendo os três projetos antigos como piloto.
2. Criar a tabela de WSS e NNR logo depois da Tabela 4 (a numeração desloca a tabela de conformidade do guia para 6; as referências cruzadas são por `\ref`, então nada quebra à mão).
3. Reescrever a Seção 4.6 ("What has not been measured") para o que ainda faltar de fato.
**Verificação:** `make` com 0 overfull; as quatro métricas citadas existem no texto e na tabela.

#### T2.5 Reportar o protocolo do estudo dentro do artigo
**Dono:** filho · **Depende de:** T2.3
**Arquivo:** `paper/sections/04-evaluation.tex`, subseção "Blind agreement study"
Conteúdo obrigatório: de onde veio o corpus, como a amostra foi sorteada (1/3 incluídos, semente), quem triou, se houve cegamento, qual foi o padrão de referência, e a limitação de ser um revisor só.
**Por quê:** é o item que o parecerista usa para julgar se o estudo é replicável.

---

### Sprint 3 — tempo de revisor e baseline (1 semana)

#### T3.1 Medir triagem assistida contra triagem manual
**Dono:** Fabrício · **Depende de:** T2.2
**Desenho:** duas sessões de 50 registros cada, mesma pessoa, mesmo protocolo: uma sem primeira passada automática, outra com. Cronometrar.
**Arquivo:** `data/tempo-sessoes.csv` ganha duas linhas novas com `modo=manual` e `modo=assistido`.
**Pronto quando:** existe diferença de tempo por registro entre os dois modos.

#### T3.2 Calcular horas economizadas por 1.000 registros
**Dono:** filho · **Depende de:** T3.1
**Cálculo:** (tempo_manual − tempo_assistido) × 1.000, com IC pela dispersão observada.
**Onde entra:** Tabela 5 e frase da conclusão hoje genérica ("small against the reviewer time it displaces") vira número.

#### T3.3 Baseline ASReview no mesmo corpus
**Dono:** filho · **Depende de:** T2.1 · opcional se o prazo apertar
1. Instalar ASReview em ambiente isolado e importar os 4.670 registros do projeto 45 em RIS.
2. Rodar com 100 sementes (as mesmas 100 inclusões da amostra) e registrar a curva de recall.
**Esperado:** recall a 50% e a 100% do corpus lido, para comparação qualitativa.
**Custo:** 2 a 4 h de máquina. **Se não rodar:** o artigo diz que o baseline é ASReview e cita o desempenho publicado, sem comparação própria, e isso entra como limitação.

---

### Sprint 4 — validação externa (1 semana)

#### T4.1 Escolher o corpus externo
**Dono:** orquestrador · **Depende de:** nada
**Candidatos:** o corpus do censo TIIRE 2026 (`01-Projects/SifterAI/artigo/corpus-tiire-2026.csv`) não serve, porque é de outra natureza. Melhor: pedir a um colega do PPGC um protocolo e uma lista de registros de uma revisão real, ou usar uma revisão publicada com apêndice de estudos incluídos e reconstruir os registros por DOI.
**Pronto quando:** existe um conjunto de registros + critérios que não foi produzido pelo autor do Sifter.

#### T4.2 Rodar o Sifter no protocolo externo
**Dono:** filho · **Depende de:** T4.1, T1.2
1. Criar projeto novo no Sifter, colar o protocolo externo, importar os registros.
2. Rodar a triagem e exportar decisões com proveniência.
**Verificação:** export com `project_id` novo e contagem igual ao número de registros importados.

#### T4.3 Comparar com o gabarito externo
**Dono:** filho · **Depende de:** T4.2
**Esperado:** sensibilidade e especificidade no corpus externo, ao lado das do corpus interno, na mesma tabela.
**Regra de honestidade:** se o desempenho externo for pior, isso é resultado, não motivo para mudar a amostra.

---

### Sprint 5 — dados e DOI (3 dias)

#### T5.1 Empacotar o dataset
**Dono:** filho · **Depende de:** T1.3, T2.3, T4.3
**Conteúdo:** export de auditoria, amostra cega preenchida, gabarito, semente, `prompts.md`, `tempo-sessoes.csv`, dicionário de dados em `data/README.md`.
**Regra:** nenhuma chave de API, nenhum `.env`, nenhum e-mail de usuário. Verificar com `grep -riE "api[_-]?key|secret|token=" data/`.

#### T5.2 Depositar no Zenodo
**Dono:** Fabrício (conta) com apoio do orquestrador · **Depende de:** T5.1
1. Criar depósito, subir o `.zip`, preencher metadados (título, autores, licença CC-BY-4.0, versão).
2. Publicar e copiar o DOI.
**Pronto quando:** DOI existe e resolve para a página do depósito.

#### T5.3 Preencher o Data and Code Availability Statement
**Dono:** filho · **Depende de:** T5.2, T1.1
**Arquivo:** `paper/sections/06-conclusion.tex`, seção "*Data and Code Availability Statement*"
Substituir os três placeholders por: URL do código, DOI do dataset, e a frase sobre modelo/versão/data de acesso registrados por decisão.

---

### Sprint 6 — manuscrito fechado (1 semana)

#### T6.1 Preencher autoria e afiliação
**Dono:** filho · **Depende de:** T0.1
**Arquivo:** `paper/main.tex`
Acrescentar coautores com `\author[1]{}`, ajustar `\authormark`, incluir e-mails e a ordem acordada. Remover os comentários `TODO`.

#### T6.2 Declaração de uso de IA
**Dono:** filho · **Depende de:** nada
**Arquivo:** `paper/sections/06-conclusion.tex`, seção "*Use of Artificial Intelligence Tools*"
Separar duas coisas que o revisor vai cobrar que estejam separadas: (a) uso de IA para redigir ou revisar o manuscrito, com ferramenta e finalidade; (b) uso de IA como objeto do estudo, que é o Sifter.
**Verificação:** as duas alíneas existem e nenhuma afirma uso não ocorrido.

#### T6.3 Revisão de conformidade com o guia de IA generativa
**Dono:** orquestrador · **Depende de:** T2.5, T3.2, T4.3
Percorrer os cinco blocos do guia (desenho, avaliação, validação, reprodutibilidade, transparência) e marcar cada item como cumprido na seção X ou pendente. Atualizar a tabela de conformidade do manuscrito (a que perde um número com a entrada da tabela de WSS).
**Verificação:** zero linha "outstanding" que não esteja também declarada como limitação no texto.

#### T6.4 Revisão por par interno
**Dono:** orquestrador (delega ao perfil `writer` ou usa a skill `conselho-de-redacao`)
**Prompt:** revisar o PDF como parecerista da RSM, apontando o que recusaria e por quê, com foco em: contribuição além da descrição, clareza para leitor de outra área, solidez do E1, e aderência ao guia.
**Entregável:** lista de achados priorizada. Aplicar o que fizer sentido; o que não for aplicado fica registrado com motivo.

#### T6.5 Fechamento técnico
**Dono:** filho
`make` limpo, 0 overfull, `pdftotext | wc -w` entre 4.500 e 7.000 palavras, PDF sem comentário `TODO` residual: `grep -rn "TODO" paper/` → vazio.

---

### Sprint 7 — submissão (3 dias)

#### T7.1 Conta no ScholarOne e vínculo do ORCID
**Dono:** Fabrício · **Depende de:** T0.2
`https://mc.manuscriptcentral.com/researchsynthesis` — criar conta, vincular ORCID.

#### T7.2 Carta de apresentação
**Dono:** filho · **Arquivo:** `repos/sifter-paper/paper/cover-letter.md`
Conteúdo: tipo de artigo (Software Focus), uma frase de contribuição, uma de adequação ao escopo, declaração de que não há submissão duplicada, conflito de interesse, e pedido explícito de waiver de APC por ausência de financiamento.

#### T7.3 Pedido de waiver
**Dono:** Fabrício · **Depende de:** T7.1
No fluxo do ScholarOne ou por e-mail ao escritório editorial, declarando ausência de acordo transformativo e de financiamento para APC.

#### T7.4 Submeter
**Dono:** Fabrício · **Depende de:** T0.1, T6.5, T7.2
Arquivos: `main.tex`, `main.pdf`, `references.bib`, figuras, dataset (DOI), código (URL + tag `v3.20.0-rsm`).
**Pronto quando:** existe número de submissão. Registrar em `notes/venue-decision.md`.

#### T7.5 Acompanhamento
**Dono:** orquestrador
Criar cron semanal para checar o status no ScholarOne e avisar o Fabrício quando mudar de "Under Review".

---

## 5. Dependências entre tarefas

```
T0.1 ─┬─> T6.1 ─┐
T0.2 ─┼─────────┼─> T7.4
T0.3 ─> T1.1 ───┤
T1.2 ─┬─> T1.3 ─┼─> T5.1 ─> T5.2 ─> T5.3
      ├─> T2.5 ─┤
      └─> T4.2 ─┘
T2.1 ─> T2.2 ─> T2.3 ─> T2.4, T2.5
T2.2 ─> T3.1 ─> T3.2
T4.1 ─> T4.2 ─> T4.3
```

Caminho crítico: **T2.1 → T2.2 → T2.3 → T2.4**. T2.2 é trabalho humano de 5 a 10 h e é o único passo que não aceita paralelização.

---

## 6. Riscos

| Risco | Probabilidade | Efeito | Mitigação |
|---|---|---|---|
| E1 mostrar desempenho ruim (κ baixo no corpus novo) | Média | O artigo muda de tese: passa a reportar falha de configuração, não sucesso | Já está previsto: o texto atual admite que a configuração é orientada a recall; o resultado negativo vira achado e a submissão continua |
| Fabrício não conseguir 10 h de triagem cega antes de dezembro | Média | S2 desliza | Reduzir para 200 pares com poder declarado, ou empurrar S7 para fevereiro |
| Licença travada pela decisão de patente | Média | Bloqueia S1 e a política de código | Escolher T0.3 na primeira semana; manter repositório privado e enviar cópia ao revisor é caminho aceito pela revista |
| Zenodo exigir anonimização de dado de revisão | Baixa | Atraso em S5 | Dados são de artigos publicados e decisões de triagem, sem dado pessoal |
| RSM recusar por escopo | Baixa | Perde 3 a 6 meses | Alternativas já mapeadas: JSS (A1, 88%) e IST (A1, 88%), com reenquadramento |

---

## 7. Definição de pronto

O plano termina quando os oito itens abaixo são verdadeiros ao mesmo tempo:

1. `make` gera `paper/main.pdf` com 0 overfull e sem `TODO`.
2. Tabela 4 tem a linha do E1 novo e existe a tabela de WSS, NNR, sensibilidade e especificidade.
3. `data/` contém export de auditoria, amostra preenchida, semente e `prompts.md`, sem credencial.
4. `sifter-ai` tem `LICENSE`, tag `v3.20.0-rsm` e instalação limpa comprovada.
5. Dataset publicado no Zenodo com DOI citado no manuscrito.
6. Conformidade com o guia de IA generativa sem linha pendente não declarada como limitação.
7. Autoria, ORCID e declaração de IA preenchidos.
8. Submissão feita, com número registrado.

## Conexões

`01-Projects/SifterAI/SifterAI - Mapa de periodicos para o artigo (2026-11-11).md` · `notes/venue-decision.md` · `paper/CHECKLIST-SUBMISSAO.md`
