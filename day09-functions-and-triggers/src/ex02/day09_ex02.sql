create function fnc_trg_person_delete_audit()
returns trigger as $trg_person_delete_audit$
    begin
        insert into person_audit (type_event, row_id, name, age, gender, address)
        values ('D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
        return null;
    end;
$trg_person_delete_audit$ language plpgsql;


create trigger trg_person_delete_audit
    after delete on person 
    for each row 
    execute function fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;