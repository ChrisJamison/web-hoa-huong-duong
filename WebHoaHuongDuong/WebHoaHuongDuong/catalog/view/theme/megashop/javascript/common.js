// offcanvas menu
$(document).ready(function () {
    /*  Fix First Click Menu */
    $(document.body).on('click', '#pav-mainnav [data-toggle="dropdown"]' ,function(){
        if(!$(this).parent().hasClass('open') && this.href && this.href != '#'){
            window.location.href = this.href;
        }

    });
    // Adding the clear Fix
    cols1 = $('#column-right, #column-left').length;

    if (cols1 == 2) {
        $('#content .product-layout:nth-child(2n+2)').after('<div class="clearfix visible-md visible-sm"></div>');
    } else if (cols1 == 1) {
        $('#content .product-layout:nth-child(3n+3)').after('<div class="clearfix visible-lg"></div>');
    } else {
        $('#content .product-layout:nth-child(4n+4)').after('<div class="clearfix"></div>');
    }

    $('[data-toggle="offcanvas"]').click(function () {
        var check=$('.row-offcanvas').hasClass('active');
        console.log(check);
        if(check) 
        {
            $("body").removeClass("overlay");
            $('.row-offcanvas').removeClass('active');
            $("#overlay").remove();
            //$("#columns").removeClass('overllay');
        }else 
        {
            $("body").addClass("overlay");
            $('.row-offcanvas').addClass("active")
            var docHeight = $("#page").height();

            $("#page").append("<div id='overlay'></div>");

            $("#overlay")
               .height(docHeight)
               .css({
                   'opacity' : 0.7,
                   'position': 'absolute',
                   'top': 0,
                   'left': 0,
                   'background-color': 'black',
                   'width': '100%',
                   'z-index': 99999
               });
	  
            $(this).css({'z-index': 999999})
            //$("#columns").addClass('overllay');
        }
        //$('.row-offcanvas').toggleClass('active')
    });

    /* Search */
    $('#offcanvas-search input[name=\'search\']').parent().find('button').on('click', function() {
        url = $('base').attr('href') + 'index.php?route=product/search';

        var value = $('header input[name=\'search\']').val();

        if (value) {
            url += '&search=' + encodeURIComponent(value);
        }

        location = url;
    });

    $('#offcanvas-search input[name=\'search\']').on('keydown', function(e) {
        if (e.keyCode == 13) {
            $('header input[name=\'search\']').parent().find('button').trigger('click');
        }
    });
});


$(document).ready(function() {
    $('.product-zoom').magnificPopup({
        type: 'image',
        closeOnContentClick: true,

        image: {
            verticalFit: true
        }
    });

    $('.iframe-link').magnificPopup({
        type:'iframe'
    });
});


$(document).ready(function(){

    $('.dropdown-menu input').click(function(e) {
        e.stopPropagation();
    });

    // grid list switcher
    $("button.btn-switch").bind("click", function(e){
        e.preventDefault();
        var theid = $(this).attr("id");
        var row = $("#products");

        if($(this).hasClass("active")) {
            return false;
        } else {
            if(theid == "list-view"){
                $('#list-view').addClass("active");
                $('#grid-view').removeClass("active");

                // remove class list
                row.removeClass('product-grid');
                // add class gird
                row.addClass('product-list');

            }else if(theid =="grid-view"){
                $('#grid-view').addClass("active");
                $('#list-view').removeClass("active");

                // remove class list
                row.removeClass('product-list');
                // add class gird
                row.addClass('product-grid');

            }
        }
    });


    $(".quantity-adder .add-action").click( function(){
        if( $(this).hasClass('add-up') ) {
            $("[name=quantity]",'.quantity-adder').val( parseInt($("[name=quantity]",'.quantity-adder').val()) + 1 );
        }else {
            if( parseInt($("[name=quantity]",'.quantity-adder').val())  > 1 ) {
                $("input",'.quantity-adder').val( parseInt($("[name=quantity]",'.quantity-adder').val()) - 1 );
            }
        }
    } );
    /****/
    $(document).ready(function() {
        $('.popup-with-form').magnificPopup({
            type: 'inline',
            preloader: false,
            focus: '#input-name',

            // When elemened is focused, some mobile browsers in some cases zoom in
            // It looks not nice, so we disable it:
            callbacks: {
                beforeOpen: function() {
                    if($(window).width() < 700) {
                        this.st.focus = false;
                    } else {
                        this.st.focus = '#input-name';
                    }
                }
            }
        });
    });
	
});

// Cart add remove functions
var cart = {
    'addcart': function(product_id, quantity) {
        //var recordToDelete = $(this).attr("data-id");
        //if (recordToDelete != '') {
        // Perform the ajax post
        alert(1);
        $.post("../ShoppingCart/AddToCart", { "id": product_id },
            function (data) {
                    // Successful requests get here
                    // Update the page elements
                    if (data.ItemCount == 0) {
                        $('#row-' + data.DeleteId).fadeOut('slow');
                    } else {
                        $('#item-count-' + data.DeleteId).text(data.ItemCount);
                    }
                    $('#cart-total').text(data.CartTotal);
                    $('#update-message').text(data.Message);
                    $('#cart-status').text('Cart (' + data.CartCount + ')');
                });
    },
    //  $.ajax({
    //    url: '../ShoppingCart/AddToCart',
    //    type: 'post',
    //    data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
    //    dataType: 'json',
    //    success: function(json) {
    //      $('.alert, .text-danger').remove();

    //      if (json['redirect']) {
    //        location = json['redirect'];
    //      }

    //      if (json['success']) {
    //        $('#notification').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
    //        if( $("#cart-total").hasClass("cart-mini-info") ){
    //            json['total'] = json['total'].replace(/-(.*)+$/,"");
    //        }
    //        $('#cart-total').html(json['total']);

    //        $('html, body').animate({ scrollTop: 0 }, 'slow');

    //        $('#cart > ul').load('index.php?route=common/cart/info ul li');
    //      }
    //    }
    //  });
    //},
  'update': function(key, quantity) {
      $.ajax({
          url: 'index.php?route=checkout/cart/edit',
          type: 'post',
          data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
          dataType: 'json',
          beforeSend: function() {
              $('#cart > button').button('loading');
          },
          success: function(json) {
              $('#cart > button').button('reset');

              $('#cart-total').html(json['total']);
              if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                  location = 'index.php?route=checkout/cart';
              } else {
                  $('#cart > ul').load('index.php?route=common/cart/info ul li');
              }
          }
      });
  },
  'remove': function(key) {
      $.ajax({
          url: 'index.php?route=checkout/cart/remove',
          type: 'post',
          data: 'key=' + key,
          dataType: 'json',
          beforeSend: function() {
              $('#cart > button').button('loading');
          },
          success: function(json) {
              $('#cart > button').button('reset');

              $('#cart-total').html(json['total']);

              if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                  location = 'index.php?route=checkout/cart';
              } else {
                  $('#cart > ul').load('index.php?route=common/cart/info ul li');
              }
          }
      });
  }
}

var wishlist = {
    'addwishlist': function(product_id) {
        $.ajax({
            url: 'index.php?route=account/wishlist/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function(json) {
                $('.alert').remove();

                if (json['success']) {
                    $('#notification').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }

                if (json['info']) {
                    $('#notification').html('<div class="alert alert-info"><i class="fa fa-info-circle"></i> ' + json['info'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }

                $('#wishlist-total').html(json['total']);

                $('html, body').animate({ scrollTop: 0 }, 'slow');
            }
        });
    },
    'remove': function() {

    }
}

var compare = {
    'addcompare': function(product_id) {
        $.ajax({
            url: 'index.php?route=product/compare/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function(json) {
                $('.alert').remove();

                if (json['success']) {
                    $('#notification').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#compare-total').html(json['total']);

                    $('html, body').animate({ scrollTop: 0 }, 'slow');
                }
            }
        });
    },
    'remove': function() {

    }
}


$(document).ready(function(){
    $("#content video").prop("volume", 0.4);
    var myVideo = document.getElementById("video1"); 
    $("#content video").click(function(){
        console.log(video);
        var video=(this);
        if(video.paused) video.play();
        else video.pause();
    });
    $(document).ready(function(){
        var currentpage = 1;
        $("#morelist").click(function(e) {
            var total_row = $("#products .products-block").children().length;
            e.preventDefault();
            $.ajax({
                url: '',
                method: 'GET',
                dataType: 'html',
                data: {
                    //path:'thuoc-khong-ke-don',
                    page: currentpage + 1,
                    json: true,
                    i: parseInt($("#lastIproduct").text())
                },
                success: function(data) {
                    currentpage++;
                    //$("#products").html(data.products);
                   
                    $("#products .products-block").append(data);
                    var t=parseInt($("#products .products-block").find("#div-loadmore .total-product").text());
                    $("#morelist span").text($("#products .products-block").find("#div-loadmore .total-product").text());
                    $("#lastIproduct").text($("#products .products-block").find("#div-loadmore .i-product").text());
                    $("#products #div-loadmore").remove();
                    if(t<1)$("#morelist").remove();
                    var rs = $(data).remove("#i-product");                    

                },
                error: function(d, t)
                {
                    console.log(d);
                    console.log(t);
                }
            });
        });
    });
})