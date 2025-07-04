document.addEventListener("DOMContentLoaded", () => {
  const storyId = document.querySelector(".reaction-lists").dataset.storyId;

  document.querySelectorAll(".reaction").forEach(el => {
    el.addEventListener("click", () => {
      const kind = el.dataset.kind;

      fetch(`/stories/${storyId}/reactions`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
        },
        body: JSON.stringify({ kind: kind })
      }).then(() => {
        document.querySelectorAll(".reaction").forEach(item => item.classList.remove("active"));
        el.classList.add("active");
      });
    });
  });
});