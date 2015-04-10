--Função Java Oracle
select valueHash('helloa') from dual;   --1220935217
select valueHash('12345678') from dual; --1861353340

--Exemplo de hash em PLSQL
declare
v_palavra varchar2(10) := '12345678';
v_char varchar2(1);
i int;
elevado int;
resultado int := 0;
begin
   elevado := length(v_palavra) - 1;
   FOR i IN 1..length(v_palavra) LOOP       
      v_char := substr(v_palavra,i,1);
      --resultado := resultado + (ascii(v_char) * power(31,elevado));
      resultado := 31 * resultado + ascii(v_char); 
       
      /*if resultado > power(2,31) then
         resultado := resultado - power(2,32);
         dbms_output.put_line('subtrai');
      end if;*/
      
      dbms_output.put_line(resultado);
      elevado := elevado - 1;
      
   end loop;
   if resultado < 0 then
        resultado := resultado * -1;
   end if;  
   dbms_output.put_line(resultado);
end;

