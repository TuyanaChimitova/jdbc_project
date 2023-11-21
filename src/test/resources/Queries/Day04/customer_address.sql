select * from employees;

CREATE TABLE address(
    address_id Integer PRIMARY KEY,
    address VARCHAR(50) NOT NULL,
    phone Integer NOT NULL
);

INSERT INTO address(address_id, address, phone) VALUES (5, '1913 Hanoi Way', 28303384);

