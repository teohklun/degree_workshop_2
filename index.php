<?php 
  function curlPost($url, $data = NULL) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt( $ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $server_response = curl_exec ($ch);
    curl_close ($ch);
    return $server_response;
  }

  $jsonJob = curlPost("http://localhost:5003/exampleJ");
  $jsonVehicle = curlPost("http://localhost:5003/exampleV");
  $jsonObject["date"] = 20200515;
  $jsonObject["job"] = json_decode($jsonJob);
  $jsonObject["vehicle"] = json_decode($jsonVehicle);
  $jsonToSend = json_encode($jsonObject, JSON_FORCE_OBJECT);
  $response = curlPost("http://localhost:5003/deliveryF", $jsonToSend);
  $json = $response;

?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset=utf-8 />
  <title>PANDA VRP Solution Solver</title>
    <meta name="viewport" content="initial-scale=1.0 maximum-scale=1.0">

    <link rel="stylesheet" href="assets/css/route/OpenSans.css" />
    <link rel="stylesheet" href="node_modules/leaflet/dist/leaflet.css">
    <link rel="stylesheet" href="node_modules/leaflet-control-geocoder/dist/Control.Geocoder.css">
    <link rel="stylesheet" href="assets/css/route/vroom.css" />
  </head>
  <body>

<?php print_r($_GET); ?>
    <div id="map"></div>
    <!-- <script src="src/map.js"></script> -->
    <!-- <script src="bundle.js"></script> -->
    <script src="real.js"></script>

  <script type="text/javascript">

  </script>
  </body>
</html>

