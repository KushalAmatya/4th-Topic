create database examqn;
use examqn;
create table employee(
employee_name varchar(40) primary key,
street varchar(40),
city varchar(40)
);
create table company(
company_name varchar(40) primary key,
city varchar(40)
);
create table works(
employee_name varchar(40),
company_name varchar(40),
salary int,
primary key(employee_name,company_name),
foreign key (employee_name) references employee (employee_name),
foreign key (company_name) references company (company_name)
);

insert into employee(employee_name,street,city) values ("Bijayaa","KamalPokhari","Bhaktapur");
insert into company(company_name,city) values("XYZ","Bhaktapur");
insert into works(employee_name,company_name,salary) values ("Bijayaa","XYZ","2000");

select employee_name,street,city from employee where employee_name in (select employee_name from works where company_name ="ABC" and salary>35000);
select employee_name from employee where employee_name in (select employee_name from works where company_name ="XYZ" and salary<5000);
select e.employee_name,c.company_name,c.city from employee e join works w on w.employee_name = e.employee_name join company c on c.company_name = w.company_name and e.city=c.city;
update company set city="Pokhara" where city ="Pokhara" and company_name ="XYZ";