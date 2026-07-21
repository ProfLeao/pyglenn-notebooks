/* Language switcher for pyglenn Labbook */
(function() {
  function init() {
    if (!document.body) return;
    var path = window.location.pathname;
    var currentLang = 'en';
    if (path.match(/\/pt\//) || path.match(/\/pt$/)) currentLang = 'pt';
    if (path.match(/\/es\//) || path.match(/\/es$/)) currentLang = 'es';

    var langs = {
      'en': { label: 'English',    flag: '\uD83C\uDDEC\uD83C\uDDE7' },
      'pt': { label: 'Portugu\u00EAs', flag: '\uD83C\uDDE7\uD83C\uDDF7' },
      'es': { label: 'Espa\u00F1ol',   flag: '\uD83C\uDDEA\uD83C\uDDF8' }
    };

    var basePath = (currentLang === 'en') ? '/' : '../';
    var current = langs[currentLang];

    var container = document.createElement('div');
    container.className = 'lang-switcher';

    var btn = document.createElement('button');
    btn.className = 'lang-switcher-btn';
    btn.setAttribute('type', 'button');
    btn.innerHTML = current.flag + ' ' + current.label + ' <span class="arrow">\u25BC</span>';

    var dropdown = document.createElement('div');
    dropdown.className = 'lang-switcher-dropdown';

    for (var code in langs) {
      if (code === currentLang) continue;
      var l = langs[code];
      var a = document.createElement('a');
      a.href = (code === 'en') ? basePath : basePath + code + '/';
      a.textContent = l.flag + ' ' + l.label;
      dropdown.appendChild(a);
    }

    btn.addEventListener('click', function(e) {
      e.stopPropagation();
      dropdown.classList.toggle('open');
    });

    container.appendChild(btn);
    container.appendChild(dropdown);
    document.body.appendChild(container);

    document.addEventListener('click', function() {
      dropdown.classList.remove('open');
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
