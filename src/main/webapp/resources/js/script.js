
function deleteFunction(id) {

    console.log("entre script " + id);
    $.ajax({
        url: "/remove/"+id,
        success: function (result) {
           console.log("ok");
           $("#title").remove();
        }
    });
}



