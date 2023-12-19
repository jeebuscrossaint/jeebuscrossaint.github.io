// Get the theme toggle input and icon
var themeToggle = document.getElementById('theme-toggle');
var themeIcon = document.getElementById('theme-icon');

// Set the initial theme based on local storage or default to 'dark'
var currentTheme = localStorage.getItem('theme') || 'dark';
document.documentElement.setAttribute('data-theme', currentTheme);

// Update the icon based on the current theme
themeIcon.className = currentTheme === 'dark' ? 'fas fa-moon slider round' : 'far fa-sun slider round';

// Add an event listener to the input to toggle the theme
themeToggle.addEventListener('change', function() {
    var currentTheme = document.documentElement.getAttribute('data-theme');
    var newTheme = currentTheme === 'dark' ? 'light' : 'dark';

    // Set the new theme
    document.documentElement.setAttribute('data-theme', newTheme);
    localStorage.setItem('theme', newTheme);

    // Update the icon
    themeIcon.className = newTheme === 'dark' ? 'fas fa-moon slider round' : 'far fa-sun slider round';
});