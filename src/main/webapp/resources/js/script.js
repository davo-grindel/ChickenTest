
    function deleteFunction(id) {
        console.log("entre script " + id);
        $.ajax({
            url: "/remove",
            data:"id="+id,
            success: function (result) {
                console.log("ok delete");
                listChicken();
            }
        });
    }
        
    function editFunction(id, name, num_eggs) {
        console.log("entre script " + id);
        $.ajax({
            url: "/edit",
            data:"id="+id+"&name="+name+"&num_eggs="+num_eggs,
            success: function (result) {
                console.log("ok edit");
                listChicken();
            }
        });
    }

    function listChicken() {
        console.log("entre");
        $.ajax({
            url: "/rest/chicken",
            success: function (result) {
                reloadUI(result);
            }
        });
    }

    function reloadUI(result) {
        console.log(result);
        var list = JSON.parse(result);
        var rowHtml="<tr><th>Chicken ID</th><th>Chicken Name</th><th>Amount of eggs</th></tr>";
        $.each(list, function (index, value) {
            rowHtml+='<tr>';
            $.each(value, function (i   , v) {
                rowHtml+='<td id="'+i+'">'+v+'</td>';
            });
            rowHtml+='</tr>';
        });
        $('#chickenTable tbody').html(rowHtml);
    }

$(document).ready(function() {
    gridclick();    
});


function gridclick() {
    $("table#chickenTable tbody").on('click',"tr", function () {
        
        id = $(this).children('td#id').text();
        name = $(this).children('td#name').text();
        num_egg = $(this).children('td#num_egg').text();
        console.log(id);
        $("#myModalEditRemove input#name").val(name);
        $("#myModalEditRemove input#num_egg").val(num_egg);    
        $('#myModalEditRemove').modal('show');

        $("#delete").on("click", function () {
            deleteFunction(id);
            $('#myModalEditRemove').modal('hide');
        });

         $("#edit").on("click", function () {
            edit_name = $("#myModalEditRemove input#name").val();
            edit_egg = $("#myModalEditRemove input#num_egg").val(); 
            editFunction(id,edit_name,edit_egg);
            $('#myModalEditRemove').modal('hide');
        });
    });
};




