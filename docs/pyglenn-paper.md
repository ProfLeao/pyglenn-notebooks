---
title: "pyglenn-notebooks"
author: "Dr. Reginaldo G. Leão Jr. — GESESC / IFMG"
date: "July 2026"
abstract: |
  This paper presents the **pyglenn-notebooks** repository, a curated collection of ten self-contained Jupyter notebooks that demonstrate the capabilities of `pyglenn`, a lightweight Python library for computing standard-state molar thermodynamic properties from NASA (Glenn) polynomial coefficients. The repository encompasses topics ranging from fundamental property retrieval to advanced applications in combustion, biofuels, gas-turbine cycles, chemical equilibrium, and computational fluid dynamics (CFD). By combining an accessible pedagogical structure with rigorous scientific computation, the collection serves as both an educational resource and a practical reference for researchers and engineers in thermal sciences.
geometry: margin=2.5cm
fontsize: 11pt
---

# pyglenn-notebooks

## 1. Introduction

Accurate thermochemical data are essential for modeling reactive flows, designing combustion systems, and performing equilibrium calculations in chemical engineering. The NASA (Glenn) polynomial representation is one of the most widely adopted formats in computational combustion and aerothermochemistry, employed by codes such as Cantera, Chemkin, and OpenFOAM. These polynomials encode the temperature-dependent behavior of the constant-pressure molar heat capacity $C_p^\circ(T)$, the standardized molar enthalpy $H^\circ(T)$, and the molar entropy $S^\circ(T)$ across piecewise temperature intervals for thousands of chemical species.

The `pyglenn` library [1] provides a lightweight, dependency-free Python interface to a bundled SQLite database containing NASA polynomial coefficients for approximately 2,030 species spanning 3,772 temperature intervals. Unlike larger thermochemical frameworks that require complex installation procedures and numerous dependencies, `pyglenn` is installable with a single `pip` command and requires only the Python standard library at runtime.

The **pyglenn-notebooks** repository complements the core library by offering ten worked examples that progressively build the user's understanding—from basic property lookups to sophisticated multi-species equilibrium and cycle analyses. This paper describes the scope, theoretical grounding, and practical outcomes of the repository.

# 2. Theoretical Background

## 2.1 NASA (Glenn) Polynomial Formulation

The NASA polynomial representation expresses the three fundamental molar properties as functions of temperature using a 14-coefficient scheme (seven coefficients per interval, with two temperature ranges). For a given interval, the dimensionless forms are:

$$\frac{C_p^\circ}{R} = a_1 + a_2 T + a_3 T^2 + a_4 T^3 + a_5 T^4$$

$$\frac{H^\circ}{RT} = a_1 + \frac{a_2}{2}T + \frac{a_3}{3}T^2 + \frac{a_4}{4}T^3 + \frac{a_5}{5}T^4 + \frac{a_6}{T}$$

$$\frac{S^\circ}{R} = a_1 \ln T + a_2 T + \frac{a_3}{2}T^2 + \frac{a_4}{3}T^3 + \frac{a_5}{4}T^4 + a_7$$

where $R$ is the universal gas constant, and coefficients $a_1$ through $a_7$ are fitted for each species over a low-temperature and a high-temperature interval, with $a_6$ and $a_7$ carrying the integration constants $b_1$ and $b_2$ that embed the enthalpy and entropy of formation.

## 2.2 Thermodynamic Relationships

The notebooks leverage fundamental thermodynamic identities throughout:

- **Reaction enthalpy** via Hess's law: $\Delta H_\text{rxn}(T) = \sum \nu_i H_i^\circ(T)$, where $\nu_i$ are stoichiometric coefficients (negative for reactants, positive for products).
- **Gibbs free energy**: $G^\circ(T) = H^\circ(T) - T S^\circ(T)$, the central quantity for chemical equilibrium.
- **Equilibrium constant**: $K(T) = \exp(-\Delta G^\circ(T) / RT)$, computed directly from `pyglenn` property outputs.
- **Adiabatic flame temperature**: solved by equating the total enthalpy of reactants (at the initial temperature) to the total enthalpy of products (at the unknown adiabatic temperature), using an iterative root-finding scheme.

## 2.3 Applications

The theoretical framework is applied across four major domains:

1. **Combustion**: computing lower and higher heating values (LHV/HHV), adiabatic flame temperatures, and equivalence-ratio sensitivity for hydrocarbons and oxygenated fuels.
2. **Biofuels**: comparative analysis of ethanol, methanol, gasoline, and jet fuel—covering energy density, air–fuel ratio, and CO$_2$ emission intensity.
3. **Power cycles**: air-standard Brayton cycle analysis using real temperature-dependent $C_p(T)$ instead of the cold-air-standard approximation, with isentropic state determination via entropy matching.
4. **Chemical kinetics support**: batch generation of property tables and cached coefficient lookups suitable as inputs to CFD solvers and ODE-based kinetic integrators.

# 3. Results

The repository is structured as ten sequentially ordered notebooks, each building on concepts introduced earlier.

**Notebook 01 — Getting Started** establishes the workflow: connecting to the bundled database, searching for species by name or formula, and computing $C_p^\circ$, $H^\circ$, and $S^\circ$ at a single temperature. A robust `species_id` helper function is introduced for exact-name lookups, along with error-handling patterns.

**Notebook 02 — NASA Polynomials Under the Hood** demystifies the numerical machinery by implementing the 9-term polynomial evaluation from scratch and validating the results against `pyglenn`'s built-in API. The piecewise nature of the intervals and the meaning of the integration constants $b_1$ and $b_2$ are explained with worked numerical examples.

**Notebook 03 — Temperature-Dependent Properties & Plotting** generates $C_p(T)$, $H(T)$, and $S(T)$ curves for selected species, illustrating equipartition behavior and the vibrational excitation that causes heat capacity to rise with temperature. Property tables are constructed using `pandas`.

**Notebook 04 — Enthalpy of Formation** recovers $\Delta_f H^\circ$ from the standardized `h_relative` output at 298.15 K and validates results against literature values.

**Notebook 05 — Reaction Enthalpies & Heats of Combustion** applies stoichiometric summation to compute $\Delta H_\text{rxn}(T)$ for representative combustion reactions, deriving LHV and HHV values.

**Notebook 06 — Adiabatic Flame Temperature** implements an energy-balance root-finding loop to determine $T_\text{ad}$ for methane–air combustion, exploring the effects of equivalence ratio and reactant preheat.

**Notebook 07 — Comparing Fuels & Biofuels** provides a systematic side-by-side comparison of conventional and renewable fuels on multiple performance metrics, directly supporting sustainability-oriented engineering decisions.

**Notebook 08 — Chemical Equilibrium & Gibbs Free Energy** computes $G^\circ(T)$ for all species, evaluates equilibrium constants $K(T)$ for the water-gas shift reaction, and demonstrates the van't Hoff equation for temperature extrapolation.

**Notebook 09 — Brayton Gas-Turbine Cycle** models the air-standard Brayton cycle with real $C_p(T)$ data, determines isentropic states by matching entropy across compressor and turbine stages, and plots thermal efficiency as a function of pressure ratio.

**Notebook 10 — Property Provider for CFD & Chemical Kinetics** demonstrates batch-mode operation for generating large property tables, implements a cached coefficient provider for performance benchmarking, and showcases a simple ODE integration using temperature-dependent thermodynamic input.

All notebooks are pre-executed and committed with visible outputs. The documentation is built with Sphinx and the Read the Docs theme, hosted via GitHub Pages, and regenerated automatically on every push to the main branch through a GitHub Actions continuous-deployment pipeline.

# 4. Conclusion

The **pyglenn-notebooks** repository successfully bridges the gap between a lightweight thermochemical library and practical engineering education. By providing ten fully worked, self-contained Jupyter notebooks, it enables students, researchers, and practicing engineers to:

- Quickly retrieve and interpret standard-state thermodynamic properties for over 2,000 chemical species;
- Understand the mathematical foundation of the NASA polynomial representation and its integration constants;
- Apply thermodynamic principles to real-world problems in combustion, biofuel assessment, gas-turbine cycles, and chemical equilibrium;
- Generate property data suitable for integration with CFD solvers and chemical kinetics codes.

The repository's open-source nature, automated documentation deployment, and progressive pedagogical design make it a valuable contribution to the thermal-sciences community. Future work may extend the collection to include rocket propulsion thermochemistry, detonation calculations, and direct integration with the Cantera library for coupled transport-property analysis.

---

## References

[1] R. G. Leão Jr., *pyglenn: A lightweight thermochemical properties calculator from NASA polynomials*. GitHub repository. Available at: [https://github.com/ProfLeao/pyglenn](https://github.com/ProfLeao/pyglenn).

[2] B. J. McBride, M. J. Zehe, and S. Gordon, *NASA Glenn Coefficients for Calculating Thermodynamic Properties of Individual Species*, NASA/TP—2002-211556, 2002.

[3] S. R. Turns, *An Introduction to Combustion: Concepts and Applications*, 3rd ed., McGraw-Hill, 2011.
