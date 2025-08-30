// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Avatar Upload Modal Functionality
function initializeAvatarModal() {
  
  const editAvatarBtns = document.querySelectorAll('.edit-avatar-btn');
  const avatarModal = document.getElementById('avatar-upload');
  const avatarForm = document.querySelector('.avatar-upload-form');
  const cancelBtn = document.querySelector('.cancel-avatar-btn');
  
  if (!avatarModal || !avatarForm) {
    return; // Exit if no modal found
  }
  
  // Show modal
  editAvatarBtns.forEach((btn, index) => {
    // Remove any existing event listeners to avoid duplicates
    btn.removeEventListener('click', handleAvatarClick);
    btn.addEventListener('click', handleAvatarClick);
  });
  
  function handleAvatarClick(e) {
    e.preventDefault();
    avatarModal.style.display = 'flex';
    avatarModal.classList.add('show');
    document.body.style.overflow = 'hidden';
    console.log('Modal should now be visible');
  }
  
  // Prevent clicks inside the form from closing the modal
  avatarForm.addEventListener('click', function(e) {
    e.stopPropagation();
  });
  
  // Hide modal
  function hideModal() {
    console.log('Hiding modal');
    avatarModal.style.display = 'none';
    avatarModal.classList.remove('show');
    document.body.style.overflow = 'auto';
  }
  
  // Cancel button
  if (cancelBtn) {
    cancelBtn.addEventListener('click', function(e) {
      e.preventDefault();
      console.log('Cancel clicked');
      hideModal();
    });
  }
  
  // Backdrop click (only when clicking the backdrop itself)
  avatarModal.addEventListener('click', function(e) {
    if (e.target === avatarModal) {
      console.log('Backdrop clicked - closing modal');
      hideModal();
    }
  });
  
  // Escape key
  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape' && avatarModal.classList.contains('show')) {
      hideModal();
    }
  });
  
  // Auto-submit form when file is selected
  const fileInput = document.getElementById('avatar-input');
  if (fileInput) {
    fileInput.addEventListener('change', function() {
      if (this.files && this.files[0]) {
        // Optional: You can add file validation here
        const file = this.files[0];
        const maxSize = 5 * 1024 * 1024; // 5MB
        const allowedTypes = ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'];
        
        if (file.size > maxSize) {
          alert('File size must be less than 5MB');
          this.value = '';
          return;
        }
        
        if (!allowedTypes.includes(file.type)) {
          alert('Please select a valid image file (JPEG, PNG, or GIF)');
          this.value = '';
          return;
        }
        
        // Update label text to show selected file
        const label = document.querySelector('.file-input-label');
        if (label) {
          label.innerHTML = `<svg width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
            <path d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
          </svg>
          ${file.name}`;
        }
      }
    });
  }
}

// Initialize on both DOMContentLoaded and turbo:load
document.addEventListener('DOMContentLoaded', function() {
  console.log('DOM Content Loaded');
  initializeAvatarModal();
});

document.addEventListener('turbo:load', function() {
  console.log('Turbo Load');
  initializeAvatarModal();
});