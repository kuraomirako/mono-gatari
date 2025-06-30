document.addEventListener('DOMContentLoaded', () => {
  const textarea = document.getElementById('story-body-input');
  const counter = document.getElementById('char-count');

  if (textarea && counter) {
    textarea.addEventListener('input', () => {
      const length = textarea.value.length;
      counter.textContent = `${length}文字`;
    });
  }
});