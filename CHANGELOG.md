# Changelog

Todas as mudanças notáveis do pyglenn estão documentadas neste arquivo.

---

## [0.1.13] — 2026-07-22

### Corrigido
- Ruff format em `calculator.py` (CI)

## [0.1.12] — 2026-07-22

### Corrigido
- `cli.py`: import faltante de `ThermoCalcError` (ruff F821)
- Removido diretório `Correcoes/` do repositório

## [0.1.11] — 2026-07-22

### Corrigido
- `thermo.db` removido do tracking git na raiz (duplicata de `src/pyglenn/data/`)
- 11 `assert` em `builder.py` e `database.py` substituídos por `RuntimeError` (seguro com `python -O`)
- `docs/` removido do `MANIFEST.in` (reduz tamanho do sdist)
- `cli.py` incluído na cobertura de testes

## [0.1.10] — 2026-07-22

### Adicionado
- `get_available_species(name, exact_match=False)`: parâmetro para busca exata case-insensitive
- `TemperatureOutOfRangeError`, `SpeciesNotFoundError`, `DatabaseNotConnectedError`: exceções específicas

### Alterado (⚠️ breaking)
- `calculate_properties()` agora lança exceções em vez de retornar `None`

### Corrigido
- **Inconsistência 1 (CRÍTICA):** `get_available_species('N2')` retornava `Be3N2(L)` — `LIKE '%name%'` + `LIMIT 20`
- **Inconsistência 2 (ALTA):** `calculate_properties(sid, 1000.0)` retornava `None` em fronteiras de intervalo
- **Inconsistência 3 (MÉDIA):** ordenação não priorizava matches exatos
- **Inconsistência 4 (BAIXA):** comportamento não determinístico na seleção de intervalo

### Documentação
- README, index.rst, usage.rst, paper.md atualizados com `exact_match=True`
- Notebooks `01_basic_usage` e `02_fuel_comparison` atualizados
- `resolve_id()` removido do notebook 02 (substituído por `exact_match=True`)

### Testes
- +6 testes: fronteiras (200, 1000, 6000 K), exact_match, find_species

## [0.1.9] — versão anterior (pip)

### Problemas conhecidos (corrigidos na 0.1.10)
- `get_available_species()` retorna espécie errada (LIKE + LIMIT 20)
- `calculate_properties()` retorna None em T de fronteira
- Ordenação imprevisível dos resultados
- Comportamento não determinístico

---

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/),
e este projeto segue [Semantic Versioning](https://semver.org/lang/pt-BR/).
