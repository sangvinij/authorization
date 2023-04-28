Система аутентификации и регистрации пользователей с использованием DRFTokenAuthentication

Технологии: Python 3.10, Django, Django Rest Framework, Djoser

Как запускать:
1. Склонировать репозиторий
2. Открыть директорию проекта в терминале
3. Запустить в терминале:
    - poetry shell (https://python-poetry.org/docs/ - документация по poetry)
    - poetry update
    - cd authentication
    - python manage.py makemigrations
    - python manage.py migrate
    - python manage.py runserver

4. Некоторые эндпоинты для отправки запросов:
    - auth/users/ - зарегистрировать пользователя, просмотреть список пользователей
    - auth/users/me/ - просмотреть информацию об авторизованном пользователе / изменить данные пользователя
    - auth/token/login/ - создать токен авторизации
    - auth/token/logout/ - удалить токен авторизации
  
Полный список эндпоинтов, а также настроек можно посмотреть по этим ссылкам:
    https://djoser.readthedocs.io/en/latest/base_endpoints.html;
    https://djoser.readthedocs.io/en/latest/token_endpoints.html;
    https://djoser.readthedocs.io/en/latest/settings.html.
  
Некоторые данные можно получить/отправить только будучи авторизованным пользователем. 
Для того, чтобы дать понять серверу, что пользователь авторизован, в header запроса 
необходимо указать токен авторизации в формате: {'Authorization': 'Token tk'}, где tk - токен
