
function initialize() {

  
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
			console.log(rws);
			// Loops over rws, adding them to the map
		    rws.forEach(function(rw){
				console.log(rw);
				// Creates marker for current rw
				rwMarker = new google.maps.Marker({
					position: new google.maps.LatLng(parseFloat(rw.latitude),parseFloat(rw.longitude)),
					map	: map,
					title	: "hello",
					icon	: '/images/closedroad.png'
					}
				)
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
	
	// Loads all listed Gyms from server
/*	this.loadrws = function() {
		$.ajax({
			type: "POST",
			url: '/ajax/getrws',
			dataType: 'json'
		}).success(function(rws){	
			// Loops over rws, adding them to the map
			rws.forEach(function(rw){
				// Creates marker for current rw
				rwMarker = new google.maps.Marker({
					position: new google.maps.LatLng(rw.latitude, rw.longitude),
					map	: map,
					title	: rw.name,
					icon	: '/images/closedroad.png'
				});
				
				// Info window HTML
				/*info = $('<div/>',{
					'class'	: 'gym-info-window',
					'html'	: [
						$('<h5/>',{
							'html'	: gym.name
						}),
						$('<div/>',{
							'class'	: 'address-wrap',
							'html'	: [
								$('<p/>',{
									'html'	: gym.address
								}),
								$('<p/>',{
									'html'	: gym.postcode
								})
							]
						})
					]
				});
				
				// Adds Gym telephone number, if one exists
				if ( typeof gym.phone_number === 'string' ) {
					info.append($('<div/>',{
						'class'	: 'telephone-wrap',
						'html'	: $('<p/>', {
							'html'	 : gym.phone_number
						})
					}));
				}
				
				// Adds contact email if one exists
				if ( typeof gym.email === 'string' ) {
					info.append($('<div/>',{
						'class'	: 'email-wrap',
						'html'	: $('<a/>',{
							'href'	: 'mailto:' + gym.email,
							'html'	: $('<div/>',{
								'class'	: 'glyphicon glyphicon-envelope'
							})
						})
					}));
				}
				
				// Creates marker's info window and makes it a property of the marker
				gymMarker.sInfoWindow = new google.maps.InfoWindow({
					content	: info.prop('outerHTML')
				});
				
				// Adds marker to centray array
				gymMarkers.push(gymMarker);
				
				// Hides all open info windows then opens info winodw of clicked marker
				google.maps.event.addListener(gymMarker, 'click', function() {
					gymMarkers.forEach(function(gymMarker){
						gymMarker.sInfoWindow.close();
					});
					
					this.sInfoWindow.open(map,this);
				});*/

		//	});
		//}); 
	//}
	
	// Loads map and Gyms on class construct
	//initialize();
	//this.loadMap();
	//this.loadrws();

