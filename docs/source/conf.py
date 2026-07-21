# Configuration file for the Sphinx documentation builder.
# https://www.sphinx-doc.org/en/master/usage/configuration.html

import os
import sys

# -- Project information -----------------------------------------------------
project = 'pyglenn Labbook'
copyright = '2026, Dr. Reginaldo G. Leão Jr. — GESESC / IFMG'
author = 'Dr. Reginaldo G. Leão Jr.'
release = '1.0'

# -- General configuration ---------------------------------------------------
extensions = [
    'nbsphinx',
    'sphinx.ext.mathjax',
]

# Do not execute notebooks during build — they are pre-executed
nbsphinx_execute = 'never'
nbsphinx_allow_errors = False

# Kernel to use for notebook execution
nbsphinx_kernel_name = 'python3'

# Exclude build artifacts and language sub-directories from main build
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', 'en', 'pt', 'es']

# Ensure .nojekyll is present for GitHub Pages
html_extra_path = []

def copy_notebooks(app, exc):
    """Copy .ipynb source files to _static/notebooks/ so they can be downloaded."""
    import shutil
    import glob
    dest_dir = os.path.join(app.outdir, '_static', 'notebooks')
    os.makedirs(dest_dir, exist_ok=True)
    for fpath in glob.glob(os.path.join(app.srcdir, '*.ipynb')):
        shutil.copy2(fpath, os.path.join(dest_dir, os.path.basename(fpath)))

def setup(app):
    nojekyll_path = os.path.join(app.outdir, '.nojekyll')
    app.connect('build-finished', lambda app, exc: open(nojekyll_path, 'w').close())
    app.connect('build-finished', copy_notebooks)

# -- Options for HTML output -------------------------------------------------
html_theme = 'sphinx_rtd_theme'
html_title = 'pyglenn Labbook'
html_logo = '_static/pyglenn-overview.png'
html_static_path = ['_static']
html_css_files = ['custom.css', 'lang-switcher.css']

# Language switcher script
html_js_files = ['lang-switcher.js']

# Theme options
html_theme_options = {
    'logo_only': False,
    'prev_next_buttons_location': 'bottom',
    'collapse_navigation': True,
    'sticky_navigation': True,
    'navigation_depth': 3,
    'includehidden': True,
    'titles_only': False,
}

html_context = {
    'display_github': True,
    'github_user': 'ProfLeao',
    'github_repo': 'pyglenn-notebooks',
    'github_version': 'main',
    'conf_py_path': '/docs/source/',
    'vcs_pageview_mode': 'blob',
}

# RTD theme handles sidebars automatically by default
# No need to set html_sidebars explicitly

# -- nbsphinx options --------------------------------------------------------
nbsphinx_prolog = r"""
.. raw:: html

    <div class="nb-notice">
      <span>This notebook is part of the <strong>pyglenn Labbook</strong> collection.</span>
      <a class="nb-download-btn" href="" data-download-notebook title="Download Jupyter notebook">
        &#x2B07; Download .ipynb
      </a>
    </div>
    <script>
    (function() {
      var btn = document.querySelector('[data-download-notebook]');
      if (btn) {
        var path = window.location.pathname;
        var name = path.split('/').pop().replace('.html', '');
        if (name) {
          btn.href = '_static/notebooks/' + name + '.ipynb';
          btn.setAttribute('download', name + '.ipynb');
        }
      }
    })();
    </script>
"""
