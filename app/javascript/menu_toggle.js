document.addEventListener('turbo:load', () => {
  // ▽ 詳細ページの編集・削除メニュー
  const toggleDetail = document.querySelector('.story-menu-icon');
  const detailList = document.querySelector('.story-menu-lists');

  if (toggleDetail && detailList) {
    toggleDetail.addEventListener('click', () => {
      if (detailList.style.display === 'none' || detailList.style.display === '') {
        detailList.style.display = 'block';
      } else {
        detailList.style.display = 'none';
      }
    });
  }

  // ▽ 詳細ページのコメント削除メニュー
  const toggleCommentDeletes = document.querySelectorAll('.comment-menu-icon');

  toggleCommentDeletes.forEach(toggle => {
    toggle.addEventListener('click', () => {
      const actionList = toggle.nextElementSibling;
      if (actionList.style.display === 'none' || actionList.style.display === '') {
        actionList.style.display = 'block';
      } else {
        actionList.style.display = 'none';
      }
    });
  });
});