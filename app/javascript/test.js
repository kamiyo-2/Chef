<<<<<<< Updated upstream
if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function() {
    const ImageList = document.getElementById('image-list')

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div')
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length

      // 表示する画像を生成
      const blobImage = document.createElement('img')
      blobImage.setAttribute('src', blob)

      // ファイル選択ボタンを生成
      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `message_image_${imageElementNum}`)
      inputHTML.setAttribute('name', 'message[images][]')
      inputHTML.setAttribute('type', 'file')

      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage)
      imageElement.appendChild(inputHTML)
      ImageList.appendChild(imageElement)

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
    }

    document.getElementById('recipephoto_image').addEventListener('change', (e) => {
      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);

      createImageHTML(blob)

    });
  });
}
=======
$(function(){
  function buildField(index) {  // 追加するフォームのｈｔｍｌを用意
    const html = `<div class="js-file-group" data-index="${index}">
                    <div class="tag-area__title">
                      タグ
                    </div>
                    <div class="tag-area__form">
                      <input type="text" name="post[tags_attributes][${index}][content]" id="post_tags_attributes_${index}_content">
                      <span class="delete-form-btn">
                        削除する
                      </span>
                    </div>
                  </div>`;
    return html;
  }
    $(".tag-area").on("click", ".delete-form-btn", function() { // 削除ボタンクリックでイベント発火
      $(".add-form-btn").css("display","block"); // どの道フォームは一つ消えるので、追加ボタンを必ず表示させるようにしておく
      const targetIndex = $(this).parent().parent().data("index") // クリックした箇所のインデックス番号を取得
      const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`); // 編集用（クリックした箇所のチェックボックスを取得）
      var lastIndex = $(".js-file-group:last").data("index"); // フォームの最後に使われているインデックス番号を取得
      displayCount -= 1; // 表示されているフォーム数を一つカウントダウン
      if (targetIndex < fileCount) { // 編集用（チェックボックスがある場合の処理）
        $(this).parent().parent().css("display","none") // フォームを非表示にする
        hiddenCheck.prop("checked", true); // チェックボックスにチェックを入れる
      } else { // チェックボックスがない場合の処理
        $(this).parent().parent().remove(); // フォームを削除する
      }
      // ↓はfileIndex（フォーム追加ように用意してある数字の配列）の処理
      if (fileIndex.length >= 1) { // 数字が一つでも残っている場合
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1); // 配列の一番右側にある数字に１を足した数字を追加
      } else {
        fileIndex.push(lastIndex + 1); // フォームの最後の数字に1を足した数字を追加
      }
      // ↓はフォームがなくならないための処理
      if (displayCount == 0) { // 見えてるフォームの数が0になったとき
        $(".tag-area").append(buildField(fileIndex[0] - 1)); // fileIndexの一番左側にある数字から１引いた数字でフォームを作成
        fileIndex.shift(); // fileIndexの一番小さい数字を取り除く
        displayCount += 1; // 見えているフォームの数をカウントアップしておく
      } 
    })
  })
>>>>>>> Stashed changes
