var main = function () {
    "use strict";
    var requestURL = "http://api.flickr.com/services/feeds/photos_public.gne?tags=dog&format=json&jsoncallback=?";
    $.getJSON(requestURL, function(flickrResponse) {
        flickrResponse.items.forEach(function (item) {
            // declare variable & hide image
	    var $img = $("<img>").hide();
            //define type 
	    $img.attr("src", item.media.m);
            // attach tag we created
	    $("main .photos").append($img);
            // que fade in
	    $img.fadeIn();
        });
    });
};// produce output
$(document).ready(main);
