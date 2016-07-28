;<? exit(); ?>

license = "fbiacahici fgjgjhnrnj osrtuxyxsa 6db79faafa ffjkhmklih olornqkspu xyw4w54b7c bc9hcfhb9i jfgjlphqor jlpvrttsqt x44dae3a8d cfbaebdd hlmpojoqnm rtmqv9ubu7 7db74d598d bljldokngq gkppprjvnn u3v8u7ua4f 499iahgkhi ekfqmnmllk posvrto2q2 p5va378h7d 8kfddm9lii iqlnhpioqv p8r3s8q7r9 4c9e6eca7j affi "

[database]

;Сервер базы данных
db_server = "localhost"

;Пользователь базы данных
db_user = "sushi"

;Пароль к базе
db_password = "12345"

;Имя базы
db_name = "sushi"

;Префикс для таблиц
db_prefix = s_;

;Кодировка базы данных
db_charset = UTF8;

;Режим SQL
db_sql_mode =;

;Смещение часового пояса
;db_timezone = +04:00;


[php]
error_reporting = E_ALL;
php_charset = UTF8;
php_locale_collate = ru_RU;
php_locale_ctype = ru_RU;
php_locale_monetary = ru_RU;
php_locale_numeric = ru_RU;
php_locale_time = ru_RU;
;php_timezone = Europe/Moscow;

logfile = admin/log/log.txt;

[smarty]

smarty_compile_check = true;
smarty_caching = false;
smarty_cache_lifetime = 0;
smarty_debugging = false;
smarty_html_minify = false;
 
[images]
;Использовать imagemagick для обработки изображений (вместо gd)
use_imagick = true;

;Директория оригиналов изображений
original_images_dir = files/originals/;

;Директория миниатюр
resized_images_dir = files/products/;

;Изображения категорий
categories_images_dir = files/categories/;

;Изображения брендов
brands_images_dir = files/brands/;

;Файл изображения с водяным знаком
watermark_file = simpla/files/watermark/watermark.png;

[files]

;Директория хранения цифровых товаров
downloads_dir = files/downloads/;
