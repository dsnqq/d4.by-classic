<?php
declare(strict_types=1);

require_once __DIR__ . '/config.php';

header('Content-Type: text/html; charset=UTF-8');

if (($_SERVER['REQUEST_METHOD'] ?? '') !== 'POST') {
    http_response_code(405);
    exit;
}

$categoryId = isset($_POST['category_id']) ? (int) $_POST['category_id'] : 0;
if ($categoryId < 1) {
    exit;
}

$pfx = DB_PREFIX;
$port = defined('DB_PORT') ? (int) DB_PORT : 3306;

$link = mysqli_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE, $port);
if (!$link) {
    http_response_code(500);
    exit;
}

mysqli_set_charset($link, 'utf8mb4');

$sql = "
    SELECT fd.name
    FROM `{$pfx}category_filter` cf
    INNER JOIN `{$pfx}filter_description` fd ON cf.filter_id = fd.filter_id
    WHERE cf.category_id = ?
";

$stmt = mysqli_prepare($link, $sql);
if (!$stmt) {
    mysqli_close($link);
    http_response_code(500);
    exit;
}

mysqli_stmt_bind_param($stmt, 'i', $categoryId);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

if ($result instanceof mysqli_result) {
    while ($row = mysqli_fetch_assoc($result)) {
        $name = htmlspecialchars((string) ($row['name'] ?? ''), ENT_QUOTES | ENT_HTML5, 'UTF-8');
        echo "<div class='link_modification'> - {$name}</div>\n";
    }
    mysqli_free_result($result);
}

mysqli_stmt_close($stmt);
mysqli_close($link);
