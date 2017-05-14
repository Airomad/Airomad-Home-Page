<?php

$answer = new stdClass();

if (isset($_REQUEST)) {
    $answer->status = "success";
    $file = trim($_REQUEST["file"]);
    $mode = trim($_REQUEST["mode"]);
    $data = NULL;
    switch ($mode) {
        case "cards":
            $data = loadCardData($file);
            break;

        case "categories":
            $data = loadCategories();
            break;

        default:
            $data = NULL;
            break;
    }
    $answer->data = $data;
} else {
    $answer->status = "error";
}

echo json_encode($answer);

function loadCardData($file) {
    $file = "../data/" . $file . ".category.json";
    $answer = [];

    if (file_exists($file)) {
        $cards = json_decode(file_get_contents($file));
        foreach ($cards->cards as $card) {
            array_push($answer, $card);
        }
    } else {
        return NULL;
    }
    return $answer;
}

function loadCategories() {
    $file = "../data/data.json";
    $answer = [];

    if (file_exists($file)) {
        $categories = json_decode(file_get_contents($file));
        foreach ($categories->categories as $category) {
            array_push($answer, $category);
        }
    } else {
        return NULL;
    }
    return $answer;
}

?>
