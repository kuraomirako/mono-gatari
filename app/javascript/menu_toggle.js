document.addEventListener('DOMContentLoaded', () => {
  // ▽ の編集・削除メニュー
  const toggleDetail = document.querySelector('.toggle-detail');
  const detailList = document.querySelector('.detail_list');

  if (toggleDetail && detailList) {
    toggleDetail.addEventListener('click', () => {
      if (detailList.style.display === 'none' || detailList.style.display === '') {
        detailList.style.display = 'block';
      } else {
        detailList.style.display = 'none';
      }
    });
  }

  // ・・・ のコメント削除メニュー
  const toggleCommentDeletes = document.querySelectorAll('.toggle-comment-delete');

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