function toggleTheme() {
    const body = document.body;
    const button = document.querySelector('.theme-toggle');
    
    body.classList.toggle('dark');
    
    if (body.classList.contains('dark')) {
        button.textContent = '☀️';
        localStorage.setItem('theme', 'dark');
    } else {
        button.textContent = '🌙';
        localStorage.setItem('theme', 'light');
    }
}

function applyTheme(theme) {
    const body = document.body;
    const button = document.querySelector('.theme-toggle');
    
    if (theme === 'dark') {
        body.classList.add('dark');
        button.textContent = '☀️';
    } else {
        body.classList.remove('dark');
        button.textContent = '🌙';
    }
}

// Load saved theme on page load
document.addEventListener('DOMContentLoaded', function() {
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme) {
        applyTheme(savedTheme);
    }
});
