
var api,
    renderHot, $divHot3, $divHot,
    renderTop, $divTop3, $divTop,
    $divTopUser;

// user key - try richard, markus, etc.
var user = 'franz';


function updateHot() {
  api.fetchNotesHot( function( json ) {
    $divHot3.html( renderHot( { notes: json.slice(0,3) } ));
    $divHot.html( renderHot( { notes: json } ));
  });
}

function updateTop() {
  api.fetchNotesTop( function( json ) {
    $divTop3.html( renderTop( { notes: json.slice(0,3) } ));
    $divTop.html( renderTop( { notes: json } ));
  });
}

function updateTopUser() {
  api.fetchNotes( user, function( json ) {
    $divTop3User.html( renderTop( { notes: json.slice(0,3) } ));
    $divTopUser.html( renderTop( { notes: json } ));
  });
}

function onPostNote() {
  var params = {
    user:    user,										// user key e.g. franz
    beer:    $( '#beer' ).val(),			// beer key e.g. schwechater
    rating:  $( '#rating' ).val(),			// number as string e.g. 1-10
    comments: $( '#comments' ).val(),
    place:   $( '#location' ).val()	// place as string for now e.g. O'Connors
  };
  
  // alert('post note; cheers!' + JSON.stringify( params ));
  api.postNote( params, function() {
                           updateTopUser();
                           updateHot();
                        });
  return false;  // stop default event propagation
}


$(document).ready( function() {

    api = beerdb_api_new( { baseUrl: 'http://localhost:4567' } );

    renderHot = _.template( $('#hotTpl').html() );
    renderTop = _.template( $('#topTpl').html() );

    $divHot      = $( '#hot' );
    $divHot3     = $( '#hot3' );
    $divTop      = $( '#top' );
    $divTop3     = $( '#top3' );
    $divTopUser  = $( '#topUser' );
    $divTop3User = $( '#top3User' );

    $( '#postNote' ).click( onPostNote );

    updateHot();
    updateTop();
    updateTopUser();
});
