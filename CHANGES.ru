
Изменения в Angie 1.3.1                                           18.10.2023

    *) Безопасность: добавлены дополнительные ограничения при обработке
       потоков HTTP/2, чтобы лучше противостоять DoS-атаке "HTTP/2 Rapid
       Reset" (CVE-2023-44487).


Изменения в Angie 1.3.0                                           19.09.2023

    *) Добавление: возможность указывать в директиве "location" несколько
       строк для сопоставления, что позволяет объединить несколько блоков
       "location" с одинаковыми настройками и, таким образом, упростить
       конфигурацию за счет уменьшения дублирования.

    *) Добавление: экспорт различных метрик статистики в формате Prometheus
       с гибко настраиваемыми шаблонами при помощи новых директив
       "prometheus" и "prometheus_template".

    *) Добавление: детальная информация и метрики по группам проксируемых
       stream-серверов в интерфейсе статистики, предоставляемом директивой
       "api".

    *) Добавление: опция "resolve" директивы "server" в блоке "upstream"
       модуля "stream", позволяющая отслеживать изменения списка IP-адресов,
       соответствующего доменному имени, и автоматически обновлять его без
       перезагрузки конфигурации.

    *) Добавление: опция "service" директивы "server" в блоке "upstream"
       модуля "stream", позволяющая получать списки адресов из DNS-записей
       SRV, с базовой поддержкой приоритета.

    *) Добавление: получение содержимого конфигурационных файлов, с которыми
       было запущено текущее поколение рабочих процессов, в интерфейсе,
       предоставляемом директивой "api" при включении директивы
       "api_config_files".

    *) Добавление: отображение номера поколения конфигурации в именах
       процессов, что позволяет с помощью утилиты "ps" отслеживать успех
       перезагрузок конфигурации и количество поколений рабочих процессов с
       предыдущими версиями конфигурации.

    *) Добавление: вся функциональность nginx 1.25.2.

    *) Исправление: сборка завершалась ошибкой при использовании опций
       ./configure "--without-http_upstream_zone_module" или
       "--without-stream_upstream_zone_module"; ошибка появилась в 1.2.0.

    *) Изменение: теперь при загрузке конфигурации OpenSSL используется
       appname "angie".


Изменения в Angie 1.2.0                                           30.05.2023

    *) Добавление: директива "sticky" и сопутствующие настройки в блоке
       "upstream" HTTP-модуля, позволяющие задать режим привязки сессий, при
       котором все запросы в рамках сессии будут направляться на один и тот
       же сервер.

    *) Добавление: переменная $upstream_sticky_status, принимающая значения
       "NEW", "HIT" или "MISS" в зависимости от успеха направления запроса
       на релевантный проксируемый сервер с включенной привязкой сессий.

    *) Добавление: поддержка NTLS в HTTP и stream модулях при использовании
       TLS библиотеки TongSuo, которую можно включить опцией сборки
       "--with-ntls" и сконфигурировать с помощью соответствующих директив
       "ssl_ntls" и "proxy_ssl_ntls".

    *) Добавление: в HTTP и stream прокси-модулях теперь можно настраивать
       несколько сертификатов разного типа (RSA и ECDSA) и соответствующих
       им ключей, используя директивы "proxy_ssl_certificate" и
       "proxy_ssl_certificate_key".

    *) Добавление: вывод версии и сборки в отображаемом имени "master"
       процесса, что позволяет с помощью утилиты "ps" получить эту
       информацию о работающем экземпляре сервера.

    *) Добавление: возможность сжатия модулем gzip ответов со статусом "207
       Multi-Status". Спасибо DBotThePony.

    *) Добавление: вся функциональность nginx 1.25.0, включая поддержку
       HTTP/3.


Изменения в Angie 1.1.0                                           24.01.2023

    *) Добавление: опция "resolve" директивы "server" в блоке "upstream"
       HTTP-модуля, позволяющая отслеживать изменения списка IP-адресов,
       соответствующего доменному имени, и автоматически обновлять его без
       перезагрузки конфигурации.

    *) Добавление: опция "service" директивы "server" в блоке "upstream"
       HTTP-модуля, позволяющая получать списки адресов из DNS SRV записей,
       с базовой поддержкой приоритета.

    *) Добавление: детальная информация и метрики по группам проксируемых
       HTTP-серверов в интерфейсе статистики, предоставляемом директивой
       "api".

    *) Добавление: autoindex выводит листинги директорий в естественном
       порядке.

    *) Добавление: вся функциональность nginx 1.23.3.

    *) Исправление: сборка завершалась ошибкой из-за ложного предупреждение
       компилятора при использовании GCC 9 и старее с оптимизацией -O2 и
       выше.


Изменения в Angie 1.0.0                                           27.10.2022

    *) Добавление: директива "api", реализующая HTTP RESTful интерфейс для
       получения в формате JSON базовой информации о веб-сервере, а также
       статистики по клиентским соединениям, зонам разделяемой памяти,
       DNS-запросам, HTTP-запросам, кэшу HTTP-ответов, сессиям модуля stream
       и зонам модулей limit_conn/limit_req.

    *) Добавление: директива "status_zone" в модуле http для указания зоны
       сбора статистики по запросам в "server" и "location" контекстах.

    *) Добавление: директива "status_zone" в модуле stream для указания зоны
       сбора статистики по TCP/UDP сессиям.

    *) Добавление: параметр status_zone директивы resolver для указания зоны
       сбора статистики по DNS-запросам.

    *) Добавление: переменная $angie_version, содержащая версию Angie.

    *) Добавление: вся функциональность nginx 1.23.2.

