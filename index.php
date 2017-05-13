<?php

require_once "vendor/autoload.php";

$renderer = new League\Plates\Engine($_SERVER["DOCUMENT_ROOT"] . "/view");
$renderer->setFileExtension('tpl');

$categoriesData = json_decode(file_get_contents("data/data.json"));
$data = array(
    "title" => "Airomad Home Page",
    "categories" => $categoriesData->categories,
    "cards" => array(
        ["title" => "Card title here",
        "link" => "http://somedomain.com"],
        ["title" => "Card title here",
        "link" => "http://somedomain.com"],
        ["title" => "Card title here",
        "link" => "http://somedomain.com"],
        ["title" => "Card title here",
        "link" => "http://somedomain.com"],
        ["title" => "Card title here",
        "link" => "http://somedomain.com"],
        ["title" => "Card title here",
        "link" => "http://somedomain.com"],
        ["title" => "Card title here",
        "link" => "http://somedomain.com"],
        ["title" => "Card title here",
        "link" => "http://somedomain.com"],
        ["title" => "Card title here",
        "link" => "http://somedomain.com"],
        ["title" => "Card title here",
        "link" => "http://somedomain.com"]
    )
);

echo $renderer->render('main', $data);

?>
