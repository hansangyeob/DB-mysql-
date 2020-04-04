drop table if exists Customer;
create table Customer(
    cID INT primary key,
    cNAME VARCHAR(30) not null,
    PHONE_NUMBER varchar(9) not null,
    Address varchar(150),
    constraint k_Customer unique(address)
);

insert into customer values(1001,'Sarah Kim',012366252,'124 Nguyen Van Linh');
insert into customer values(1002,'Kathy Man',012366251,'125 Nguyen Van Linh');
insert into customer values(1003,'Nguyen Nguyen',012366233,'126 Nguyen Van Linh');
insert into customer values(1004,'John Lee',012366257,'127 Nguyen Van Linh');
insert into customer values(1005,'John Kim',012363252,'120 Nguyen Van Linh');



drop table if exists Product;
create table Product(
    pID varchar(30) primary key,
    pNAME VARCHAR(30),
    Price_$ int,
    Type varchar(30),
    color varchar(30),
    constraint k_Product unique(Price_$,Type,color)
);

insert into Product values('BR001', 'Gold bracelet', 10, 'bracelet','gold');
insert into Product values('BR002', 'sliver bracelet', 150, 'bracelet','silver');
insert into Product values('BR003', 'Gold neckless', 123, 'neckless', 'gold');
insert into Product values('BR004', 'Gold neckless', 199, 'neckless', 'silver');
insert into Product values('BR005', 'Diamold earring', 299, 'earring', 'diamold');
insert into Product values('BR006', 'Diamold ring', 200, 'ring', 'diamold');


drop table if exists Sale;
create table Sale(
    transaction_ID VARCHAR(7) primary key,
     /* how to do 7 digit number??*/
    cID INT,
    date date,
    total_price_$ int,
    constraint k_Sale unique(date,total_price_$),
    constraint pk_Customer
        foreign key(cID)
        REFERENCES Customer(cID),
    check (date>'2017-12-31')
);

insert into Sale values(1800008, 1001, '2018-09-09', 150);
insert into Sale values(1800001, 1002, '2018-09-01', 190);
insert into Sale values(1800002, 1003, '2018-09-10', 240);
insert into Sale values(1800003, 1004, '2018-10-09', 540);
insert into Sale values(1800004, 1005, '2018-06-10', 850);
insert into Sale values(1800005, 1006, '2018-06-10', 850);

drop table if exists Sale_detail;
create table Sale_detail(
    pID varchar(30),
    transaction_ID VARCHAR(7),
    quantity int,
/* it is connected with table above, still need to solve this problem*/
    constraint k_Sale_detail unique(quantity),
   foreign key (pID) references product(pID),
   foreign key (transaction_ID) references Sale(transaction_ID),
   check(transaction_ID >= 1800000)
);

insert into Sale_detail values('BR001', 1800008, 10);
insert into Sale_detail values('BR002', 1800001, 4);
insert into Sale_detail values('BR003', 1800002, 6);
insert into Sale_detail values('BR004', 1800003, 9);
insert into Sale_detail values('BR005', 1800004, 14);
insert into Sale_detail values('BR006', 1800005, 12);


/* 6-1*/
select pNAME
from product;


/* 6-2*/
select transaction_ID
from sale
where transaction_ID = 1800001;

/* 6-3*/

select date
from sale
where date between '2018-09-01' and '2018-09-30';

/* 6-4*/
update Product set price_$ = price_$+1
where Type= 'bracelet';

/* 6-5*/
update Product set price_$ = price_$-1
where Type= 'ring';
