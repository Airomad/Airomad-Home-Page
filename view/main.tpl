<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="/view/style/pure/grids-min.css">
        <link rel="stylesheet" href="/view/style/pure/menus-min.css">
        <link rel="stylesheet" href="/view/style/main.css">
        <link rel="stylesheet" href="/view/style/dripicons/style.css">
        <link rel="stylesheet" href="/view/style/dripicons/webfont.css">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><?=$this->e($title)?></title>
    </head>
    <body>

        <div class="pure-g">

            <div class="pure-u-4-24 section-left">

                <button class="btn-wide" id="new-category-btn"><span class="icon dripicons-plus"></span> new category</button>

                <div id="left-loading" class="loading-gears"></div>
                <div id="categories-empty" class="empty hide">There are no categories!</div>

                <div id="categories-content"></div>

                <?php if (0) : ?>
                    <ul class="pure-menu-list">

                        <?php foreach ($categories as $cat) : ?>

                            <div class="pure-menu">
                                <span class="icon dripicons-list"></span>
                                <?php echo $cat->name; ?>
                                <button class="pure-menu-btn"><span class="icon dripicons-plus"></span></button>
                            </div>

                            <?php if ($cat->subcategories !== NULL) : ?>

                                <?php foreach ($cat->subcategories as $subcat) : ?>

                                    <li class="pure-menu-item">
                                        <a href="#" class="pure-menu-link" onclick="loadSubcategory(<?php echo $subcat->id; ?>)">
                                            <span class="icon dripicons-dot"></span>
                                            <?php echo $subcat->name; ?>
                                        </a>
                                    </li>

                                <?php endforeach; ?>

                            <?php endif; ?>

                        <?php endforeach; ?>

                    </ul>

                <?php endif; ?>

            </div>

            <div id="right" class="pure-u-20-24 section-right">
                <button class="btn-wide"><span class="icon dripicons-plus"></span> new bookmark</button>

                <div id="right-loading" class="loading-gears"></div>
                <div id="cards-empty" class="empty hide">There are no cards!</div>

                <div id="cards-content"></div>

            </div>
        </div>

    <!-- The Modal -->
    <div id="new-category" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <span class="close">&times;</span>
                Add new category
            </div>
            <div class="modal-body">
                Category name:
                <br><br>
                <input type="text">
            </div>
        </div>
    </div>

    <script type="text/javascript" src="/node_modules/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="/view/js/main.js"></script>
    </body>
</html>
