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
* [Типовые запросы](#Типовые-запросы)


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

> [!IMPORTANT]
> ## Типовые запросы:

### Запрос на получение всех товаров и их текущих цен у различных торговцев:

```sql
SELECT 
    items.id AS item_id,
    items.title AS item_title,
    merchant_s_price.merchant_s_price AS merchant_price,
    merchant_s_price.link_url
FROM 
    items 
JOIN 
    merchant_s_price ON items.id = merchant_s_price.items_id;
```

### Запрос на получение всех товаров с их типами и характеристиками:

```sql
SELECT 
    items.id AS item_id,
    items.title AS item_title,
    items_type.type AS item_type,
    characteristic.price_per_slot,
    characteristic.merchant_s_price AS characteristic_merchant_price,
    characteristic.initial_price,
    characteristic.sizes,
    characteristic.mass
FROM 
    items
JOIN 
    characteristic ON items.characteristic_id = characteristic.id
JOIN 
    items_type ON characteristic.items_type_id = items_type.id;
```

### Запрос на получение всех товаров определенного типа:

```sql
SELECT 
    items.id AS itemid,
    items.title AS item_title,
    items_type.type AS item_type
FROM 
    items
JOIN 
    characteristic ON items.characteristic_id = characteristic.id
JOIN 
    items_type ON characteristic.items_type_id = items_type.id
WHERE 
    items_type.type = 'Тип_предмета';
```

### Запрос на получение всех торговцев с их товарами и ценами:

```sql
SELECT 
    merchant_s.id AS merchant_id,
    merchant_s.merchant_s_name,
    supply_m.title AS supply_title,
    items.title AS item_title,
    merchant_s_price.merchant_s_price AS merchant_price,
    merchant_s_price.link_url
FROM 
    merchant_s
JOIN 
    supply_m ON merchant_s.supply_m_id = supply_m.id
JOIN 
    demand_creates_supply ON merchant_s.id = demand_creates_supply.merchant_s_id
JOIN 
    merchant_s_price ON demand_creates_supply.merchant_s_price_id = merchant_s_price.id
JOIN 
    items ON merchant_s_price.items_id = items.id;
```

### Запрос на получение всех характеристик для заданного товара:

```sql
SELECT 
    items.id AS itemid,
    items.title AS item_title,
    characteristic.price_per_slot,
    characteristic.merchant_s_price AS characteristic_merchant_price,
    characteristic.initial_price,
    characteristic.sizes,
    characteristic.mass
FROM 
    items
JOIN 
    characteristic ON items.characteristic_id = characteristic.id
WHERE 
    items.title = 'Название товара';
```

> [!WARNING]
> ## Выше перечисленные типовые запросы могут быть выполнены от роли [Администратор](#Администратор) или [Модератор](#Модератор).























