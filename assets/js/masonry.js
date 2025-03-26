// Initialize Masonry grid
const initMasonry = () => {
  const grid = document.querySelector('.grid');
  if (!grid) return;

  // Initialize with basic settings
  const msnry = new Masonry(grid, {
    gutter: 10,
    horizontalOrder: true,
    itemSelector: '.grid-item',
    percentPosition: true,
    initLayout: true
  });

  // Pre-load images before initializing layout
  imagesLoaded(grid, function() {
    msnry.layout();
  });
};

// Run initialization when DOM is ready
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initMasonry);
} else {
  initMasonry();
}
