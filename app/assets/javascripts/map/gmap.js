
function initialize() {
	
  rwMarkers = [];
  
  var mapOptions = {
    zoom: 12,
    center: new google.maps.LatLng(57.1526, -2.110)
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
      
  var trafficLayer = new google.maps.TrafficLayer();
      trafficLayer.setMap(map);
  

 
  $.ajax({
			type: "GET",
			url: '/ajax/getrws',
			dataType: 'json'
		}).success(function(rws){	
		    rws.forEach(function(rw){
				rwMarker = new google.maps.Marker({
					position: new google.maps.LatLng(parseFloat(rw.latitude),parseFloat(rw.longitude)),
					map	: map,
					title	: rw.description,
					icon	: '/images/closedroad.png'
					})
					
					info = $('<div/>',{
					'class'	: 'rw-info-window',
					'html'	: [
						$('<h5/>',{
							'html'	: rw.description
						}),
						$('<div/>',{
							'class'	: 'address-wrap',
							'html'	: [
							    $('<p/>',{
									'html'	: '<b>Starts on:</b>'
								}),
								$('<p/>',{
									'html'	: rw.startdate
								}),
								$('<p/>',{
									'html'	: '<b>Ends at:</b>'
								}),
								$('<p/>',{
									'html'	: rw.enddate
								})
							]
						})
					]
				});
				 // adds info window attributes to the rwMarkers 
				rwMarker.sInfoWindow = new google.maps.InfoWindow({
					content	: info.prop('outerHTML')
				});
				
				// creates array of these markers
				rwMarkers.push(rwMarker);
				
				// opens info window on click event (cycles through markers)
				google.maps.event.addListener(rwMarker, 'click', function() {
					rwMarkers.forEach(function(rwMarker){
						rwMarker.sInfoWindow.close();
					});
					
					this.sInfoWindow.open(map,this);
				});
				
			})
		 });

}

function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
      '&signed_in=true&callback=initialize';
  document.body.appendChild(script);
}

window.onload = loadScript;
