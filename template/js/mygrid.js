function the_grid(grid_id,url_grid,per_page,order_id,order_direction,page,next){
    grid_id         = (grid_id)             ? '#'+grid_id       : '#myGrid';
    per_page        = (per_page)            ? per_page          : 10;
    page            = (page)                ? page              : 0;
    order_id        = (order_id)            ? order_id          : 'a.id';
    next            = (next)            	? next          : '';
    order_direction = (order_direction)     ? order_direction   : 'desc';
    default_perpage = per_page;
    
	function my_grid(id, next){ // id = id field yg di sort
		var s_val;
		var s_field;
		var s_url		= '';
		var kelas 		= $('#'+id +' span').attr('class');
		var sort_type 	= (kelas=='fa fa-sort-desc float-right') ? 'asc' : 'desc';
			sort_type =  typeof kelas =='undefined' ?order_id : sort_type;
		var new_class 	= (kelas == 'fa fa-sort-desc float-right') ? 'fa fa-sort-asc float-right' : 'fa fa-sort-desc float-right';
		$(grid_id+' thead tr').find('span').removeClass('sort fa fa-sort-asc float-right fa fa-sort-desc');
		$('#'+id +' span').addClass(new_class);

		$(grid_id).find('.cari').each(function() {
			if($(this).attr('id')){
				search_data_id = $(this).attr('id').split('&');
				search_data_val = $(this).val();
				for (i = 0; i < search_data_id.length; ++i) {
					s_val 		 = search_data_val;
					s_field		 = search_data_id[i];
					s_url 		+= '&'+s_field+'='+s_val;
				}
			}
		});
		
        s_url           += '&perpage='+per_page+'&sort_field='+id+'&sort_type='+sort_type;
	    if (next) {
			load_data(next);
			check_localstorage_search(grid_id);
	    } else {
	    	page = (page=='records') ? 0 : page;
			load_data(url_grid+'/'+page+'?page='+page+s_url);
	    }
	}

	function check_localstorage_search(grid_id){
	    var array_field_select = [];
	    $(grid_id).find('.cari').each(function() {
		s_val 		 = $(this).val();
		s_field		 = $(this).attr('id');
		s_type		 = this.type;
		s_data 		 = localStorage[s_field];
		if (s_data) {
		    $('#'+s_field).val(s_data);
		    if (s_type=='select-one') {
			array_field_select.push(s_field);
		    }
		}
	    });
	    array_field_select.forEach(function(item) {
		$('#'+item).trigger("change");
	    });
	}
    //header table di klik
	$(grid_id+' thead tr th').click(function(){
		var id 			= $(this).attr('id');
		var is_sort		= $(this).attr('title');
		if(is_sort !='Sort') return false;
		my_grid(id);
		
	})
    
	//tambahin class sort utk kolom yg mau di sort
	$(grid_id+' thead tr').find('th').each(function() {
		if($(this).attr('title')=='Sort'){
			$(this).addClass('sort');
		}
	})
        
	//reset value pencarian on refresh
	$(grid_id).find('.cari').val('');
	
	//pencarian
	function cari(){
		var val;
		var key;
		var kelas;
		var id;
		var url 		 = '';
		$(grid_id).find('.cari').each(function() {
			if($(this).attr('id')){
				search_data_id = $(this).attr('id').split('&');
				search_data_val = $(this).val();
				for (i = 0; i < search_data_id.length; ++i) {
					s_val 		 = search_data_val;
					s_field		 = search_data_id[i];
					url 		+= '&'+s_field+'='+s_val;
					localStorage.setItem(s_field, search_data_val);
				}
			}
		});
		sort_field       = kolom_sort();
		sort_type        = kolom_type();
		url += '&perpage='+per_page+'&sort_field='+sort_field+'&sort_type='+sort_type;
		var next_data = url_grid+'?&page=0'+url;
		var recent_data = url_grid.split(/[\s,/]+/);
		var recent_page = recent_data[recent_data.length-1];
		load_data(next_data);
		var name_local_storage = recent_data[recent_data.length-2]+'/'+recent_data[recent_data.length-1];
		localStorage.setItem(name_local_storage, recent_page+'-'+next_data);
	}

	$('.cari').keypress(function (e) {
		if (e.which == 13) {
			cari();
		}
	});
	$("[id^='filter_data']").click(function () {
		cari();
	});
	$("#filter_data").click(function () {
		cari();
	});
	$('select.cari').change(function(){
		cari();
	});
	var timer;
	$(".cari").on("keyup", function(e) {
		clearTimeout(timer);
		var ms = 500; // milliseconds
		var val = this.value;
		timer = setTimeout(function() {
		  cari();
		}, ms);
	
	});
	$(document).on('click','.ui-datepicker-close',function(){
		cari();
	})

    function kolom_sort(){
        var ret='';
        var kelas ='';
        var hasil='';
        $(grid_id+' thead tr th').each(function() {
            if($(this).attr('title')=='Sort'){
                ret = ($(this).attr('id'));
                $(this).find('span').each(function() {
                    kelas = $(this).attr('class');
                    if(kelas =='ui-icon ui-icon-carat-1-s' || kelas == 'ui-icon ui-icon-carat-1-n'){
                        hasil = ret;
                    }
                })
            }
        })
        return (hasil) ? hasil : order_id ;
    }
    function kolom_type(){
	    var ret     = '';
	    var kelas   = '';
	    var hasil='';
	    $(grid_id+' thead tr th').each(function() {
	        if($(this).attr('title')=='Sort'){
	            ret = ($(this).attr('id'));
	            $(this).find('span').each(function() {
	                kelas = $(this).attr('class');
	                if(kelas =='fa fa-sort-desc float-right'){
	                    hasil  = 'desc';
	                }
	                else if(kelas == 'fa fa-sort-asc float-right'){
	                    hasil  = 'asc';
	                }
	            })
	        }
	    })
	    return (hasil) ? hasil : order_direction ;
	}

    function paging(){
        $(grid_id+' .pagination li a').click(function(){
        	$('.tr-grid').removeClass('invis');
            var url     = $(this).attr('href');
            var s_url   = '';
	    	var recent_data = url.split(/[\s,/]+/);
	    	var recent_page = recent_data[recent_data.length-1];
            if(url){
                $(grid_id).find('.cari').each(function() {
                    s_val 		 = $(this).val();
                    s_field		 = $(this).attr('id');
                    s_url 		+= '&'+s_field+'='+s_val;
		    localStorage.setItem(s_field, s_val);
                });
                var urls    = $(this).attr('href').split('/');
                var page    = urls.pop();
                page        = (page) ? page : 0;
                sort_field  = kolom_sort();
                sort_type   = kolom_type();
                var next_data    = url+'?page='+page+'&perpage='+per_page+'&sort_field='+sort_field+'&sort_type='+sort_type+s_url;
                load_data(next_data);
			var name_local_storage = recent_data[recent_data.length-3]+'/'+recent_data[recent_data.length-2];
			localStorage.setItem(name_local_storage, recent_page+'-'+next_data);
            }
            return false;
        })
    }
	var ajx;
    function load_data(url){
        $(grid_id+' tbody').html('<tr><td colspan="100" class="center"><br>Loading..</br></br></td></tr>');
        if (ajx) {
			ajx.abort();
		}
        ajx = $.ajax({
            url		: url+'&'+Math.random(),
			error:function(err){
						var error = err.status + ' '+err.statusText;
						if (err.statusText != 'abort') {
							$(grid_id+' tbody').html('<tr><td colspan="100" class="center"><br>Error!</br>'+error+'</br></br></td></tr>');
							console.log(err);
						}
			},
            success	: function(msg){
                        $(grid_id+' tbody').html(msg);
						$(grid_id+' .paging-select').append('<select class="perpage col-md-2 selectpicker form-control"> \
							<optgroup label="Show per page"> \
								<option value="5">5</option>\
								<option value="10">10</option> \
								<option value="50">50</option>\
								<option value="100">100</option>\
							</optgroup>\
						</select></div>');
						$(grid_id+' .perpage').val(per_page)
                        paging(grid_id,per_page);
						auth_system(ai,au,ad,im);
						//refresh
						$(grid_id +' .reload').click(function(){
							$('.tr-grid').removeClass('hide');
							$('.sort').removeClass('hide');
							per_page = default_perpage;
							$(grid_id +' .perpage').val(default_perpage);
							$(grid_id).find('.cari').val('');
							my_grid(order_id);
						})
						//per page
						$(grid_id +' .perpage').change(function(){
							per_page = $(this).val();
							my_grid(order_id);
						})
						
						$('.hapus').click(function(event){
							var idx = $(this).attr('id');
							var link = $(this).attr('data-url-rm');
							var base_link = $(this).attr('data-base-url');
							var text = ($(this).attr('data-text')) ? $(this).attr('data-text') : delete_data+' ?';
							if(base_link) {
								this_controller = base_url+'apps/news/';
							}

							swalConfirm(text).then(function (isConfirm) {
								if (isConfirm) {
									loading();
									$.ajax({
										url 		: this_controller+link,
										data 		: 'iddel='+ idx,
										type 		: 'POST',
										success		: function(msg){
										    my_grid(order_id);
											show_notify(page_name,success_delete);
										    loadingcomplete();
										}
									})
								} else {
									swalAlert('Your data is save(?)','success');
								}
					        });
							event.preventDefault();
						})
						$('.perpage').select2();
                    }
        });
    }
   
    
    
    my_grid(order_id,next);
    $(grid_id +' .perpage').val(default_perpage);
	
	$('.toggle_filter').click(function(){
		$('#filters').toggle('blind',{},500);
	})


}
	$(function () {
		//<script>the_grid('grid1',this_controller+'list_user',10);</script>
		re_generate_data()
	});

	function re_generate_data(){
		$('body').find('.my_grid, .my_grid2').each(function(){
			var v			       = $(this);
			var id			       = v.attr('id');
			var url			       = v.attr('data-url');
			var perpage		       = v.attr('data-perpage') || 10;
			var order_id	       = v.attr('data-order-id') || 'a.id';
			var order_direction	   = v.attr('data-order-direction') || 'desc';
			var recent_data        = url.split(/[\s,/]+/);
			var name_local_storage = recent_data[recent_data.length-2]+'/'+recent_data[recent_data.length-1];
			var current_page       = localStorage[name_local_storage];
			var form_array_data    = localStorage[name_local_storage+'-array'];
			var page               = 0;
			var last_query         = '';
			if (current_page) {
			    var data_current_page = current_page.split('-');
			    page	= data_current_page[0];
			    last_query  = data_current_page[1];
			}
			//localStorage.clear();
			the_grid(id,url,perpage,order_id,order_direction,page,last_query);
		});
		$('.nav li a').click(function(){
		    localStorage.clear();
		});
	}


	function enter_detect(){
	    $('#form_product input').keypress(function(e) {
	        if(e.which == 13 && !($(".modal").is(":visible"))) {
	            $('#save_product').click();
	            return false;
	        }
	    });
	}
	
	$(document).on('change','.show_col',function(){
		var column = $(this).attr('data-col');
		var table = $(this).closest('.data-table-list');
		var th = $('[data-hide='+column+']');
		th.addClass('hide'); // script awal invis
		th.closest('table').find('tbody tr').each(function(){
			$(this).find('td:eq('+th[0]['cellIndex']+')').addClass('hide'); // script awal invis
		});
		
		table.find('.show_col:checked').attr('disabled',false);
		if (table.find('.show_col:checked').length <= 1) {
			table.find('.show_col:checked').attr('disabled',false);
		}

		var data = table.find('th').length;
		var uncheck = $('input[name="checked_table"]:not(:checked)').length;
		var count = data-uncheck;
		table.find('.col_paging').attr('colspan',count);

		if ($(this).prop('checked') === true) 
		{
			th.removeClass('hide'); // script awal invis
			th.closest('table').find('tbody tr').each(function(){
				$(this).find('td:eq('+th[0]['cellIndex']+')').removeClass('hide'); // script awal invis
			});
		}
	});

	$(document).on('click', '.refresh_table', function() {
		var table = $(this).closest('.data-table-list');
		table.find('input[name="checked_table"]').attr('disabled',false);
		table.find('.show_col').prop('checked',true);	
		
		table.find('.show_col:checked').each(function() {
			var column = $(this).attr('data-col');
			var th = $('[data-hide='+column+']');
			th.removeClass('hide');
			th.closest('table').find('tbody tr').each(function(){
				$(this).find('td:eq('+th[0]['cellIndex']+')').removeClass('hide');
			});
		});

		var data = table.find('th').length;
		table.find('.col_paging').attr('colspan',data);

	});


	$(document).on('click', '.toggle_table', function() {
		var table = $(this).closest('.data-table-list');
		if(table.find('.tr-grid').hasClass('hide'))
		{
			// table.find('tbody').removeClass('list_view');
			table.find('.grid-list').removeClass('hide');
			table.find('.tr-grid').removeClass('hide');
			table.find('.grid-normal').addClass('hide');
			// table.find('input[name="checked_table"]').attr('disabled',false);
		}
		else
		{
			// table.find('tbody').addClass('list_view');
			table.find('.grid-list').addClass('hide');
			table.find('.tr-grid').addClass('hide');
			table.find('.grid-normal').removeClass('hide');		
			// $('input[name="checked_table"]:checked').attr('disabled',true);
		}

	});

	// fungsi reload untuk grid 
	// $('.refresh-grid').click(function(){
	// 	var grid_id = '#grid1';
	// 	my_grid(order_id);
	// })
	
	// var grid_id = '#grid1';
	// $(grid_id + '.reload').click(function(){
	// 	$(grid_id).find('.cari').val('');
	// 	my_grid(order_id);
	// })
