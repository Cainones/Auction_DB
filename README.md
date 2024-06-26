# База данных для онлайн аукциона по игре EFT
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
+ [Типовые запросы](#Типовые-запросы)
- [View-представление](#View-представление)
* [Хранимые процедуры](#Хранимые-процедуры)
+ [Триггер для хранимой процедуры](#Триггер-для-хранимой-процедуры)

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

> [!IMPORTANT]
> ## View-представление:

### Данное представление объединяет данные из различных таблиц, предоставляя комплексную информацию о предметах:

```sql
CREATE VIEW items_information AS
SELECT items.id AS item_id,
       items.title AS item_title,
       characteristic.id AS characteristic_id,
       characteristic.price_per_slot,
       characteristic.merchant_s_price,
       characteristic.initial_price,
       characteristic.sizes,
       characteristic.mass,
       items_type.id AS item_type_id,
       items_type.type AS item_type,
       merchant_s_price.id AS merchant_price_id,
       merchant_s_price.merchant_s_price AS merchant_item_price,
       merchant_s_price.link_url
FROM items
JOIN characteristic ON items.characteristic_id = characteristic.id
JOIN items_type ON characteristic.items_type_id = items_type.id
LEFT JOIN merchant_s_price ON items.id = merchant_s_price.items_id
LEFT JOIN merchant_s ON merchant_s_price.id = merchant_s.supply_m_id;
```

> [!IMPORTANT]
> ## Хранимые процедуры: 

### Данная хранимая процедура содержит: 
- Обработчик исключений
* Транзакцию 
+ Условие

```sql
DELIMITER $$

CREATE PROCEDURE AddNewItem(
    IN new_item_title VARCHAR(255),
    IN new_item_type VARCHAR(255),
    IN new_characteristic_price_per_slot DECIMAL(10,2),
    IN new_characteristic_merchants_price DECIMAL(10,2),
    IN new_characteristic_initial_price DECIMAL(10,2),
    IN new_characteristic_sizes INT,
    IN new_characteristic_mass DECIMAL(10,2),
    IN new_merchants_price DECIMAL(10,2),
    IN new_link_url VARCHAR(255),
    IN new_merchants_name VARCHAR(255),
    IN new_supply_title VARCHAR(255)
)
BEGIN
    DECLARE existing_item_type_id INT;
    DECLARE existing_merchant_id INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT id INTO existing_item_type_id
    FROM items_type
    WHERE type = new_item_type;

    IF existing_item_type_id IS NULL THEN
        INSERT INTO items_type (type) VALUES (new_item_type);
        SET existing_item_type_id = LAST_INSERT_ID();
    END IF;

    SELECT id INTO existing_merchant_id
    FROM merchant_s
    WHERE merchant_s_price = new_merchants_name;

    IF existing_merchant_id IS NULL THEN
        INSERT INTO merchant_s (merchant_s_price, supply_m_id) VALUES (new_merchants_name, (SELECT id FROM supply_m WHERE title = new_supply_title));
        SET existing_merchant_id = LAST_INSERT_ID();
    END IF;

    INSERT INTO characteristic (
        price_per_slot, 
        merchant_s_price, 
        initial_price, 
        sizes, 
        mass, 
        items_type_id
    ) VALUES (
        new_characteristic_price_per_slot, 
        new_characteristic_merchants_price, 
        new_characteristic_initial_price, 
        new_characteristic_sizes, 
        new_characteristic_mass, 
        existing_item_type_id
    );
    SET @new_characteristic_id = LAST_INSERT_ID();

    INSERT INTO items (title, characteristic_id) VALUES (new_item_title, @new_characteristic_id);
    SET @new_item_id = LAST_INSERT_ID();

    INSERT INTO supply_m (title) VALUES (new_supply_title)
    ON DUPLICATE KEY UPDATE title = new_supply_title;

    SET @new_supply_id = LAST_INSERT_ID();

    INSERT INTO merchant_s_price (
        merchant_s_price, 
        items_id,
        link_url
    ) VALUES (
        new_merchants_price, 
        @new_item_id, 
        new_link_url
    );
    SET @new_merchants_price_id = LAST_INSERT_ID();

    INSERT INTO demand_creates_supply (
        merchant_s_price_id, 
        merchant_s_id
    ) VALUES (
        @new_merchants_price_id, 
        existing_merchant_id
    );
    COMMIT;
END $$

DELIMITER ;
```

> [!IMPORTANT]
> ## Триггер для хранимой процедуры:

### Триггер для автоматического обновления суммарной стоимости характеристик:

```sql
DELIMITER $$

CREATE TRIGGER UpdateTotalCharacter
AFTER UPDATE ON merchant_s_price
FOR EACH ROW
BEGIN
    DECLARE total_price DECIMAL(10,2);

    SELECT SUM(characteristic.merchant_s_price)
    INTO total_price
    FROM merchant_s_price
    JOIN items ON merchant_s_price.items_id = items.id
    JOIN characteristic ON items.characteristic_id = characteristic.id
    WHERE merchant_s_price.id = NEW.id;

    UPDATE characteristic
    SET total_price = total_price
    WHERE id = (
        SELECT characteristic_id
        FROM items
        WHERE id = NEW.items_id
    );
END $$

DELIMITER ;
```

> [!IMPORTANT]
> ## Хранимая процедура для работы с триггером:

### Хранимая процедура для обновления цены предлагаемой торговцем:

```sql
DELIMITER $$

CREATE PROCEDURE UpdateMerchantPrice(
    IN new_merchants_price DECIMAL(10,2),
    IN items_id INT,
    IN new_link_url VARCHAR(255)
)
BEGIN
    DECLARE msp_id INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT id INTO msp_id
    FROM merchant_s_price
    WHERE items_id = items_id;

    -- Если запись существует, обновляем данные
    IF msp_id IS NOT NULL THEN
        UPDATE merchant_s_price
        SET merchant_s_price = new_merchants_price,
            link_url = new_link_url
        WHERE id = msp_id;
    ELSE
        INSERT INTO merchant_s_price (merchant_s_price, items_id, link_url)
        VALUES (new_merchants_price, items_id, new_link_url);
    END IF;

    COMMIT;
END $$

DELIMITER ;
```

> [!CAUTION]
> ## В работе триггера и связанной хранимой процедуры наблюдаються сбои!
