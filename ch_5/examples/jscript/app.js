var main = function () {
    "use strict";
    $.getJSON("cards/aceOfSpades.json", function (card) {
        // create object & add field then append string
	var $cardParagraph = $("<p>");
        $cardParagraph.text(card.rank + " of " + card.suit);
        // put object to main
        $("main").append($cardParagraph);
    });
    $.getJSON("cards/hand.json", function (hand) {
        var $list = $("<ul>");
        // hand is an array, cycle threw
	hand.forEach(function (card) {
            // copy from hand to list
       	    var $card = $("<li>");
            $card.text(card.rank + " of " + card.suit);
            $list.append($card);
        });
        // put list array to main
	$("main").append($list);
    });
}; // display
$(document).ready(main);
