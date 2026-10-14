create table person_audit 
(
    created timestamptz default current_timestamp not null,
    type_event char(1) default 'I' not null,
    row_id bigint not null,
    name varchar, 
    age integer,
    gender varchar,
    address varchar,
    constraint ch_type_event check (type_event in ('I', 'U', 'D'))
);

create function fnc_trg_person_insert_audit()
returns trigger as $trg_person_insert_audit$
    begin
        insert into person_audit (type_event, row_id, name, age, gender, address)
        values ('I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
        return null;
    end;
$trg_person_insert_audit$ language plpgsql;


create trigger trg_person_insert_audit
    after insert on person 
    for each row 
    execute function fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) 
VALUES (10,'Damir', 22, 'male', 'Irkutsk');