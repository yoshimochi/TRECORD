/*global $*/
  $(function() {
    $('#back a').on('click',function(event){
      $('body, html').animate({
        scrollTop:0
      }, 800);
      event.preventDefault();
    });
  });

  $(document).on('turbolinks:load', function() {
  $('.jscroll').jscroll({
    // 無限に追加する要素は、どこに入れる？
    contentSelector: '.jscroll',
    // 次のページにいくためのリンクの場所は？ ＞aタグの指定
    nextSelector: 'a.next',
    // 読み込み中の表示はどうする？
    loadingHtml: '読み込み中'
  });
});

// $(function(){
//   $('#new-record').on('click', function(){
//     if($('#record_comment').val() === ''){
//       alert('タイトルを入力してください！');
//       $('#record_comment').focus();
//       return false;
//     }
//     alert('送信完了！');
//   });
// });

