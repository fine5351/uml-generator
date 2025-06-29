create table employee(
    id bigint primary key auto_increment,
    employee_id varchar(255) unique,
    name varchar(255),
    gender varchar(255),
    created_by varchar(255),
    created_at datetime default current_timestamp,
    updated_by varchar(255),
    updated_at datetime default current_timestamp on update current_timestamp
);