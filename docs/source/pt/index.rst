=========================================
pyglenn Labbook — Exemplos Termoquímicos Resolvidos
=========================================

Coleção de dez cadernos Jupyter elaborados e autocontidos que demonstram
o calculador de propriedades termoquímicas `pyglenn <https://github.com/ProfLeao/pyglenn>`_.
``pyglenn`` reconstrói as propriedades molares no estado padrão
:math:`C_p^\circ(T)`, :math:`H^\circ(T)` e :math:`S^\circ(T)` a partir de
**coeficientes polinomiais da NASA (Glenn)** armazenados em um banco de
dados SQLite empacotado (~2030 espécies, 3772 intervalos de temperatura).

----

Instalação
==========

Instale o ``pyglenn`` e suas bibliotecas científicas complementares:

.. code-block:: bash

   pip install pyglenn
   pip install numpy pandas matplotlib scipy

Ou usando conda / mamba:

.. code-block:: bash

   conda install -c conda-forge pyglenn numpy pandas matplotlib scipy

----

.. toctree::
   :maxdepth: 1
   :caption: Cadernos

   01_primeiros_passos
   02_polinomios_nasa
   03_curvas_propriedades
   04_entalpia_formacao
   05_entalpias_reacao
   06_temperatura_chama_adiabatica
   07_comparação_biocombustiveis
   08_equilibrio_gibbs
   09_ciclo_brayton
   10_provedor_propriedades

----

Citação
=======

Se você utilizar este repositório em sua pesquisa ou ensino, por favor cite-o via Zenodo:

  Gonçalves Leão Junior, R. (2026). *pyglenn-notebooks*. Zenodo. https://doi.org/10.5281/zenodo.21324685
