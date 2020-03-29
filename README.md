/*
1. where should i use "alter table"

3. Save your CREATE TABLE statements and INSERT INTO commands in your SQL file.
4. In additional, ManiGem requested that the following commonly used SQL commands to be added to your SQL file as well:
    -Select all the products
    -Select all the sale details for a given transaction ID ‘XXXXXXX’
    -Select all the sale transactions within the current month
    -Increase the price of all the products whose type is ‘bracelet’ by 1USD
    -Decrease the price of all the products whose type is ‘ring’ by 1USD
*/

drop table if exists Customer;
create table Customer(
    cID INT primary key,
    cNAME VARCHAR(30) not null,
    PHONE_NUMBER INT not null,
    Address varchar(150),
    check(PHONE_NUMBER) /*how to check phone number in 9 digit? */
);



insert into customer values(1000,"Tony Han",012366253,"123 Nguyen Van Linh");
insert into customer values(1001,"Sarah Kim",012366252,"124 Nguyen Van Linh");
insert into customer values(1002,"Kathy Man",012366251,"125 Nguyen Van Linh");
insert into customer values(1003,"Nguyen Nguyen",012366233,"126 Nguyen Van Linh");
insert into customer values(1004,"John Lee",012366257,"127 Nguyen Van Linh");




drop table if exists Product;
create table Product(
    pID varchar(30) primary key,
    pNAME VARCHAR(30),
    Price_$ int,
    Type varchar(30),
    color varchar(30)
);

insert into Product values("BR001", "Gold bracelet", 10, "bracelet","gold");
insert into Product values("BR002", "sliver bracelet", 150, "bracelet","silver");
insert into Product values("BR003", "Gold neckless", 123, "neckless", "gold");
insert into Product values("BR004", "Gold neckless", 199, "neckless", "silver");
insert into Product values("BR005", "Diamold earring", 299, "earring", "diamold");

drop table if exists Sale;
create table Sale(
    transaction_ID VARCHAR(7) primary key,
     /* how to do 7 digit number??*/
    cID int,
    date date,
    total_price_$ int,
    constraint pk_Customer foreign key(cID) REFERENCES Customer(cID)
);

insert into Sale values(1800008, 1001, '2018-09-09', 150);
insert into Sale values(1800001, 1002, '2018-09-01', 190);
insert into Sale values(1800002, 1003, '2018-09-10', 240);
insert into Sale values(1800003, 1004, '2018-10-09', 540);
insert into Sale values(1800004, 1005, '2018-06-10', 850);



drop table if exists Sale_detail;
create table Sale_detail(
    pID varchar(30),
    transaction_ID int,
    quantity int,
    check(1800000 <transaction_ID <10000000),/* it is connected with table above, still need to solve this problem*/
    constraint fk_product foreign key(pID) REFERENCES Product(pID),
    constraint fk_Sale foreign key(transaction_ID) REFERENCES Sale(transaction_ID)
);

insert into Sale_detail values("BR001", 1800008, 10);
insert into Sale_detail values("BR002", 1800001, 4);
insert into Sale_detail values("BR003", 1800002, 6);
insert into Sale_detail values("BR004", 1800003, 9);
insert into Sale_detail values("BR005", 1800004, 14);
