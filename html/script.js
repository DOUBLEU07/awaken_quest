$(function() {
    window.addEventListener("message", function(event) {
        var item = event.data;
        var action = $("#warp");
        if (item.loaditem) {
            $("#loaditem").html("");
            $.each(item.needitem, function(index, items) {
                $("#loaditem").append(
                    '<div class="slotimg" align="center"><img src="nui://esx_inventoryhud/html/img/items/' + items.name + '.png" width="35" alt=""><span>Need ITEM ' + items.count + "X</span></div>"
                );
            });
        }
        if (item.loadquest) {
            $("#loaditem").html("");
            $.each(item.needitem, function(index, items) {
                if (items.count >= items.max) {
                    $("#loaditem").append(
                        '<div class="slotimg" align="center"><span><s>' + items.label + " จำนวน " + items.count + "/" + items.max + "</s></span></div>"
                    );
                } else {
                    $("#loaditem").append(
                        '<div class="slotimg" align="center"><span>' + items.label + " จำนวน " + items.count + "/" + items.max + "</span></div>"
                    );
                }
            });
        }
        if (item.showmenu) {
            action.fadeIn();
        }
        if (item.hidemenu) {
            action.fadeOut();
        }
    });
});