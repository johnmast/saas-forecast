function getLatNLong() {
    var dstk = $.DSTK();
    var city = $("#weather_location_city").val();

    dstk.googlestylegeocoder(city, function(data) {
        console.log("data", data);
        var status = data.status;

        if (status != "OK") {
            $("#weather_location_latitude").val("");
            $("#weather_location_longitude").val("");
        }

        var results = data.results;

        if (results && results instanceof Array && results.length > 0) {
            var result = results[0];

            var latitude  = result.geometry.location.lat;
            var longitude = result.geometry.location.lng;
            $("#weather_location_latitude").val(latitude);
            $("#weather_location_longitude").val(longitude);

        }
    });
}