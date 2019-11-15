function show_notify(title,desc){
	$.gritter.add({
		title: title, // mandatory
		text: desc, // mandatory
		image: profile_picture, // optional
		sticky: false, // optional
		time: '' // optional
	});
	return false;
}

function close_notify(){
	$.gritter.removeAll();
	return false;
}