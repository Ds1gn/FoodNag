$(document).ready(function(){
	// HTML markup implementation, overlap mode
	$( '#menu' ).multilevelpushmenu({

		containersToPush: [$( '#pushobj' )],
		mode: 'cover',
		fullCollapse: true
		// collapsed: [true]
	});
});