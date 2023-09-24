document.addEventListener('DOMContentLoaded', function() {
  var prefectureSelect = document.getElementById('prefecture');
  if (prefectureSelect) {
    prefectureSelect.addEventListener('change', function() {
      var prefecture = this.value;  // 選択された都道府県名

      // Ajaxリクエストを発行
      var xhr = new XMLHttpRequest();
      xhr.open('GET', '/member/results/get_cities?prefecture=' + encodeURIComponent(prefecture));
      xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
          var cities = JSON.parse(xhr.responseText);
          var citySelect = document.getElementById('city');

          // 市区町村の選択肢をクリア
          while (citySelect.firstChild) {
            citySelect.removeChild(citySelect.firstChild);
          }

          // 新しい市区町村の選択肢を追加
          cities.forEach(function(city) {
            var option = document.createElement('option');
            option.value = city;
            option.textContent = city;
            citySelect.appendChild(option);
          });
        }
      };
      xhr.send();
    });
  }
});