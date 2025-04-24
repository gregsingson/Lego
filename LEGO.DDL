-- Table for colors.csv
CREATE TABLE colors (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    rgb VARCHAR(6),
    is_trans NUMBER(1) 
);

-- Table for part_categories.csv
CREATE TABLE part_categories (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Table for themes.csv
CREATE TABLE themes (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES themes(id)
);

-- Table for sets.csv
CREATE TABLE sets (
    set_num VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255),
    year INT,
    theme_id INT,
    num_parts INT,
    FOREIGN KEY (theme_id) REFERENCES themes(id)
);

-- Table for parts.csv
CREATE TABLE parts (
    part_num VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255),
    part_cat_id INT,
    FOREIGN KEY (part_cat_id) REFERENCES part_categories(id)
);

-- Table for inventories.csv
CREATE TABLE inventories (
    id INT PRIMARY KEY,
    version INT,
    set_num VARCHAR(50),
    FOREIGN KEY (set_num) REFERENCES sets(set_num)
);

-- Table for inventory_parts.csv
CREATE TABLE inventory_parts (
    inventory_id INT,
    part_num VARCHAR(50),
    color_id INT,
    quantity INT,
    is_spare NUMBER(1), 
    PRIMARY KEY (inventory_id, part_num, color_id, is_spare), 
    FOREIGN KEY (inventory_id) REFERENCES inventories(id),
    FOREIGN KEY (part_num) REFERENCES parts(part_num),
    FOREIGN KEY (color_id) REFERENCES colors(id)
);