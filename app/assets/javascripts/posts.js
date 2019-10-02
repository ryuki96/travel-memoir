$(function() {
  // load時に実行
  $(".place__search").on("keyup",function(){
    function initAutocomplete() {
      //対応させるテキストボックス
      var input = document.getElementById('q_place_cont');
      //プレイスを検索する領域
      var LatLngFrom = new google.maps.LatLng(35.692195,139.7576653);
      var LatLngTo   = new google.maps.LatLng(35.696157,139.7525771);
      var bounds = new google.maps.LatLngBounds(LatLngFrom, LatLngTo);
      //オートコンプリートのオプション
      var options = {
          types: ['(regions)'],                      // 検索タイプ
          bounds: bounds,                            // 範囲優先検索
          componentRestrictions: {country: 'jp'}     // 日本国内の住所のみ
      };
      autocomplete = new google.maps.places.Autocomplete( input, options);
    }
      initAutocomplete();
  })
  $(".place__deside").on("keyup",function(){
    function initAutocomplete() {
      //対応させるテキストボックス
      var input = document.getElementById('address');
      //プレイスを検索する領域
      var LatLngFrom = new google.maps.LatLng(35.692195,139.7576653);
      var LatLngTo   = new google.maps.LatLng(35.696157,139.7525771);
      var bounds = new google.maps.LatLngBounds(LatLngFrom, LatLngTo);
      //オートコンプリートのオプション
      var options = {
          types: ['(regions)'],                      // 検索タイプ
          bounds: bounds,                            // 範囲優先検索
          componentRestrictions: {country: 'jp'}     // 日本国内の住所のみ
      };
      autocomplete = new google.maps.places.Autocomplete( input, options);
    }
      initAutocomplete();
  })
})