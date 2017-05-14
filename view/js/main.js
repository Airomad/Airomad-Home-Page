require("/node_modules/jquery/dist/jquery.min.js");

function loadSubcategory(id) {

    $.ajax({
        url: '/controllers/loader-json.php',
        dataType: "json",
        data: {
            file: id
        },
        beforeSend: function() {
            $("#right-loading").removeClass("hide");
        },
        complete: function() {
            $("#right-loading").addClass("hide");
        },
        success: function(cards) {
            var div = $("#cards-content");
            var html = "";
            var counter = 0;
            if (cards.status === "success") {
                $("#cards-empty").addClass("hide");

                cards.cards.forEach(function(it) {
                    if (counter % 3 == 0)
                        html += '<div class="pure-g">';

                    html += '<div class="pure-u-1-3"><div class="card">';
                    html += '<div class="card-img">&nbsp;</div>';
                    html += '<div class="card-info"><span class="icon dripicons-rocket"></span> 0</div>';
                    html += '<div class="card-title">' + it.name + '</div>';
                    html += '<div class="card-link">' + it.link + '</div>';
                    html += '</div></div>';

                    if ((counter - 2) % 3 == 0)
                        html += '</div>';

                    counter++;
                })
                div.html(html);
            } else {
                $("#cards-empty").removeClass("hide");
                div.html(cards.status);
            }
        }
    });
}
