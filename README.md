# pyglenn — Worked Examples (Jupyter Notebooks)

[![Docs](https://github.com/ProfLeao/pyglenn-notebooks/actions/workflows/docs.yml/badge.svg)](https://profleao.github.io/pyglenn-notebooks)

📖 **Documentation:** [profleao.github.io/pyglenn-notebooks](https://profleao.github.io/pyglenn-notebooks)

A collection of eleven elaborated, self-contained Jupyter notebooks demonstrating
the [`pyglenn`](https://github.com/ProfLeao/pyglenn) thermochemical properties
calculator. `pyglenn` reconstructs the standard-state molar properties
$C_p^\circ(T)$, $H^\circ(T)$ and $S^\circ(T)$ from **NASA (Glenn) polynomial
coefficients** stored in a bundled SQLite database (~2030 species, 3772
temperature intervals).

The topics follow the applications outlined in the package's `ideias.md`
(Dr. Reginaldo G. Leão Jr., GESESC / IFMG): combustion, biofuels, thermodynamic
cycles, chemical equilibrium and CFD/kinetics property provision.

<img src="images/pyglenn-overview.png" alt="pyglenn overview" width="300"/>

## Requirements

```bash
# pip
pip install pyglenn
pip install numpy pandas matplotlib scipy   # used for plots, tables and solvers

# conda / mamba
conda install -c conda-forge pyglenn numpy pandas matplotlib scipy
```

Every notebook opens with the same short preamble that connects to the bundled
database and defines a robust `species_id(calc, name)` helper for exact-name
lookups.

## The notebooks

| # | Notebook | What it covers |
|---|---------------|----------------|
| 01 | [Getting Started](notebooks/en/01_getting_started.ipynb) | Connecting, searching species, computing $C_p$/$H$/$S$, interpreting the returned values, error handling |
| 02 | [NASA Polynomials Under the Hood](notebooks/en/02_nasa_polynomials.ipynb) | The 9-term polynomial math; reproducing the API from raw coefficients; piecewise intervals; meaning of $b_1, b_2$ |
| 03 | [Temperature-Dependent Properties & Plotting](notebooks/en/03_property_curves.ipynb) | $C_p(T)$, $S(T)$, $H(T)$ curves; equipartition and vibrational excitation; property tables with pandas |
| 04 | [Enthalpy of Formation from NASA Polynomials](notebooks/en/04_formation_enthalpy.ipynb) | Recovering $\Delta_f H^\circ$ from the standardized enthalpy; validation against literature |
| 05 | [Reaction Enthalpies & Heats of Combustion](notebooks/en/05_reaction_enthalpies.ipynb) | $\Delta H_\mathrm{rxn}(T)$, LHV/HHV, Kirchhoff's law, Hess's law |
| 06 | [Adiabatic Flame Temperature](notebooks/en/06_adiabatic_flame_temperature.ipynb) | Energy-balance solve for $T_\mathrm{ad}$; equivalence ratio, preheat, fuel comparison |
| 07 | [Comparing Fuels & Biofuels](notebooks/en/07_biofuel_comparison.ipynb) | Ethanol / methanol / gasoline / jet-fuel: energy density, air-fuel ratio, CO₂ intensity (a GESESC use case) |
| 08 | [Chemical Equilibrium & Gibbs Free Energy](notebooks/en/08_equilibrium_gibbs.ipynb) | $G^\circ = H^\circ - TS^\circ$; $K(T)$; water-gas shift; van't Hoff; high-T dissociation |
| 09 | [Brayton Gas-Turbine Cycle](notebooks/en/09_brayton_cycle.ipynb) | Air-standard Brayton with real $C_p(T)$; isentropic states via entropy; efficiency vs pressure ratio |
| 10 | [Property Provider for CFD & Chemical Kinetics](notebooks/en/10_property_provider.ipynb) | Batch tables, a cached coefficient provider, a benchmark, and an ODE integration |
| 11 | [Comparing Thermodynamic Data Sources](notebooks/en/11_thermodynamic_data_comparison.ipynb) | NASA polynomials vs NIST vs conventional tables for H₂O(g); side-by-side Cp/S/H comparison, benchmark and discrepancy analysis |

## A note on the data

* `pyglenn`'s `h_relative` (`calculate_properties(...)['h_relative']`) is the
  **standardized** molar enthalpy on the NASA scale — it already **includes the
  enthalpy of formation**. Consequently reference-state elements read
  $H^\circ(298.15\,\mathrm{K}) \approx 0$, compounds read their
  $\Delta_f H^\circ$, and reaction enthalpies are simple stoichiometric sums.
* In the bundled database the dedicated `heat_of_formation_298K` column is not
  populated, so `calculate_formation_enthalpy()` returns `None`. Notebook 04
  shows how to obtain $\Delta_f H^\circ$ from `h_relative` at 298.15 K instead.

## Reproducing

The notebooks are committed with their outputs already executed. To re-run:

```bash
jupyter nbconvert --to notebook --execute --inplace notebooks/en/*.ipynb
```

## Citing

If you use this repository in your research or teaching, please cite it via Zenodo:

> Gonçalves Leão Junior, R. (2026). *pyglenn-notebooks*. Zenodo. https://doi.org/10.5281/zenodo.21324685

**BibTeX:**

```bibtex
@software{goncalves_leao_junior_2026_21324685,
  author       = {Gonçalves Leão Junior, Reginaldo},
  title        = {pyglenn-notebooks},
  month        = jul,
  year         = 2026,
  publisher    = {Zenodo},
  doi          = {10.5281/zenodo.21324685},
  url          = {https://doi.org/10.5281/zenodo.21324685},
}
```
