create function fnc_fibonacci(pstop integer = 10)
returns table (
    fib int
) as $$
    declare 
        fib_1 int := 0;
        fib_2 int := 1;
    begin
        if (fib_1 < pstop) then 
            fib = fib_1;
            return next;
        end if;
        if (fib_2 < pstop) then 
            fib = fib_2;
            return next;
        end if;
        loop 
            fib_2 := fib_1 + fib_2;
            fib_1 := fib_2 - fib_1;
            if (fib_2 < pstop) then 
                fib = fib_2;
                return next;
            end if;
            exit when fib_2 >= pstop;
        end loop;
    end;
$$ language plpgsql;

select * from fnc_fibonacci(100);

select * from fnc_fibonacci();