//console.log("test ok");

$("#btn1").click(function () {
    var customerName = $('input').val();
    $.ajax({
        url:'/getAmount',
        type:'post',
        data:customerName,
        contentType:'text/plain',
        success:function (amount) {
            //console.log("ok");
            $("#showAmount").empty();
            if(amount > 0){
                $('<p>Found amount of money, that customer spent ' + amount + '</p>').appendTo("#showAmount");
            } else {
                $('<p>Customer not found</p>').appendTo("#showAmount");
            }

        },
        error:function () {
            console.log("error");
        }
    });
});
