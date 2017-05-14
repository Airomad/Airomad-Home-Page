<?php

$answer = new stdClass();

if (isset($_REQUEST) && isset($_REQUEST["file"])) {
    $answer->status = "success";
    $file = "../data/" . trim($_REQUEST["file"]) . ".category.json";

    if (file_exists($file)) {
        $answer->cards = [];
        $cards = json_decode(file_get_contents($file));
        foreach ($cards->cards as $card) {
            array_push($answer->cards, $card);
        }
    } else {
        $answer->status = "error";
    }
} else {
    $answer->status = "error";
}

echo json_encode($answer);

?>
