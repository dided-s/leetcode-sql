DROP TABLE IF EXISTS Users;

DROP TABLE IF EXISTS Orders;

DROP TABLE IF EXISTS Items;

CREATE TABLE IF NOT EXISTS Users (
    user_id        INT,
    join_date      DATE,
    favorite_brand VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id   INT,
    order_date DATE,
    item_id    INT,
    buyer_id   INT,
    seller_id  INT
);

CREATE TABLE IF NOT EXISTS Items (
    item_id    INT,
    item_brand VARCHAR(10)
);

TRUNCATE TABLE Users;

INSERT INTO Users (user_id, join_date, favorite_brand)
VALUES ('1', '2018-01-01', 'Lenovo');

INSERT INTO Users (user_id, join_date, favorite_brand)
VALUES ('2', '2018-02-09', 'Samsung');

INSERT INTO Users (user_id, join_date, favorite_brand)
VALUES ('3', '2018-01-19', 'LG');

INSERT INTO Users (user_id, join_date, favorite_brand)
VALUES ('4', '2018-05-21', 'HP');

TRUNCATE TABLE Orders;

INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id)
VALUES ('1', '2019-08-01', '4', '1', '2');

INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id)
VALUES ('2', '2018-08-02', '2', '1', '3');

INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id)
VALUES ('3', '2019-08-03', '3', '2', '3');

INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id)
VALUES ('4', '2018-08-04', '1', '4', '2');

INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id)
VALUES ('5', '2018-08-04', '1', '3', '4');

INSERT INTO Orders (order_id, order_date, item_id, buyer_id, seller_id)
VALUES ('6', '2019-08-05', '2', '2', '4');

TRUNCATE TABLE Items;

INSERT INTO Items (item_id, item_brand)
VALUES ('1', 'Samsung');

INSERT INTO Items (item_id, item_brand)
VALUES ('2', 'Lenovo');

INSERT INTO Items (item_id, item_brand)
VALUES ('3', 'LG');

INSERT INTO Items (item_id, item_brand)
VALUES ('4', 'HP');
