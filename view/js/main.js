$(document).ready(function() {
        loadCategories()
});

function loadSubcategory(id) {

    $.ajax({
        url: '/controllers/loader-json.php',
        dataType: "json",
        data: {
            file: id,
            mode: "cards"
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

                if (cards.data !== null) {
                    cards.data.forEach(function(it) {
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
                    div.html(cards.data);
                }
            } else {
                $("#cards-empty").removeClass("hide");
                div.html(cards.status);
            }
        }
    });
}

function loadCategories() {
    $.ajax({
        url: '/controllers/loader-json.php',
        dataType: "json",
        data: {
            mode: "categories"
        },
        beforeSend: function() {
            $("#left-loading").removeClass("hide");
        },
        complete: function() {
            $("#left-loading").addClass("hide");
        },
        success: function(categories) {
            var div = $("#categories-content");
            var html = "";
            var counter = 0;
            if (categories.status === "success") {
                $("#categories-empty").addClass("hide");

                html += '<ul class="pure-menu-list">';

                if (categories.data !== null) {
                    categories.data.forEach(function(cat) {
                        html += '<div class="pure-menu">';
                        html += '<span class="icon dripicons-list"></span> ' + cat.name;
                        html += '<button class="pure-menu-btn"><span class="icon dripicons-plus"></span></button></div>';

                        if (cat.subcategories.length > 0) {
                            cat.subcategories.forEach(function(subcat) {
                                html += '<li class="pure-menu-item">';
                                html += '<a href="#" class="pure-menu-link" onclick="loadSubcategory(' + subcat.id + ')">';
                                html += '<span class="icon dripicons-dot"></span>' + subcat.name + '</a></li>';
                            })
                        }
                    })
                    div.html(html);
                } else {
                    $("#categories-empty").removeClass("hide");
                    div.html(categories.data);
                }
                html += '</ul>';
            } else {
                $("#categories-empty").removeClass("hide");
                div.html(categories.status);
            }
        }
    });
}
