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

- https://drive.google.com/file/d/1vndt4fW_73AszGhM2fmUhXcKmPnRQvbG/view?usp=drive_link

# Скриншоты приложения (нового функционала)

## Главный экран c обновлённым счётчиком лайков:
 
![2025-06-04 (7)](https://github.com/user-attachments/assets/c3a99bb5-c4e9-4030-8556-e7e44c1891d0)

## Экран лайкнутых котиков, отсортированных по времени добавления:

![2025-06-04 (10)](https://github.com/user-attachments/assets/bf66084b-6c2b-439e-a8a4-46b99bb206d8)

## Сообщение об удалении котика из лайкнутых:

![2025-06-04 (11)](https://github.com/user-attachments/assets/14bbf616-493a-4f91-9a14-369de655ee25)
