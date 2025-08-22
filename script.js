function toggleTheme() {
    const body = document.body;
    const button = document.querySelector('.theme-toggle');
    
    body.classList.toggle('dark');
    
    if (body.classList.contains('dark')) {
        button.textContent = '☀️';
        localStorage.setItem('theme', 'dark');
        localStorage.setItem('themeSource', 'manual');
    } else {
        button.textContent = '🌙';
        localStorage.setItem('theme', 'light');
        localStorage.setItem('themeSource', 'manual');
    }
}

function getTimeBasedTheme() {
    const hour = new Date().getHours();
    // Dark mode from 6 PM to 6 AM
    return (hour >= 18 || hour < 6) ? 'dark' : 'light';
}

function getSystemTheme() {
    return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
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

function updateThemeBasedOnConditions() {
    const savedThemeSource = localStorage.getItem('themeSource');
    
    // If user manually set theme, don't auto-update
    if (savedThemeSource === 'manual') {
        return;
    }
    
    // Try system preference first, then fall back to time-based
    let preferredTheme = getSystemTheme();
    if (!window.matchMedia) {
        preferredTheme = getTimeBasedTheme();
    }
    
    applyTheme(preferredTheme);
    localStorage.setItem('theme', preferredTheme);
}

// Load theme on page load
document.addEventListener('DOMContentLoaded', function() {
    const savedTheme = localStorage.getItem('theme');
    const savedThemeSource = localStorage.getItem('themeSource');
    
    if (savedTheme && savedThemeSource === 'manual') {
        // User manually set theme - respect their choice
        applyTheme(savedTheme);
    } else {
        // Auto-detect theme based on system/time
        updateThemeBasedOnConditions();
        localStorage.setItem('themeSource', 'auto');
    }
});

// Listen for system theme changes
if (window.matchMedia) {
    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', function() {
        const savedThemeSource = localStorage.getItem('themeSource');
        if (savedThemeSource !== 'manual') {
            updateThemeBasedOnConditions();
        }
    });
}

// Update theme every hour for time-based switching (only if auto mode)
setInterval(function() {
    const savedThemeSource = localStorage.getItem('themeSource');
    if (savedThemeSource === 'auto' && !window.matchMedia) {
        updateThemeBasedOnConditions();
    }
}, 60 * 60 * 1000); // Check every hour
