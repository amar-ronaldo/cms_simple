$(document).ready(function() {
 
  $("#slide-header").owlCarousel({
 
      navigation : false, // Show next and prev buttons
      slideSpeed : 500,
      loop: true,
      paginationSpeed : 400,
      singleItem:true,
      autoPlay: 5000,
      stopOnHover: true,
      autoHeight: true
 
      // "singleItem:true" is a shortcut for:
      // items : 1, 
      // itemsDesktop : false,
      // itemsDesktopSmall : false,
      // itemsTablet: false,
      // itemsMobile : false
 
  });

  $("#slider-choice").owlCarousel({
  
      autoPlay: 3000, //Set AutoPlay to 3 seconds
      stopOnHover: true,
      slideSpeed : 300,
      loop: true,
      items:3,
      pagination: true,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3],
      responsiveClass:true,
      responsive:{
          0:{
              items:1,
              nav:true
          },
          600:{
              items:2,
              nav:false
          },
          1000:{
              items:3,
              nav:true,
              loop:false
          }
      }
 
  });

  $("#slider-choice-btm").owlCarousel({
  
      autoPlay: 3000, //Set AutoPlay to 3 seconds
      stopOnHover: true,
      slideSpeed : 300,
      items : 4,
      pagination: true,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3]
 
  });
  
  
  var highestBox = 0;
        $('.heightsame').each(function(){  
                if($(this).height() > highestBox){  
                highestBox = $(this).height();  
        }
    });    
    $('.heightsame').height(highestBox);
 
});

$('.load-video').click(function(){
  var url = $(this).attr('data-youtube-url');
  $('#yusup').attr('src',url);
})

$('#myModalVideo').click(function(){
  $('#yusup').removeAttr('src');
})

$(document).on('click',".load-more",function(){
  var a = $(this);
  var link = a.attr('href');
  a.html('Loading...');
  $(this)
  $.ajax({
    url:link,
    success:function(res){
        $('#list-news').append(res);
        a.remove();
    }
  })
  return false;
})

function download_file(ret) {
  var idx = ret.getAttribute('id');
  var add = ret.getAttribute('d-title');
/*  alert(base_url+'en/event/get_download');
  document.location.pathname = base_url+'event/get_download';
  return false;*/
  $.ajax({
    url: base_url+'en/'+add+'/get_download',
    type: 'POST',
    dataType: 'json',
    data: {idx: idx},
    success: function(ret) {
      if (ret.path != 'error') {
        document.location = ret.path;
      }
      return false;
    }
  })
}

function download_event_material(ret) {
  var idx = ret.getAttribute('id');
  var add = ret.getAttribute('d-title');
/*  alert(base_url+'en/event/get_download');
  document.location.pathname = base_url+'event/get_download';
  return false;*/
  console.log(base_url+'en/'+add+'/get_material_hits');
  $.ajax({
    url: base_url+'en/'+add+'/get_material_hits',
    type: 'POST',
    dataType: 'json',
    data: {idx: idx},
    success: function(ret) {
      if (ret.path != 'error') {
        document.location = ret.path;
      }
      return false;
    }
  })
}

function shared_article(){
  if($('.shared-article').is(':visible')){
    // $('.twitter').attr('title',news_title + ' | @tomorrow_makers');
    $('.twitter').attr('title',news_title + ' | Knowledge Sector Initiative');
    $(document).on('click','.twitter',function(e){ 
      e.preventDefault();
        var loc = $(this).attr('href');
        var title  = encodeURIComponent($(this).attr('title'));
        window.open('//twitter.com/share?url=' + full_url + '&text=' + title + '&', 'twitterwindow', 'height=450, width=550, top='+($(window).height()/2 - 225) +', left='+$(window).width()/2 +', toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');
    });
    var getTwitterCount = function () {
      $.getJSON('//cdn.api.twitter.com/1/urls/count.json?url='+full_url+'&callback=?', function(data){
        var twitterShares = data.count;
        $('.share_type_twitter .share_count').text(twitterShares);
      });
    };

    // getTwitterCount();


      var getFacebookCount = function () {
        $.getJSON('//graph.facebook.com/?ids='+full_url+'&callback=?', function(data){
          var facebookShares = (data[full_url].shares) ? data[full_url].shares :'0';
          $('.share_type_facebook .share_count').text(facebookShares);
        });
      };
    $(document).on('click','a.facebook', function(e){ 
      $('.facebook').attr('href','//www.facebook.com/sharer.php?u='+full_url);
        e.preventDefault();
        window.open('//www.facebook.com/sharer/sharer.php?u='+full_url, 'facebook_share', 'height=320, width=640, top='+($(window).height()/2 - 225) +', left='+$(window).width()/2 +', toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, directories=no, status=no');

    });
      $('.facebook').attr('href','//www.facebook.com/sharer.php?u='+full_url);
      
      // getFacebookCount();

    $(document).on('click','.google_plus',function(e){
      e.preventDefault();
      $('.google_plus').attr('href');
      window.open('//plus.google.com/share?url='+full_url, 'google_plus_share', 'height=450, width=550, top'+($(window).height()/2 - 225) +', \
        left='+$(window).width()/2 +', toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, directories=no, status=no'); 
    });
    // $('.google_plus').attr('href','https://plus.google.com/share?url='+full_url);
    var getGoogleCount = function (){
      // masih kosong
    };

    // getGoogleCount();

    $(document).on('click','.linkedin', function(e){
      console.log(123);
      console.log(full_url);
      e.preventDefault();
      $('.linkedin').attr('href');
      window.open('//www.linkedin.com/shareArticle?url='+full_url, 'linkedin_share', 'height=450, width=550, top'+($(window).height()/2 - 225) +', \
        left='+$(window).width()/2 +', toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, directories=no, status=no');
    });
    // $('.linkedin').attr('href','http://www.linkedin.com/shareArticle?url='+full_url);
    var getLinkedinCount = function (){
      $.getJSON('//www.linkedin.com/countserv/count/share?url='+full_url+'&callback=?',function(data){
        var linkedinShares = data.count;
        $('.share_type_linkedin .share_count').text(linkedinShares);
      });
    };

    // getLinkedinCount();

    $(document).on('click','.whatsapp', function(e){
      e.preventDefault();
      $('.whatsapp').attr('href', 'whatsapp://send?text='+full_url);
    });
    $('.whatsapp').attr('href', 'whatsapp://send?text='+full_url);

    $(document).on('click','.pinterest',function(e){
      e.preventDefault();
      $('.pinterest').attr('href');
      window.open('//www.pinterest.com/pin/create/button/?url='+full_url+'&media='+img+'&description='+desc, 'pinterest_share', 'height=550, width=720, top'+($(window).height()/2 - 225) +', \
        left='+$(window).width()/2 +', toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, directories=no, status=no');
    });
    // $('.pinterest').attr('href','https://www.pinterest.com/pin/create/button/?url='+full_url+'&media='+img+'&description='+desc);

    var getPinterestCount = function (){
      $.getJSON('//api.pinterest.com/v1/urls/count.json?&url='+full_url+'&callback=?',function(data){
        var pinterestShares = data.count;
        $('.share_type_pinterest .share_count').text(pinterestShares);
      });
    };

    // getPinterestCount();

    if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
      $('.share_type_whatsapp').show();
    } else {
      $('.share_type_whatsapp').hide();
    }
  }
}

$( ".form-contact-us" ).submit(function( event ) {
  event.preventDefault();
  var v = $(this);
  var i = 0;
    $('.form-contact-us').find('.form-control').each(function() {
        var x      = $(this);
        var id_inp = x.attr('id');
        // alert(id_inp);
        var instance = $('#'+id_inp).parsley();

        if (instance.isValid() == true) {
            // alert("$('#'"+id_inp+")");
           $("#span-"+id_inp).addClass("hide");
           $("#"+id_inp).removeClass("error_valid");
        }
        else{
            // alert("$('#'"+id_inp+")");
           $("#span-"+id_inp).removeClass("hide");
           $("#"+id_inp).addClass("error_valid");
            i+=1;

        }
    })
    if (i == 0) {
        $(".btn-send-contact").html("Loading..");
        $.ajax({
            url: $(".form-contact-us").attr('action'),
            type: 'POST',
            dataType: 'json',
            data: $(".form-contact-us").serialize(),
            success: function (ret){
               if (ret.error == 1) {
                  $(".btn-send-contact").html(ret.message);
                  setTimeout(function(){
                    // $(".btn-send-contact").html("KIRIM");                  
                    location.reload(); 
                  },500);                    
               }
               else{                    
                  $(".btn-send-contact").html(ret.message);
                  setTimeout(function(){
                    // $(".btn-send-contact").html("KIRIM");                  
                    location.reload(); 
                  },500);
               }
            }
        })
    }
});

$( "#frm-comment" ).submit(function( event ) {
  event.preventDefault();
  var v = $(this);
    $('#frm-comment').find('.form-control').each(function() {
        var x      = $(this);
        var id_inp = x.attr('id');
        // alert(id_inp);
        var instance = $('#'+id_inp).parsley();

        if (instance.isValid() == true) {
            // alert("$('#'"+id_inp+")");
           $("#span-"+id_inp).addClass("hide");
           $("#"+id_inp).removeClass("error_valid");
        }
        else{
            // alert("$('#'"+id_inp+")");
           $("#span-"+id_inp).removeClass("hide");
           $("#"+id_inp).addClass("error_valid");
            i+=1;

        }
    })
    $("#btn-send-comment").html("Loading..");
    $.ajax({
        url: $("#frm-comment").attr('action'),
        type: 'POST',
        dataType: 'json',
        data: $("#frm-comment").serialize(),
        success: function (ret){
           if (ret.error == 1) {
              $("#error_area").html(ret.message);
              setTimeout(function(){                
                location.reload(); 
              },1000);  
           }
           else{                    
              $("#error_area").html(ret.message);
              setTimeout(function(){                
                location.reload(); 
              },1000);  
           }
        }
    })
});

$(function() {
  var nav = $("#container-atas");
  $(window).scroll(function() {    
      var scroll = $(window).scrollTop();

      if (scroll >= 500) {
          nav.addClass("navbarfixed");
      } else {
          nav.removeClass("navbarfixed");
      }
  });
});
$(function() {
  var nav = $(".livestream");
  $(window).scroll(function() {    
      var scroll = $(window).scrollTop();

      if (scroll >= 100) {
          nav.addClass("livefixed");
      } else {
          nav.removeClass("livefixed");
      }
  });
});