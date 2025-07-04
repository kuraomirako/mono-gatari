const initReactions = () => {
  console.log("reactions.js 初期化されました！");
  const storyList = document.querySelector(".reaction-lists");
  if (!storyList) return; // 詳細ページ以外では処理しない
  const storyId = storyList.dataset.storyId;

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
};

document.addEventListener("turbo:load", initReactions);
document.addEventListener("DOMContentLoaded", initReactions);