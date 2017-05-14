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
            <section id="left">

            <div class="pure-u-4-24">

                <button class="btn-wide"><span class="icon dripicons-plus"></span> new category</button>

                <?php if ($categories !== NULL && count($categories > 0)) : ?>
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
                                        <a href="#" class="pure-menu-link">
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

            <section>

            <div class="pure-u-20-24 section-right">
                <button class="btn-wide"><span class="icon dripicons-plus"></span> new bookmark</button>

                <?php $counter = 0; ?>
                <?php foreach ($cards as $card) : ?>

                <?php if ($counter % 3 == 0) : ?>
                <div class="pure-g">
                <?php endif; ?>

                    <div class="pure-u-1-3">
                        <div class="card">
                            <div class="card-img">&nbsp;</div>
                            <div class="card-title">Небольшое описание закладки Небольшое описание закладки Небольшое описание</div>
                            <div class="card-link">https://somedomain.com</div>
                        </div>
                    </div>

                <?php if (($counter - 2) % 3 == 0) : ?>
                </div>
                <?php endif; ?>

                <?php $counter++; ?>
                <?php endforeach; ?>

            </div>
        </div>

    </body>
</html>
