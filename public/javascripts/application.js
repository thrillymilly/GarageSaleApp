console.log("JS WORKING");


var geocoder;
  var map;
      function initMap() {
        console.log('sdfsdfsd');
        geocoder = new google.maps.Geocoder();
        var latlng = new google.maps.LatLng(-37.814236, 144.955527);
        var mapOptions = {
          zoom: 8,
          center: latlng,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

        codeAddress();
      }

      function codeAddress() {
        geocoder = new google.maps.Geocoder();
        var houseNumber = document.getElementsByClassName('house-number')[0].innerHTML;
        var postcode = document.getElementsByClassName('postcode')[0].innerHTML;
        var streetName = document.getElementsByClassName('street-name')[0].innerHTML;
        //


        var totalAddress = houseNumber + ' ' + streetName + ' ' + postcode;
        console.log(totalAddress);
        geocoder.geocode( { address: totalAddress }, function(results, status) {
          // if (status == google.maps.GeocoderStatus.OK) {
            // map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location //{ lat: -37.814236, lng: 144.955527}
            });
          // // } else {
            // alert('Geocode was not successful for the following reason: ' + status);
          });
        // };
      }
