# База данных для онлайн аукционапо игре EFT
![img](https://github.com/Cainones/Auction_DB/blob/main/Auction_ERD.png)

> [!NOTE]
> ## Развёртка дампа:
- Установите файл Auction_DB.sql
* Разверните дамп проекта
+ Выпоните: Наполнение данными
>[!TIP]
> ## Помощь в навигации:
- [Система прав и ролей](#Система-прав-и-ролей)
* [Наполнение данными](#Наполнение-данными)


> [!IMPORTANT]
> ## Система прав и ролей:
### Администратор:

```sql
-- Создание роли Администратор:
CREATE ROLE IF NOT EXISTS admin; 

-- Предоставление полных прав администратору:
GRANT ALL PRIVILEGES ON auction_db.* TO admin;

-- Создание пользователя:
CREATE USER IF NOT EXISTS 'admins'@'localhost' IDENTIFIED BY 'AVLK75x';

-- Назначение роли пользователю:
GRANT admin TO 'admins'@'localhost';

-- Устанавливается роль admin как роль по умолчанию для пользователя 'admin':
SET DEFAULT ROLE admin TO 'admins'@'localhost';

-- Применение изменений прав:
FLUSH PRIVILEGES;
```

### Модератор:

```sql
-- Создание роли Модератор:
CREATE ROLE IF NOT EXISTS moderator; 

-- Присвоение прав:
GRANT SELECT, INSERT, UPDATE ON auction_db.items_type TO moderator;
GRANT SELECT, INSERT, UPDATE ON auction_db.characteristic TO moderator;
GRANT SELECT, INSERT, UPDATE ON auction_db.items TO moderator;
GRANT SELECT ON auction_db.demand_creates_supply TO moderator;
GRANT SELECT ON auction_db.merchant_s TO moderator;
GRANT SELECT ON auction_db.merchant_s_price TO moderator;
GRANT SELECT ON auction_db.supply_m TO moderator;

-- Создание пользователя:
CREATE USER IF NOT EXISTS 'moder'@'localhost' IDENTIFIED BY 'VAVLMod1';

-- Назначение роли пользователю:
GRANT moderator TO 'moder'@'localhost';

-- Устанавливается роль moderator как роль по умолчанию для пользователя 'moder':
SET DEFAULT ROLE moderator TO 'moder'@'localhost';

-- Применение изменений прав:
FLUSH PRIVILEGES;
```

### Пользователь:

```sql
-- Создание роли Пользователь:
CREATE ROLE IF NOT EXISTS customers;

-- Присвоение прав:
GRANT SELECT, INSERT ON auction_db.characteristic TO customers;
GRANT SELECT, INSERT ON auction_db.items TO customers;
GRANT SELECT ON auction_db.demand_creates_supply TO customers;
GRANT SELECT ON auction_db.items_type TO customers;
GRANT SELECT ON auction_db.merchant_s TO customers;
GRANT SELECT ON auction_db.merchant_s_price TO customers;
GRANT SELECT ON auction_db.supply_m TO customers;

-- Создание пользователя:
CREATE USER IF NOT EXISTS 'customers'@'localhost' IDENTIFIED BY 'EFT1409';

-- Назначение роли пользователю:
GRANT customers TO 'customers'@'localhost';

-- Устанавливается роль customers как роль по умолчанию для пользователя 'customers'
SET DEFAULT ROLE customers TO 'customers'@'localhost';

-- Применение изменений прав:
FLUSH PRIVILEGES;
```

> [!WARNING]
> ## Наполнение данными:
> - В дампе Auction_DB.sql уже присутствует минимальный набор данных для работы с ней!
