# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
origin = document.getElementById('origin');
destination = document.getElementById('destination');
origin_autocomplete = new google.maps.places.Autocomplete(origin);
destination_autocomplete = new google.maps.places.Autocomplete(destination);
