//grab single components
var toggleBtn = document.getElementById('toggle_btn');
var toggleBtnText = toggleBtn.innerHTML;
var bgPattern = document.querySelector('.bg-pattern');
var topText = document.querySelector('.top__text-title');
var topSubtext = document.querySelector('.top__text-subtitle');
var topToggle = document.querySelector('.top__toggle-btn');
var middleText = document.querySelector('.middle-text');

//functions that switch multi components
function switchComponents () {
	//large card
	var cardsBg;
	cardsBg = document.querySelectorAll('.card-lg');
	for (var i=0; i < cardsBg.length; ++i) {
		cardsBg[i].classList.add('card-lg--dark')
	};

	//small card
	var cardsSmallBg;
	cardsSmallBg = document.querySelectorAll('.card-sm');
	for (var i=0; i < cardsSmallBg.length; ++i) {
		cardsSmallBg[i].classList.add('card-sm--dark')
	};

	//social handle
	var socialHandles;
	socialHandles = document.querySelectorAll('.social__handle');
	for (var i=0; i < socialHandles.length; ++i) {
		socialHandles[i].classList.add('social__handle--dark');
	};

	//number
	var no;
	no = document.querySelectorAll('.no');
	for (var i=0; i < no.length; ++i) {
		no[i].classList.add('no--dark');
	};

	//followers
	var followers;
	followers = document.querySelectorAll('.followers');
	for (var i=0; i < no.length; ++i) {
		followers[i].classList.add('followers--dark');
	};

	//small card top text
	var smTopText;
	smTopText = document.querySelectorAll('.card-sm__top-text');
	for (var i=0; i < no.length + 4; ++i) {
		smTopText[i].classList.add('card-sm__top-text--dark');
	};

	//small card bottom text
	var smBottomText;
	smBottomText = document.querySelectorAll('.card-sm__bottom-text');
	for (var i=0; i < no.length + 4; ++i) {
		smBottomText[i].classList.add('card-sm__bottom-text--dark');
	};
}

//functions that reset multi components
function resetComponents () {
	//large cards
	var cardsBg;
	cardsBg = document.querySelectorAll('.card-lg');
	for (var i=0; i < cardsBg.length; ++i) {
		cardsBg[i].classList.remove('card-lg--dark')
	};

	//small card
	var cardsSmallBg;
	cardsSmallBg = document.querySelectorAll('.card-sm');
	for (var i=0; i < cardsSmallBg.length; ++i) {
		cardsSmallBg[i].classList.remove('card-sm--dark')
	};

	//social handle
	var socialHandles;
	socialHandles = document.querySelectorAll('.social__handle');
	for (var i=0; i < socialHandles.length; ++i) {
		socialHandles[i].classList.remove('social__handle--dark');
	};

	//number
	var no;
	no = document.querySelectorAll('.no');
	for (var i=0; i < no.length; ++i) {
		no[i].classList.remove('no--dark');
	};

	//followers
	var followers;
	followers = document.querySelectorAll('.followers');
	for (var i=0; i < no.length; ++i) {
		followers[i].classList.remove('followers--dark');
	};

	//small card top text
	var smTopText;
	smTopText = document.querySelectorAll('.card-sm__top-text');
	for (var i=0; i < no.length + 4; ++i) {
		smTopText[i].classList.remove('card-sm__top-text--dark');
	};

	//small card bottom text
	var smBottomText;
	smBottomText = document.querySelectorAll('.card-sm__bottom-text');
	for (var i=0; i < no.length + 4; ++i) {
		smBottomText[i].classList.remove('card-sm__bottom-text--dark');
	};
}

//switch site function
function themeSwitch (event) {
  (event.target.checked) ? 
  (document.body.classList.add('body--dark'), 
  	bgPattern.classList.add('bg-pattern--dark'),
  	topText.classList.add('top__text-title--dark'),
  	topSubtext.classList.add('top__text-subtitle--dark'),
	topToggle.classList.add('top__toggle-btn--dark'),
	middleText.classList.add('middle-text--dark'),

	//change multi components colors
	switchComponents()
	)
  : 
  (document.body.classList.remove('body--dark'),
  	bgPattern.classList.remove('bg-pattern--dark'),
  	topText.classList.remove('top__text-title--dark'),

  	//change multi components colors
	resetComponents()
  	)
};


document.getElementById('themeSwitch').addEventListener('change', themeSwitch);