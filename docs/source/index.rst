=========================================
pyglenn Labbook — Thermochemical Worked Examples
=========================================

A collection of ten elaborated, self-contained Jupyter notebooks demonstrating
the `pyglenn <https://github.com/ProfLeao/pyglenn>`_ thermochemical properties
calculator. ``pyglenn`` reconstructs the standard-state molar properties
:math:`C_p^\circ(T)`, :math:`H^\circ(T)` and :math:`S^\circ(T)` from **NASA (Glenn) polynomial
coefficients** stored in a bundled SQLite database (~2030 species, 3772
temperature intervals).

----

Installation
============

Install ``pyglenn`` and its companion scientific libraries:

.. code-block:: bash

   pip install pyglenn
   pip install numpy pandas matplotlib scipy

Or, using conda / mamba:

.. code-block:: bash

   conda install -c conda-forge pyglenn numpy pandas matplotlib scipy
   # or, using the conda-forge channel specifier:
   conda install conda-forge::pyglenn numpy pandas matplotlib scipy

To install from source:

.. code-block:: bash

   git clone https://github.com/ProfLeao/pyglenn.git
   cd pyglenn
   pip install .

----

.. toctree::
   :maxdepth: 1
   :caption: Notebooks
   :hidden:

   Getting Started <01_getting_started>
   NASA Polynomials Under the Hood <02_nasa_polynomials>
   Temperature-Dependent Properties & Plotting <03_property_curves>
   Enthalpy of Formation from NASA Polynomials <04_formation_enthalpy>
   Reaction Enthalpies & Heats of Combustion <05_reaction_enthalpies>
   Adiabatic Flame Temperature <06_adiabatic_flame_temperature>
   Comparing Fuels & Biofuels <07_biofuel_comparison>
   Chemical Equilibrium & Gibbs Free Energy <08_equilibrium_gibbs>
   Brayton Gas-Turbine Cycle <09_brayton_cycle>
   Property Provider for CFD & Chemical Kinetics <10_property_provider>

----

.. toctree::
   :maxdepth: 1
   :caption: About

   about

About the data
==============

* ``pyglenn``'s ``h_relative`` (``calculate_properties(...)['h_relative']``) is the
  **standardized** molar enthalpy on the NASA scale — it already **includes the
  enthalpy of formation**. Consequently reference-state elements read
  :math:`H^\circ(298.15\,\mathrm{K}) \approx 0`, compounds read their
  :math:`\Delta_f H^\circ`, and reaction enthalpies are simple stoichiometric sums.
* In the bundled database the dedicated ``heat_of_formation_298K`` column is not
  populated, so ``calculate_formation_enthalpy()`` returns ``None``. Notebook 04
  shows how to obtain :math:`\Delta_f H^\circ` from ``h_relative`` at 298.15 K instead.

----

Citing
======

If you use this repository in your research or teaching, please cite it via Zenodo:

  Gonçalves Leão Junior, R. (2026). *pyglenn-notebooks*. Zenodo. https://doi.org/10.5281/zenodo.21324685
