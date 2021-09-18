<?php
/*
	Author: Igor Mirochnik
	Site: http://ida-freewares.ru
    Site: http://im-cloud.ru
	Email: dev.imirochnik@gmail.com
	Type: commercial
*/

// Heading
$_['heading_title']       = '<i class="fa fa-cloud-download fa-fw" style="color:#0362B6;margin-right:5px"></i>IMDBOptimizer (OC 2.3)';
$_['curr_heading_title']       = 'IMDBOptimizer (OC 2.3) - Оптимизация базы данных';
$_['heading_title_h1']       = 'IMDBOptimizer - Оптимизация базы данных';
// Text
$_['text_module']         = 'Модули';
$_['text_success']        = 'Модуль IMDBOptimizer (OC 2.3) успешно обновлен!';
$_['text_content_top']    = 'Верх страницы';
$_['text_content_bottom'] = 'Низ страницы';
$_['text_column_left']    = 'Левая колонка';
$_['text_column_right']   = 'Правая колонка';
$_['text_none']   = '';

$_['all_items_default'] = 'Все элементы';
$_['no_set_default'] = '<Не выбран шаблон настроек>';

// Поля
$_['module_label'] = array(
	'label_tab_dbopt' => 'Индексы',
	'label_tab_service' => 'Сервис',
	'label_tab_cache' => 'Кэш SQL-запросов',
	// 1.4.0
	'label_tab_log' => 'Лог медленных SQL-запросов',
	'label_tab_settings' => 'Настройки',
	'label_load_settings' => 'Загрузить настройки',
	'label_lic_key' => 'Лицензия - Ключ 1',
	'label_lic_enc_mess' => 'Лицензия - Ключ 2',
	'label_lic_date_until' => 'Лицензия - Дата окончания',
	'label_settings_lic' => 'Лицензия',
	'label_filter_tables' => 'Таблицы',
	'label_field_names' => 'Конкретные имена',
	'label_field_starts' => 'Поля начинаются с (через запятую)',
	'label_field_ends' => 'Поля заканчиваются на (через запятую)',
	'label_field_table_index_map' => 'Карта индексов (см. инструкцию)',
	'label_field_log' => 'Лог выполнения и результаты',
	'label_field_cache_enable' => 'Включить кэш?',
	'label_field_cache_maxdblen' => 'Максимальный размер вставки в БД',
	'label_field_cache_expire' => 'Время жизни кэша (сек)',
	'label_field_cache_filters' => 'Фильтр запросов по словам',
	'label_field_cache_urls' => 'Исключить страницы',
	// 1.4.1
	'label_field_cache_mintime_to_cache' => 'Минимальное время для кэша (мс)',
	// 1.4.0
	'label_field_cache_table_type' => 'Тип таблицы хранения SQL-кэша',
	'label_dbopt_index_warning' => 'Прежде, чем выполнять генерацию индексов, настоятельно рекомендуется <b>сделать бэкап всей базы данных</b>',
	'label_field_enable_log_slow_query' => 'Включить лог медленных запросов?',
	'label_field_enable_log_slow_query_admin' => 'Логировать запросы в админке',
	'label_field_log_slow_query_time' => 'Время мин. (мс)',
	'label_field_log_slow_query_write_url' => 'Записывать в лог URL',

	'label_settings_secret_key' => 'Настройки - секретный ключ',
	'label_api_secret_key' => 'Секретный ключ',
	'label_settings_module_actions' => 'Список действий (через запятую)',
	'label_api_secret_key_sample' => 'Часть ссылки для вставки',
);

$_['module_js_texts'] = array(
	'save' => 'Сохраняем...',
	'saveSetOk' => 'Настройки cохранены!',
	'saveSetFail' => 'Настройки не cохранены!',
	// Загрузка
	'load' => 'Загружаем...',
	'loadOk' => 'Данные загружены!',
	'loadFail' => 'Данные не загружены!',
	// Генерация
	'startGen' => 'Начинаем генерацию...',
	'genOk' => 'Генерация завершена!',
	'genFail' => 'Генерация не завершена!',
	'genIndAll' => 'Сгенерировано индексов: ',
	'genIndAllErr' => 'Количество ошибок: ',
	// Удаление
	'startRemove' => 'Начинаем удаление...',
	'removeOk' => 'Удаление завершено!',
	'removeFail' => 'Удаление не завершено!',
	'removeIndAll' => 'Удалено индексов: ',
	'removeIndAllErr' => 'Количество ошибок: ',
	// Оптимизация
	'startOptimize' => 'Начинаем оптимизацию...',
	'optimizeOk' => 'Оптимизация завершена!',
	'optimizeFail' => 'Оптимизация не завершена!',
	'optimizeAll' => 'Оптимизировано таблиц: ',
	'optimizeAllErr' => 'Количество ошибок: ',
	// Починка
	'startRepair' => 'Начинаем починку...',
	'repairOk' => 'Починка завершена!',
	'repairFail' => 'Починка не завершена!',
	'repairAll' => 'Починено таблиц: ',
	'repairAllErr' => 'Количество ошибок: ',
	// Кэш
	'removeCache' => 'Удаляем...',
	'removeCacheOk' => 'Кэш удален!',
	'removeCacheFail' => 'Кэш не удален!',
	// Лог
	'removeLog' => 'Удаляем...',
	'removeLogOk' => 'Лог удален!',
	'removeLogFail' => 'Лог не удален!',
);

// Кнопки
$_['module_btn_label'] = array(
	'button_save' => 'Сохранить шаблон!',
	'button_save_settings' => 'Сохранить настройки!',
	'button_save_settings_no_reload' => 'Сохранить настройки (без перезагрузки)!',
	'button_generate' => 'Генерировать!',
	'button_get_product' => 'Загрузить список продуктов',
	'button_get_settings' => 'Загрузить',
	'button_delete_settings' => 'Удалить',
	'button_generate_clear' => 'Очистить!',
	'button_attr_add' => 'Добавить',
	'button_option_add' => 'Добавить',
	'button_delete' => 'Удалить',
	'button_up' => 'Вверх',
	'button_down' => 'Вниз',
	'button_add' => 'Добавить',
	'button_show_data' => 'Показать данные таблиц!',
	'button_remove' => 'Удалить!',
	'button_repair' => 'Починить!',
	'button_optimize' => 'Оптимизировать!',
	'button_save_cache_settings' => 'Сохранить настройки!',
	'button_clear_cache' => 'Удалить кэш!',
	// 1.4.0
	'button_download_log_file' => 'Скачать файл лога',
	'button_save_log_settings' => 'Сохранить настройки!',
	'button_clear_log' => 'Удалить лог!',
);
$_['label_btn_delimeter'] = 'Настройки кнопок';
$_['label_btn_ok'] = 'Кнопка "OK"';
$_['label_btn_cancel'] = 'Кнопка "Отмена"';

$_['label_list_off'] = 'Отключено';
$_['label_list_on'] = 'Включено';

$_['label_multiselect_set_all'] = 'Выделить всё';
$_['label_multiselect_clear_all'] = 'Снять выделение';

// Error
$_['error_permission']    = 'У Вас нет прав для изменения модуля IMDBOptimizer (OC 2.3)!';
$_['lic_permission'] = 'Необходимо ввести лицензионные параметры';
