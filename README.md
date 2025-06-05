# kototinder2

Приложение напоминающее Tinder с возможностью оценивать ("свайпать") котиков и смотреть информации о них, а также отсматривать понравившихся котиков.

# Выполненные функциональные требования:

- Добавляется экран лайкнутых котиков, со скроллящимся списком всех лайкнутых котиков. Хранятся только в рантайме, после перезагрузки приложения список пуст;
- Экран лайкнутых котиков отображает список с изображением, породой и датой лайка;
- В списке есть с возможность удаления карточки из списка;
- Фильтрация по породе работает на этих экранах лайков, реализовано через выпадающий список;
- При выборе породы в фильтре список обновляется мгновенно;
- При длительной загрузке приложение показывает progress bar;
- При ошибке сети отображается диалог с ошибкой.

# Техническая реализация

assets/icons/

├── cat_paw.png

lib/

├── main.dart

├── app.dart

├── di.dart

├── data/

|    └── models/

|         └── cat_model.dart

├── domain/

|    └── repositories/

│        └── cat_repository.dart

├── presentation/

|    ├── bloc/

|        ├── cat_bloc.dart

│        ├── cat_event.dart

│        ├── cat_state.dart

│        ├── liked_cats_bloc.dart

│        ├── liked_cats_event.dart

│        └── liked_cats_state.dart

|    ├── widgets/

│        ├── reaction_button.dart

│        └── cat_swipe_animation.dart

|    └── screens/

|         ├── cat_explorer_screen.dart
    
|         └── cat_details_screen.dart

# Ссылка на скачивание актуальной версии APK:

- https://drive.google.com/file/d/1HKgHQfK7BegtACT7J8pU_ei7dqXn6X_8/view?usp=sharing

# Скриншоты приложения (нового функционала)

## Главный экран c обновлённым счётчиком лайков:
 
![2025-06-04 (7)](https://github.com/user-attachments/assets/c3a99bb5-c4e9-4030-8556-e7e44c1891d0)

## Экран лайкнутых котиков, отсортированных по породе:

![Снимок экрана 2025-06-05 044659](https://github.com/user-attachments/assets/e57d0fc7-868f-4717-9137-52a544803e44)

## Сообщение об удалении котика из лайкнутых:

![2](https://github.com/user-attachments/assets/be321514-a2ac-41dc-9570-1af281e0be78)

