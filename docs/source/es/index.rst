=========================================
pyglenn Labbook — Ejercicios Resueltos de Termoquímica
=========================================

Una colección de diez cuadernos Jupyter elaborados y autocontenidos que demuestran
el calculador de propiedades termoquímicas `pyglenn <https://github.com/ProfLeao/pyglenn>`_.
``pyglenn`` reconstruye las propiedades molares en el estado estándar
:math:`C_p^\circ(T)`, :math:`H^\circ(T)` y :math:`S^\circ(T)` a partir de **coeficientes
polinomiales de la NASA (Glenn)** almacenados en una base de datos SQLite empaquetada
(~2030 especies, 3772 intervalos de temperatura).

----

Instalación
===========

Instale ``pyglenn`` y sus bibliotecas científicas complementarias:

.. code-block:: bash

   pip install pyglenn
   pip install numpy pandas matplotlib scipy

O, usando conda / mamba:

.. code-block:: bash

   conda install -c conda-forge pyglenn numpy pandas matplotlib scipy
   # o, usando el especificador de canal conda-forge:
   conda install conda-forge::pyglenn numpy pandas matplotlib scipy

Para instalar desde el código fuente:

.. code-block:: bash

   git clone https://github.com/ProfLeao/pyglenn.git
   cd pyglenn
   pip install .

----

.. toctree::
   :maxdepth: 1
   :caption: Cuadernos
   :hidden:

   Primeros Pasos <01_primeros_pasos>
   Polinomios de la NASA por Dentro <02_polinomios_nasa>
   Curvas de Propiedades <03_curvas_propiedades>
   Entalpía de Formación <04_entalpia_formacion>
   Entalpías de Reacción y Calores de Combustión <05_entalpias_reaccion>
   Temperatura de Llama Adiabática <06_temperatura_llama_adiabatica>
   Comparando Combustibles y Biocombustibles <07_comparacion_biocombustibles>
   Equilibrio Químico y Energía de Gibbs <08_equilibrio_gibbs>
   Ciclo Brayton de Turbina de Gas <09_ciclo_brayton>
   Proveedor de Propiedades para CFD y Cinética <10_proveedor_propiedades>

----

.. toctree::
   :maxdepth: 1
   :caption: Acerca de

   about

Sobre los datos
===============

* El ``h_relative`` de ``pyglenn`` (``calculate_properties(...)['h_relative']``) es la
  entalpía molar **estandarizada** en la escala NASA — ya **incluye la entalpía de
  formación**. En consecuencia, los elementos en estado de referencia presentan
  :math:`H^\circ(298{,}15\,\mathrm{K}) \approx 0`, los compuestos presentan su
  :math:`\Delta_f H^\circ`, y las entalpías de reacción son simples sumas estequiométricas.
* En la base de datos empaquetada, la columna dedicada ``heat_of_formation_298K`` no está
  rellenada, por lo que ``calculate_formation_enthalpy()`` devuelve ``None``. El Cuaderno 04
  muestra cómo obtener :math:`\Delta_f H^\circ` a partir de ``h_relative`` a 298,15 K.

----

Cita
====

Si utiliza este repositorio en su investigación o docencia, por favor cítelo vía Zenodo:

  Gonçalves Leão Junior, R. (2026). *pyglenn-notebooks*. Zenodo. https://doi.org/10.5281/zenodo.21324685
