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

To install from source:

.. code-block:: bash

   git clone https://github.com/ProfLeao/pyglenn.git
   cd pyglenn
   pip install .

----

.. toctree::
   :maxdepth: 1
   :caption: Notebooks

   01_getting_started
   02_nasa_polynomials
   03_property_curves
   04_formation_enthalpy
   05_reaction_enthalpies
   06_adiabatic_flame_temperature
   07_biofuel_comparison
   08_equilibrium_gibbs
   09_brayton_cycle
   10_property_provider

----

Citing
======

If you use this repository in your research or teaching, please cite it via Zenodo:

  Gonçalves Leão Junior, R. (2026). *pyglenn-notebooks*. Zenodo. https://doi.org/10.5281/zenodo.21324685
