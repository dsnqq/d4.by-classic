<?php
    require_once('config.php');

    // Устанавливаем подключение к базе данных с использованием подготовленных выражений
    $link = mysqli_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
    if (!$link) {
        die("Ошибка подключения: " . mysqli_connect_error());
    }

    // Получаем ID категории
    $category_id = (int)$_POST['category_id'];

    // Подготовленный запрос для получения всех названий фильтров для данной категории
    $query = "
        SELECT fd.name
        FROM oc_category_filter cf
        JOIN oc_filter_description fd ON cf.filter_id = fd.filter_id
        WHERE cf.category_id = ?
    ";
    $stmt = mysqli_prepare($link, $query);
    mysqli_stmt_bind_param($stmt, 'i', $category_id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    // Выводим результаты
    while ($filter_name = mysqli_fetch_assoc($result)) {
        echo "<div class='link_modification'> - " . htmlspecialchars($filter_name['name']) . "</div>";
    }

    // Закрытие соединения
    mysqli_free_result($result);
    mysqli_stmt_close($stmt);
    mysqli_close($link);
?>
