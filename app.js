// Display current date and time
function displayBuildInfo() {
    const buildInfo = document.getElementById('build-info');
    const now = new Date();
    
    buildInfo.innerHTML = `
        <h3>Build Information</h3>
        <p><strong>Built at:</strong> ${now.toLocaleString()}</p>
        <p><strong>Build ID:</strong> ${Math.random().toString(36).substr(2, 9)}</p>
        <p><strong>Status:</strong> ✅ Success</p>
    `;
    
    buildInfo.classList.add('show');
}

// Console log for Jenkins testing
console.log('Application loaded successfully!');
console.log('Timestamp:', new Date().toISOString());
console.log('Ready for Jenkins CI/CD automation');
