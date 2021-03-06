create table DEPT(
DEPTNO INT(2),
DNAME VARCHAR(15),
LOC VARCHAR(10)
);

insert into dept values
(10 ,'ACCOUNTING' ,'NEW YORK'),
(20 ,'RESEARCH', 'DALLAS'),
(30 ,'SALES' ,'CHICAGO'),
(40 ,'OPERATIONS', 'BOSTON');

select * from dept;

create table emp(
EMPNO int(4),
ENAME varchar(10),
JOB varchar(9),
HIREDATE date,
SAL float(7,2),
COMM float(7,2),
DEPTNO int(2)
);
insert into emp values
(7839, 'KING', 'MANAGER', '1991-11-17', 5000, NULL, 10),
(7698 ,'BLAKE', 'CLERK' ,'1981-05-01' ,2850 ,NULL, 30),
(7782 ,'CLARK', 'MANAGER' ,'1981-06-09' ,2450, NULL, 10),
(7566 ,'JONES', 'CLERK', '1981-04-02' ,2975, NULL ,20),
(7654 ,'MARTIN', 'SALESMAN' ,'1981-09-28' ,1250, 1400, 30),
(7499 ,'ALLEN' ,'SALESMAN' ,'1981-02-20' ,1600 ,300 ,30);

select * from emp;

-- Question 3
select * from emp
where sal between 2500 and 5000;

-- Question 4
select ename from emp
order by 1 desc;

-- Question 5
select lower(job) from emp;

-- Question 6
select ename,length(ename) from emp;

-- Question 7
select deptno,count(*) from emp
group by deptno;

-- Question 8
select dname,ename from emp,dept
where dept.deptno=emp.deptno;

-- Question 9
select ename,instr(ename,'ar') from emp;

-- Question 10
select ename,sal,sal*0.2 as "HRA" from emp;

-- tempp table for PROC1
create table tempp(
String1 varchar(100),
String2 varchar(100),
Remark char(50)
);

-- section II QUESTION 1 PROC1
delimiter //
create procedure PROC1(s1 varchar(100),s2 varchar(100))
begin
	declare a int;
    set a=locate(s1,s2);
    if (a <> 0) then
		insert into tempp values(s1,s2,'string1 exists inside string2.');
	else
		insert into tempp values(s1,s2,'string1 not exists inside string2.');
	end if;
end; //
delimiter ;

call PROC1('DAC','CDAC');
select * from tempp;

-- section II QUESTION 2 FUNC1
delimiter //
create function FUNC1(s1 int,s2 int,s3 int)
returns boolean
deterministic
begin
	if (s1+s2>s3) and (s3+s2>s1) and (s1+s3>s2) then
    return true;
    else 
    return false;
    end if;
end; //
delimiter ;

-- direct output by select statement without program
select func1(4,3,10) from dual;
select func1(4,8,10) from dual;

-- triangle table for FUNC1
create table triangle(
side1 int,
side2 int,
side3 int,
remark char(20)
);

-- program for triangle function
delimiter //
create procedure for_triaangle(s1 int,s2 int,s3 int)
begin
	/*declare int x;
    set x=func1(s1,s2,s3);*/
    if func1(1,s2,s3) then
    insert into triangle values(s1,s2,s3,'Is Triangle');
    else
      insert into triangle values(s1,s2,s3,'Is not Triangle');
	end if;
end; //
delimiter ;

call for_triaangle(4,4,4);
call for_triaangle(4,3,10);
select * from triangle;








    
