# База данных для онлайн аукционапо игре EFT
![img](https://github.com/Cainones/Auction_DB/blob/main/Auction_ERD.png)

> [!NOTE]
> ## Развёртка дампа:
- Установите файл Auction_DB.sql
* Разверните дамп проекта
+ Выпоните: Наполнение данными
>[!TIP]
> ## Помощь в навигации:

> [!IMPORTANT]
> ## Система прав и ролей:
### Администратор

```sql
-- Создание роли Администратор
CREATE ROLE IF NOT EXISTS admin; 

-- Предоставление полных прав администратору на схему housing
GRANT ALL PRIVILEGES ON auction_db.* TO admin;

-- Создание пользователя
CREATE USER IF NOT EXISTS 'admins'@'localhost' IDENTIFIED BY 'AVLK75x';

-- Назначение роли пользователю
GRANT admin TO 'admins'@'localhost';

-- Устанавливается роль admin как роль по умолчанию для пользователя 'admin'
SET DEFAULT ROLE admin TO 'admins'@'localhost';

-- Применение изменений прав
FLUSH PRIVILEGES;
```
