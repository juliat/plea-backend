var menuLeft = document.getElementById( 'menu-s1' ),
	menuRight = document.getElementById( 'menu-s2' ),
	menuTop = document.getElementById( 'menu-s3' ),
	menuBottom = document.getElementById( 'menu-s4' ),
	showLeft = document.getElementById( 'showLeft' ),
	showRight = document.getElementById( 'showRight' ),
	showTop = document.getElementById( 'showTop' ),
	showBottom = document.getElementById( 'showBottom' ),
	showLeftPush = document.getElementById( 'showLeftPush' ),
	showRightPush = document.getElementById( 'showRightPush' ),
	body = document.body;

showLeft.onclick = function() {
	classie.toggle( this, 'active' );
	classie.toggle( menuLeft, 'menu-open' );
	disableOther( 'showLeft' );
};
showRight.onclick = function() {
	classie.toggle( this, 'active' );
	classie.toggle( menuRight, 'menu-open' );
	disableOther( 'showRight' );
};
showTop.onclick = function() {
	classie.toggle( this, 'active' );
	classie.toggle( menuTop, 'menu-open' );
	disableOther( 'showTop' );
};
showBottom.onclick = function() {
	classie.toggle( this, 'active' );
	classie.toggle( menuBottom, 'menu-open' );
	disableOther( 'showBottom' );
};
showLeftPush.onclick = function() {
	classie.toggle( this, 'active' );
	classie.toggle( body, 'menu-push-toright' );
	classie.toggle( menuLeft, 'menu-open' );
	disableOther( 'showLeftPush' );
};
showRightPush.onclick = function() {
	classie.toggle( this, 'active' );
	classie.toggle( body, 'menu-push-toleft' );
	classie.toggle( menuRight, 'menu-open' );
	disableOther( 'showRightPush' );
};

function disableOther( button ) {
	if( button !== 'showLeft' ) {
		classie.toggle( showLeft, 'disabled' );
	}
	if( button !== 'showRight' ) {
		classie.toggle( showRight, 'disabled' );
	}
	if( button !== 'showTop' ) {
		classie.toggle( showTop, 'disabled' );
	}
	if( button !== 'showBottom' ) {
		classie.toggle( showBottom, 'disabled' );
	}
	if( button !== 'showLeftPush' ) {
		classie.toggle( showLeftPush, 'disabled' );
	}
	if( button !== 'showRightPush' ) {
		classie.toggle( showRightPush, 'disabled' );
	}
}	