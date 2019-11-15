function error_login(msg,type){
	if(type==1){
		var notif_class = "alert-success border-success";
	} else {
		var notif_class = "alert-danger border-danger";
	}
	$msg = '\
		<div class="alert alert-icon '+notif_class+' alert-dismissible fade show" role="alert">\
			<i class="material-icons list-icon">not_interested</i>\
			<strong>Warning!</strong> '+msg+'\
		</div>\
	';
	$(".warning").html($msg);
    $(".warning").fadeTo(3000, 300).slideUp(300, function(){
        $(".warning").slideUp(300);
    });
}

// login
$(document).on('submit','#form-login',function(){
	var btn_login = '.btn-submit-login';
	var btn = $(btn_login).html();
	$.ajax({
		url 		: $(this).attr('action'),
		type 		: "POST",
		dataType	: 'json',
		data 		: $(this).serialize(),
		beforeSend 	: function() { $(btn_login).html(loading); },
		success     : function(ret){
			$(btn_login).html(btn);
			if(ret.error==0){
				window.location.href = ret.redirect;
			} else {
				error_login(ret.msg);
			}
		},
		error 		: function (err){
			$(btn_login).html(btn);
			error_login(err.msg);
		},
	});
	return false;
});

// request forgot password
$(document).on('submit','#form-forgot-pw',function(){
	var btn_login = '.btn-forgot-pw';
	var btn = $(btn_login).html();
	$.ajax({
		url 		: $(this).attr('action'),
		type 		: "POST",
		dataType	: 'json',
		data 		: $(this).serialize(),
		beforeSend 	: function() { $(btn_login).html(loading); },
		success     : function(ret){
			$(btn_login).html(btn);
			if(ret.error==0){ // success
				$('#email').val('');
				error_login(ret.msg,1);
			} else {
				error_login(ret.msg);
			}
		},
		error 		: function (err){
			$(btn_login).html(btn);
			error_login(err.msg);
		},
	});
	return false;
});

// change password
$(document).on('submit','#change-pw',function(){
	var btn_login = '.btn-change-pw';
	var btn = $(btn_login).html();
	$.ajax({
		url 		: $(this).attr('action'),
		type 		: "POST",
		dataType	: 'json',
		data 		: $(this).serialize(),
		beforeSend 	: function() { $(btn_login).html(loading); },
		success     : function(ret){
			$(btn_login).html(btn);
			if(ret.error==0){ // success
				$('#re_password,#password').val('');
				error_login(ret.msg,1);
			} else {
				error_login(ret.msg);
			}
		},
		error 		: function (err){
			$(btn_login).html(btn);
			error_login(err.msg);
		},
	});
	return false;
});