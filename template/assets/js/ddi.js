$(document).ready(function(){
	$('#print_data').click(function(){
		window.print();
	});
	$('#save,#save_approve').click(function(){
		loading(); 
		var back_url = $(this).attr('data-back') || '';
		var ckData   = '';
		var ckId     = '';
		var ckVal    = '';
		var formData = new FormData($('#form1')[0]);
		
		$('.ckeditor').each(function(){
			ckId = $(this).attr('id');
			val = CKEDITOR.instances[ckId].getData();
			CKEDITOR.instances[ckId].updateElement();
			ckData += '&'+ckId+'='+escape(val);
			formData.append(ckId,escape(val));
		});

		if ($('#form1').parsley().validate()) {
			$.ajax({
				url         : $('#form1').attr('action'),
				type        : "POST",
				dataType	: 'json',
				data        : $('#form1').serialize(),
				processData : false,
				error		: function(err){
								show_notify(page_name,err.message);
								loadingcomplete();
				},
				success     : function(ret){
								if (ret.error==1) {
									show_notify(page_name,ret.message);
									loadingcomplete();
								} else {
									window.location.href=this_controller+back_url;
									clear_form_elements('#form1');
								}		
				},
			});
		} else {
			loadingcomplete();
		}
		return false;
	});

	//pages, news
	$('#title,#uri_path').keyup(function(){
		$('#uri_path').val( convert_to_uri( $(this).val() ) );
	});

	$('#save-profile').click(function(){
		loading();
		if ($('#form1').parsley().validate()) {
			$.ajax({
				url         : $('#form1').attr('action'),
				type        : "POST",
				dataType	: 'json',
				data        : $('#form1').serialize(),
				// processData: false,
    // 			contentType: false,
				error		: function () {
								loadingcomplete();
				},
				success     : function(ret){
					if(ret.error==1){
						alert(ret.message);
					} else {
						alert(ret.message);
						window.location.href = this_controller;		
						
					}
				},
			});
		} else {
			$('#save-schedule').modal('hide')
			loadingcomplete();
		}
		return false;
	});

	$('#reply-contactus').click(function(){
		if ($('#form1').parsley().validate()) {
			var id = $(this).attr('data-id');
			loading();
			$.ajax({
				url         : this_controller+'reply',
				type        : "POST",
				dataType	: 'json',
				data        : $('#form1').serialize(),
				error		: function () {
								show_notify(page_name,'Please try again');
								$('#popDetail').modal('hide');
								loadingcomplete();
							},
				success     : function(ret){
								if(ret.error == 1){
									show_notify(page_name,'message not. '+ret.message);
								}
								else{
									show_notify(page_name,'Message Sent');
									
									$('#grid1 .reload').trigger('click');
								}
								$('#popDetail').modal('hide');
								the_grid('grid1',this_controller+'records');
								loadingcomplete();
				}
			});
		} else {
			loadingcomplete();
		}
		return false;
	});
	$('#multiple_delete').click(function(){
		if(confirm('Hapus Data ?')){
			var send_approval = $(this).attr('id') == 'save' ? '' : '&send_approval=1';
			var back_url = $(this).attr('data-back') || '';
			loading();
			var ckData = '';
			var ckId = '';
			var ckVal = '';
			$('.ckeditor').each(function(){
				ckId = $(this).attr('id');
				val = CKEDITOR.instances[ckId].getData();
				ckData += '&'+ckId+'='+escape(val);
			})
			$.ajax({
				url         : $('#form1').attr('action'),
				type        : "POST",
				dataType	: 'json',
				data        : $('#form1').serialize()+ckData+send_approval,
				error		: function () {
								notify('error!');
								loadingcomplete();
							},
				success     : function(ret){
								if (ret.error==1) {
									show_notify(page_name,ret.message);
									// $.gritter.add({title:page_name,text:ret.message});
									loadingcomplete();
								}
								else{
									window.location.href=this_controller + back_url;
								}
				}
			});
		}
	});

	$('#username').keyup(function(){
		var val = $(this).val();
		$.ajax({
			url     : base_url+'apps/auth_user/check_username',
			type    : "POST",
			dataType: 'json',
			data    : {username: val},
			success : function(ret){
				if(ret.error==1){
					$('.username-notif').html('').html(ret.msg);
					$('.username-notif').removeClass('hide');
				} else {
					$('.username-notif').html('');
					$('.username-notif').addClass('hide');
				}
			},
			error	: function(err){
				alert(err.msg);
			},
		});
		return false;
	});
});




//news
var ajx = null;
$(document).on('click','.view-detail',function(){
	var id = $(this).attr('data-id');
	$('#popViewDetail').modal('show');
	$('#view-detail').html('<div id="loading-modal"><i class="fa fa-spinner fa-spin"></i> Loading....</div>');
	if ( ajx ) {ajx.abort()};
	ajx = $.ajax({
			url         : base_url+'apps/news/version_detail/'+id,
			type        : "POST",
			data        : '',
			error		: function () {$('#view-detail').html('error loading data, please try again');},
			success     : function(ret){$('#view-detail').html(ret);}
		});
});

//view detail contact us
function convert_to_uri(val){
    return val
        .toLowerCase()
        .replace(/ /g,'-')
        .replace(/[^\w-]+/g,'')
        ;
}


// export to excel
function export_to_excel(){
	$.ajax({
		type 	: 'POST',
		url 	: $('#export-to-excel').attr('action'),
		data 	: $('#export-to-excel').serialize(),
		dataType: 'json',
		success : function(ret){
			window.location = $('#export-to-excel').attr('action')+'?download='+ret.file_name;
			loadingcomplete();
		},
		error 	: function(ret){
			alert('Something wrong.');
			loadingcomplete();

		},
	});
	return false;
}

//frontend menu
function frontend_menu(id){
	$('#id_frontend_menu_type'+id).change(function(){
		var val = $(this).val();
		if(val == 1){
			$('#type_module'+id).show();
			$('#type_extra'+id).hide();
			$('#extra_param'+id).attr('readonly',true);
		}
		else if(val == 2){
			$('#type_module'+id).hide();
			$('#type_extra'+id).show();
			$('#extra_param'+id).attr('readonly',false);
		}
		$('#extra_param'+id).val('');
		$('#id_module'+id).select2('val','');
	})

	$(document).on('click','.select-data',function(){
		var url = $(this).attr('data-url');
		$('#extra_param'+id).val(url);
		$('#popViewDetail'+id).modal('hide');
		$('#change-data'+id).show();
		$('#type_extra'+id).show();

	})

	var ajax = null;
	var ajax2 = null;
	$('#id_module'+id).change(function(){
		var idd = $(this).val();
		$('#loading-callback').show();
		if ( ajax ) { ajax.abort();}
		ajax = $.ajax({
			url         : base_url+'apps/frontend_menu/get_callback/'+idd,
			error		: function () {$('#view-detail').html('error loading data, please try again');},
			success     : function(ret){
							if(ret){
								$('#view-detail').html('<div id="loading-modal"><i class="fa fa-spinner fa-spin"></i> Loading....</div>');
								$('#popViewDetail').modal('show');
								
								if ( ajax2 ) { ajax.abort();}

								ajax2 = $.ajax({
									url         : base_url+'apps/'+ret,
									type        : "POST",
									data        : '',
									error 		:function(err){
													if (err.statusText != 'abort') {
														var err_close ='<i class="icon-remove-sign icon-2x closeModal" data-dismiss="modal"></i>';
														$('#view-detail'+id).html('Error!'+' '+err.status + ' '+err.statusText+err_close);
														$('#id_module'+id).select2('val','');
														$('#extra_param'+id).val('');
														$('#type_extra'+id).hide();
													}
												},
									success     : function(ret){$('#view-detail').html(ret);}
								})
							}
							else{
								$('#extra_param'+id).val('');
								//$('#type_extra').hide();
							}
							$('#loading-callback').hide();
			}
		});
	})
}


$(document).ready(function(){
	$('.lang_na').change(function(){
		var stat   = $(this).attr('stat-grup');
		var idlang = $(this).attr('stat-id');
		if($(this).attr("checked")){
			$(this).parent().parent().parent().find('.form-content').hide();

			if (idlang == 0) {
				if (stat == 'open') {
					$('#id_news_category1').parent().parent().removeClass('hide');
					$('#publish_date1').parent().parent().removeClass('hide');
					$('#id_status_publish1').parent().parent().removeClass('hide');
				} else {
					$('#id_news_category1').parent().parent().removeClass('hide');
				}

				$('#form-content-event1').children("div.inv").removeClass("hide");
				$('#nav-pills-tab-0 [data-parsley-required]').attr("data-parsley-required",false);
				$('#nav-pills-tab-1 [data-parsley-required]').attr("data-parsley-required",true);
			}
		}
		else{
			$(this).parent().parent().parent().find('.form-content').show();

			if (idlang == 0) {
				if (stat == 'open') {
					$('#id_news_category1').parent().parent().addClass('hide');
					$('#publish_date1').parent().parent().addClass('hide');
					$('#id_status_publish1').parent().parent().addClass('hide');
				} else {
					$('#id_news_category1').parent().parent().addClass('hide');
				}

				$('#form-content-event1').children("div.inv").addClass("hide");
				$('#nav-pills-tab-0 [data-parsley-required]').attr("data-parsley-required",true);
				$('#nav-pills-tab-1 [data-parsley-required]').attr("data-parsley-required",false);
			}
		}
	})
	$('.lang_na').trigger('change');
})

function delete_image(){
	$('#img img').attr("src", base_url + "images/article/small/no_image.png");
	$('input[type=hidden][name=img]').removeAttr('value');
}

function delFile(idKey){
	$('#fileTampil' + idKey).addClass('hide');
	$('#fileDelete' + idKey).val('1');
}

// auth_group controller
function detail_users(id_group,group_name){
	$("input[type=text][name=id_auth_group]").val(id_group);
	$('.modal-title').html('Detail Users in '+group_name+' Group');
	$("#id_auth_group_from_auth_group").keyup();
	$('#modal-detail-users').modal('show');
}

function refresh_grid() {
	$('.my_grid').find('input[type=text]').first().change();
	window.location.reload();
}