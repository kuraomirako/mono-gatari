document.addEventListener('turbo:load', () => {
  const textarea = document.getElementById('story-body-input');
  const countDisplay = document.getElementById('char-count');

  if (textarea && countDisplay) {
    countDisplay.textContent = `${textarea.value.length}文字`;
    textarea.addEventListener('input', () => {
      countDisplay.textContent = `${textarea.value.length}文字`;
    });
  }
});