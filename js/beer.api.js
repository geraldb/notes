
var beerdb_api_new = function( opts ) {
  'use strict';

  var defaults = {
                baseUrl: 'http://prost.herokuapp.com/api/v1'
              };
  var settings;

  function init( opts )
  {
    settings = _.extend( {}, defaults, opts );
    
    // debug( 'baseUrl: ' + settings.baseUrl );
  }

  function fetch( path, onsuccess )
  {
    var url = settings.baseUrl + path;

    // check if url aleady include query string (?key=value)
    if( url.indexOf( '?') === -1)
      url += '?callback=?';
    else
      url += '&callback=?';

    $.getJSON( url, onsuccess );
  }

  function fetchBeer( key, onsuccess )
  {
    fetch( '/beer/' + key, onsuccess );
  }


  function fetchBrewery( key, onsuccess )
  {
    fetch( '/brewery/' + key, onsuccess );
  }


  function fetchNotesLatest( onsuccess )
  {
    fetch( '/notes/latest', onsuccess );
  }

  function fetchNotesHot( onsuccess )
  {
    fetch( '/notes/hot', onsuccess );
  }

  function fetchNotesTop( onsuccess )
  {
    fetch( '/notes/top', onsuccess );
  }

  function fetchNotes( key, onsuccess )
  {
    fetch( '/notes/' + key, onsuccess );
  }

  function postNote( attribs, onsuccess )
  {
    // cross domain can only do get - sorry; no HTTP POST; use fetch
    fetch( '/notes?method=post&' + $.param( attribs ), onsuccess );
    // alert( 'url: /notes?method=post&' + $.param( attribs ) );
  }

  function fetchDrinksLatest( onsuccess )
  {
    fetch( '/drinks/latest', onsuccess );
  }

  function fetchDrinks( key, onsuccess )
  {
    fetch( '/drinks/' + key, onsuccess );
  }

  function postDrink( attribs, onsuccess )
  {
    // cross domain can only do get - sorry; no HTTP POST; use fetch
    fetch( '/drinks?method=post&' + $.param( attribs ), onsuccess );
    // alert( 'url: /drinks?method=post&' + $.param( attribs ) );
  }



  // call "c'tor/constructor"
  init( opts );

  // return/export public api
  return {
     fetchBeer:         fetchBeer,
     fetchBrewery:      fetchBrewery,
     fetchNotes:        fetchNotes,
     fetchNotesLatest:  fetchNotesLatest,
     fetchNotesHot:     fetchNotesHot,
     fetchNotesTop:     fetchNotesTop,
     fetchDrinks:       fetchDrinks,
     fetchDrinksLatest: fetchDrinksLatest,
     postNote:          postNote,
     postDrink:         postDrink
  }
} // fn beerdb_api_new
