$(function(){
  $("#memoir-delete-button").animatedModal({
    modalTarget:'memoir-popup',	// ポップアップさせるモーダルウィンドウを指定
    animatedIn: 'fadeInUp',	// モーダルウィンドウが開くときの動きを設定
    animatedOut: 'fadeOutDown',	// モーダルウィンドウが閉じるときの動きを設定
    animationDuration: '0.5s',	// アニメーションに要する時間
    color: 'white'	// モーダルウィンドウのエリア外の挙動
  });
  $("#memoir-popup").css('width','100%')
  $("#memoir-popup").css('height','300px')
  $("#memoir-popup").css('top','65%')
});