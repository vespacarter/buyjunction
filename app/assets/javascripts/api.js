
$(document).ready(function(){
  $(".payment-send-btn").click(function(event){
    event.preventDefault();
    var buyToSendId = $(this).attr("id");
    var url = "/api/v1/buys/" + buyToSendId + "/setpayment";
    var request = $.get(url);
    function onSuccess(){
      $("#" + buyToSendId + " .payment-sent").toggleClass("hidden");
      console.debug('Payment Set!');
    }
    function onFailure(){
      console.debug('Payment Setting Error!');
    }
    request.done(onSuccess);
    request.fail(onFailure);
  });

  $(".payment-confirm-btn").click(function(event){
    event.preventDefault();
    var buyToSendId = $(this).attr("id");
    var url = "/api/v1/buys/" + buyToSendId + "/paymentconfirm";
    var request = $.get(url);
    function onSuccess(){
      $("#" + buyToSendId + " .payment-received").toggleClass("hidden");
      console.debug('Payment Confirmed!');
    }
    function onFailure(){
      console.debug('Payment Confirm Error!');
    }
    request.done(onSuccess);
    request.fail(onFailure);
  });

  $(".item-sent-btn").click(function(event){
    event.preventDefault();
    var buyToSendId = $(this).attr("id");
    var url = "/api/v1/buys/" + buyToSendId + "/setitem";
    var request = $.get(url);
    function onSuccess(){
      $("#" + buyToSendId + " .item-sent").toggleClass("hidden");
      console.debug('Item Set!');
    }
    function onFailure(){
      console.debug('Item Set Error!');
    }
    request.done(onSuccess);
    request.fail(onFailure);
  });

  $(".item-confirm-btn").click(function(event){
    event.preventDefault();
    var buyToSendId = $(this).attr("id");
    var url = "/api/v1/buys/" + buyToSendId + "/itemconfirm";
    var request = $.get(url);
    function onSuccess(){
      $("#" + buyToSendId + " .item-received").toggleClass("hidden");
      console.debug('Item Confirmed!');
    }
    function onFailure(){
      console.debug('Item Confirm Error!');
    }
    request.done(onSuccess);
    request.fail(onFailure);
  });

});
