=========================================
pyglenn Labbook — Exercícios Resolvidos de Termoquímica
=========================================

Uma coleção de dez notebooks Jupyter elaborados e autocontidos demonstrando o
calculador de propriedades termoquímicas `pyglenn <https://github.com/ProfLeao/pyglenn>`_.
O ``pyglenn`` reconstrói as propriedades molares no estado padrão
:math:`C_p^\circ(T)`, :math:`H^\circ(T)` e :math:`S^\circ(T)` a partir de **coeficientes
polinomiais da NASA (Glenn)** armazenados em um banco de dados SQLite empacotado
(~2030 espécies, 3772 intervalos de temperatura).

----

Instalação
==========

Instale o ``pyglenn`` e suas bibliotecas científicas complementares:

.. code-block:: bash

   pip install pyglenn
   pip install numpy pandas matplotlib scipy

Ou, usando conda / mamba:

.. code-block:: bash

   conda install -c conda-forge pyglenn numpy pandas matplotlib scipy
   # ou, usando o especificador de canal conda-forge:
   conda install conda-forge::pyglenn numpy pandas matplotlib scipy

Para instalar a partir do código-fonte:

.. code-block:: bash

   git clone https://github.com/ProfLeao/pyglenn.git
   cd pyglenn
   pip install .

----

.. toctree::
   :maxdepth: 1
   :caption: Notebooks
   :hidden:

   Primeiros Passos <01_primeiros_passos>
   Polinômios da NASA por Dentro <02_polinomios_nasa>
   Curvas de Propriedades <03_curvas_propriedades>
   Entalpia de Formação <04_entalpia_formacao>
   Entalpias de Reação e Calores de Combustão <05_entalpias_reacao>
   Temperatura de Chama Adiabática <06_temperatura_chama_adiabatica>
   Comparando Combustíveis e Biocombustíveis <07_comparação_biocombustiveis>
   Equilíbrio Químico e Energia de Gibbs <08_equilibrio_gibbs>
   Ciclo Brayton de Turbina a Gás <09_ciclo_brayton>
   Provedor de Propriedades para CFD e Cinética <10_provedor_propriedades>

----

.. toctree::
   :maxdepth: 1
   :caption: Sobre

   about

Sobre os dados
==============

* O ``h_relative`` do ``pyglenn`` (``calculate_properties(...)['h_relative']``) é a
  entalpia molar **padronizada** na escala NASA — ela já **inclui a entalpia de
  formação**. Consequentemente, elementos no estado de referência apresentam
  :math:`H^\circ(298{,}15\,\mathrm{K}) \approx 0`, compostos apresentam sua
  :math:`\Delta_f H^\circ`, e entalpias de reação são simples somas estequiométricas.
* No banco de dados empacotado, a coluna dedicada ``heat_of_formation_298K`` não está
  preenchida, portanto ``calculate_formation_enthalpy()`` retorna ``None``. O Notebook 04
  mostra como obter :math:`\Delta_f H^\circ` a partir de ``h_relative`` a 298,15 K.

----

Citação
=======

Se você utilizar este repositório em sua pesquisa ou ensino, por favor cite-o via Zenodo:

  Gonçalves Leão Junior, R. (2026). *pyglenn-notebooks*. Zenodo. https://doi.org/10.5281/zenodo.21324685
