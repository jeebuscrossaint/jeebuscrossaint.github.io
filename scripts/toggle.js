var themeToggle = document.getElementById('theme-toggle');
var themeIcon = document.getElementById('theme-icon');

var currentTheme = localStorage.getItem('theme') || 'dark';
document.documentElement.setAttribute('data-theme', currentTheme);

themeIcon.className = currentTheme === 'dark' ? 'fas fa-moon slider round' : 'far fa-sun slider round';

themeToggle.addEventListener('change', function() {
    var currentTheme = document.documentElement.getAttribute('data-theme');
    var newTheme = currentTheme === 'dark' ? 'light' : 'dark';

    document.documentElement.setAttribute('data-theme', newTheme);
    localStorage.setItem('theme', newTheme);

    themeIcon.className = newTheme === 'dark' ? 'fas fa-moon slider round' : 'far fa-sun slider round';
});