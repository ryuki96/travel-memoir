$(function(){
  $("#delete-button").animatedModal({
    modalTarget:'profile-delete-popup',	// ポップアップさせるモーダルウィンドウを指定
    animatedIn: 'zoomIn',	// モーダルウィンドウが開くときの動きを設定
    animatedOut: 'bounceOut',	// モーダルウィンドウが閉じるときの動きを設定
    animationDuration: '0.5s',	// アニメーションに要する時間
    color: 'white'	// モーダルウィンドウのエリア外の挙動
  });
  $("#profile-delete-popup").css('width','650px')
  $("#profile-delete-popup").css('height','300px')
  $("#profile-delete-popup").css('top','15%')
  $("#profile-delete-popup").css('left','40%')
  $("#delete-button").on('click',function(){
    $("#profile-delete-layer").show()
  })
  $(".close-profile-delete-popup").on('click',function(){
    $("#profile-delete-layer").hide()
  })
});