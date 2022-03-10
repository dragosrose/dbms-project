--6. Formula?i în limbaj natural o problem? pe care s? o rezolva?i folosind un subprogram stocat care s?
-- utilizeze dou? tipuri de colec?ie studiate. Apela?i subprogramul.

-- Pentru un id de artist introdus la tastatura, sa se afiseze ce piese de arta a creat si pretul acestora.


create or replace procedure arta_si_pret
    (v_id_artist Artist.artist_id%type)
as
    type tablou_index is table of Arta%rowtype index by pls_integer;
    t1 tablou_index;
    --v_art_id Arta.art_id%type;
    type varr is varray(10) of INTEGER;
    t2 varr := varr();
    --i number;
begin
    --i := 0;
    select *
    bulk collect into t1 from Arta
    where artist_id = v_id_artist;
    
    t2.extend(t1.count);    
    for ind in 1..t1.count loop
        t2(ind) := t1(ind).pret;
    end loop;
    
    for ind in 1..t1.count loop
        dbms_output.put_line('Titlul ' || t1(ind).titlu || ' are pretul ' || t2(ind) ||'.');
    end loop;
end arta_si_pret;
/
execute arta_si_pret(3);
/



-- 7.  Formula?i în limbaj natural o problem? pe care s? o rezolva?i folosind un subprogram stocat care s?
--utilizeze un tip de cursor studiat. Apela?i subprogramul.

-- Sa se afiseze piesele de arta a caror pret depaseste 10000

create or replace procedure pret_dep_arta is
    cursor l_arta is
        select * from Arta
        where pret > 10000;
    v_arta l_arta%rowtype;
begin
    open l_arta;
    loop
        fetch l_arta into v_arta;
        exit when l_arta%notfound;
        dbms_output.put_line(l_arta%rowcount || '. ' || v_arta.titlu);
    end loop;
    close l_arta;
end pret_dep_arta;
/
execute pret_dep_arta;
/

-- 8. Formula?i în limbaj natural o problem? pe care s? o rezolva?i folosind un subprogram stocat de tip
--func?ie care s? utilizeze într-o singur? comand? SQL 3 dintre tabelele definite. Trata?i toate excep?iile
--care pot ap?rea. Apela?i subprogramul astfel încât s? eviden?ia?i toate cazurile tratate.

-- Pentru id-ul unui client dat sa se afiseze cat a cheltuit in total pe piesele pe care
-- le-a comandat

create or replace function afisare_arta_client
(v_client_id Client.client_id%type)
return number is
    rezultat number;
    clientel number;
begin
    select client_id into clientel
    from Client
    where client_id = v_client_id;

    select sum (a.pret) into rezultat
    from Arta a
    join Comanda cc on (a.art_id = cc.art_id)
    join Client c on (cc.client_id = c.client_id)
    where c.client_id = v_client_id;
            
    return rezultat;
    
exception
    when no_data_found then
        dbms_output.put_line('Clientul introdus nu exista in baza de date');
    when others then
        dbms_output.put_line('Alta eroare');

end afisare_arta_client;
/

begin
dbms_output.put_line('Clientul cu id-ul 2 a cheltuit ' || afisare_arta_client(2));    
end;
/


begin
dbms_output.put_line('Clientul cu id-ul 7 a cheltuit ' || afisare_arta_client(7));
end;
/


-- 9.Formula?i în limbaj natural o problem? pe care s? o rezolva?i folosind un subprogram stocat de tip
--procedur? care s? utilizeze într-o singur? comand? SQL 5 dintre tabelele definite. Trata?i toate
--excep?iile care pot ap?rea, incluzând excep?iile NO_DATA_FOUND ?i TOO_MANY_ROWS. Apela?i
--subprogramul astfel încât s? eviden?ia?i toate cazurile tratate.


-- Pentru un artist dat sa se afiseze detaliile pentru picturile expuse si a expozitiilor din care fac parte.
-- (an, titlu, pret, descriere, stil, nume expozitie, tara, oras)
create or replace procedure artstyle
(v_nume Artist.nume%type, v_prenume Artist.prenume%type)
is
v_artist_id Artist.artist_id%type;

type t_detalii is record(
    artist_id Artist.artist_id%type,
    art_id Arta.art_id%type,
    titlul Arta.titlu%type,
    an Arta.an%type,
    pret Arta.pret%type,
    descriere Arta.descriere%type,
    nume_stil Stil.nume_stil%type,
    nume_expozitie Expozitie.nume%type,
    tara Expozitie.tara%type,
    oras Expozitie.oras%type
    --art_id Arta_expusa.art_id%type
);


detalii t_detalii;


cursor c_detalii return t_detalii is
    select ar.artist_id, a.art_id, a.titlu, a.an, a.pret, a.descriere, s.nume_stil, e.nume, e.tara, e.oras
    from Artist ar join Arta a on (ar.artist_id = a.artist_id)
    join Stil s on (a.stil_id = s.stil_id)
    join Arta_expusa ae on (a.art_id = ae.art_id)
    join Expozitie e on (e.expozitie_id = ae.expozitie_id)
    where ar.artist_id = v_artist_id;


begin
    select artist_id into v_artist_id
    from Artist
    where lower(nume) like lower(v_nume)
    and lower(prenume) like lower(v_prenume);
    
    dbms_output.put_line('Artistul ' || v_nume ||' ' || v_prenume || ' a expus: ');
    dbms_output.put_line('');
    
    open c_detalii;
    loop
        fetch c_detalii into detalii;
        exit when c_detalii%notfound;
        
                
    if detalii.art_id is not null then
        dbms_output.put_line('Titlu: ' || detalii.titlul);
        dbms_output.put_line('An: ' || detalii.an);
        dbms_output.put_line('Stil: ' || detalii.nume_stil);
        dbms_output.put_line('Pret: ' || detalii.pret);
        dbms_output.put_line('Descriere: ' || detalii.descriere);
        dbms_output.put_line('Expozitie: ' || detalii.nume_expozitie);
        dbms_output.put_line('Tara: ' || detalii.tara);
        dbms_output.put_line('Oras: ' || detalii.oras);
        dbms_output.put_line('');
    end if;
    end loop;
    close c_detalii;
    
    exception
        when no_data_found then
            dbms_output.put_line('Nu exista artist cu numele asta.');
        when too_many_rows then
            dbms_output.put_line('Exista mai multi artisti cu numele asta.');
        when others then
            dbms_output.put_line('Alte erori');

end artstyle;
/

-- input corect
execute artstyle('Carafa','Florina'); 
-- nu exista acest artist
execute artstyle('George','Clooney');
-- mai multi cu acest nume
execute artstyle('%', '%');
    
    
-- 10. Defini?i un trigger de tip LMD la nivel de comand?. Declan?a?i trigger-ul.

-- Sa nu se permita ca numarul de comenzi sa-l depaseasca
-- pe cel al pieselor de arta

create or replace trigger com_arta
    before insert on Comanda
declare
    nr_comenzi INT;
    nr_piese INT;
begin
    select count(comanda_id) into nr_comenzi from Comanda;
    select count(art_id) into nr_piese from Arta;
    
    if nr_piese < nr_comenzi then
        raise_application_error(-20001, 'Ati depasit limita.');
    end if;
end;
/


-- Testam triggeru
begin
    for i in 11..17 loop
        insert into Comanda values(i, TO_DATE('2020-05-13', 'yyyy-mm-dd'), 6, 1);
    end loop;
    
end;

delete from Comanda where comanda_id > 10;
drop trigger com_arta;


-- 11. Defini?i un trigger de tip LMD la nivel de linie. Declan?a?i trigger-ul.

-- Sa nu se permita adaugarea unei comenzi daca data acesteia < data
-- de inceput a unei expozitii


create or replace trigger com_exp
    before update or insert on Comanda for each row
declare
    v_data date;
    v_start_data date;
begin
    if inserting then
        select data into v_data from Comanda
        where art_id = :new.art_id;
    
        select e.start_date into v_start_data from Expozitie e
        join Arta_Expusa ae on(e.expozitie_id = ae.expozitie_id)
        where ae.art_id = :new.art_id;
    
        if v_data < v_start_data then
            raise_application_error(-20001, 'Ati introdus o data incorecta');
        end if;
    end if;
end;
/

insert into Comanda values (11, TO_DATE('2021-06-21', 'yyyy-mm-dd'), 11, 2);


-- Sa nu se poata introduce/edita piese de arta cu pret sub 250

create or replace trigger trigg_price
    before update or insert on Arta for each row
declare
    v_pret Arta.pret%type;
begin
    
        if :new.pret < 250 then
            raise_application_error(-20001, 'Ati introdus o data incorecta');
        end if;
 
end;
/

INSERT INTO Arta VALUES (16, 2022, 'Test', 100, 'test', 1, 1);
update Arta
set pret = 100
where art_id = 3;



-- 12. Defini?i un trigger de tip LDD. Declan?a?i trigger-ul.

-- A permite alterare si "drop"-ul de tabele la dezactivarea triggerului

create table test (
    test1 int primary key
);

create trigger siguranta
    before create or alter or drop on schema
begin
    raise_application_error(-20001, 'Trebuie sa dezactivati intai triggerul.');
end;

alter table test add test2 varchar(23);

drop trigger siguranta;
drop table test;


