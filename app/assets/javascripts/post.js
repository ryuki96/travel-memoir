$(function(){
  $("#post-delete-button").animatedModal({
    modalTarget:'post-popup',	// ポップアップさせるモーダルウィンドウを指定
    animatedIn: 'fadeInUp',	// モーダルウィンドウが開くときの動きを設定
    animatedOut: 'fadeOutDown',	// モーダルウィンドウが閉じるときの動きを設定
    animationDuration: '0.5s',	// アニメーションに要する時間
    color: 'white'	// モーダルウィンドウのエリア外の挙動
  });
  $("#post-popup").css('width','100%')
  $("#post-popup").css('height','300px')
  $("#post-popup").css('top','65%')
});

