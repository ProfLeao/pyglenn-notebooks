=========================================
pyglenn Labbook — Ejemplos Termoquímicos Resueltos
=========================================

Colección de diez cuadernos Jupyter elaborados y autocontenidos que demuestran
el calculador de propiedades termoquímicas `pyglenn <https://github.com/ProfLeao/pyglenn>`_.
``pyglenn`` reconstruye las propiedades molares en estado estándar
:math:`C_p^\circ(T)`, :math:`H^\circ(T)` y :math:`S^\circ(T)` a partir de
**coeficientes polinomiales de la NASA (Glenn)** almacenados en una base de
datos SQLite empaquetada (~2030 especies, 3772 intervalos de temperatura).

----

Instalación
===========

Instale ``pyglenn`` y sus bibliotecas científicas complementarias:

.. code-block:: bash

   pip install pyglenn
   pip install numpy pandas matplotlib scipy

O usando conda / mamba:

.. code-block:: bash

   conda install -c conda-forge pyglenn numpy pandas matplotlib scipy

----

.. toctree::
   :maxdepth: 1
   :caption: Cuadernos

   01_primeros_pasos
   02_polinomios_nasa
   03_curvas_propiedades
   04_entalpia_formacion
   05_entalpias_reaccion
   06_temperatura_llama_adiabatica
   07_comparacion_biocombustibles
   08_equilibrio_gibbs
   09_ciclo_brayton
   10_proveedor_propiedades

----

Citación
========

Si utiliza este repositorio en su investigación o docencia, por favor cítelo vía Zenodo:

  Gonçalves Leão Junior, R. (2026). *pyglenn-notebooks*. Zenodo. https://doi.org/10.5281/zenodo.21324685
