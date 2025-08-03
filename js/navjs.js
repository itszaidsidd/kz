var nav=document.querySelector('.nav');
window.addEventListener('scroll',function(){
	if(window.pageYOffset>=650)
	{
		nav.style.background="#225470";
	}
	else{
		nav.style.background='rgba(0,0,0,0)';
	}
})