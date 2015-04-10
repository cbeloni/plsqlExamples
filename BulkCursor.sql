declare
cursor cApoio is
       select account,partition_key from bko_apoio_00002;
       
v_apoio cApoio%rowtype;
type cTipoTable is table of cApoio%rowtype index by pls_integer;
vTableCursor cTipoTable;

begin
   open cApoio;
   fetch cApoio bulk collect into vTableCursor limit 10;
   
   for i in 1..vTableCursor.count loop
      dbms_output.put_line (vTableCursor(i).account);             
   end loop;      
   close cApoio;
end;       

declare
cursor cApoio is
       select account,partition_key from bko_apoio_00002;

v_apoio cApoio%rowtype;
begin
        open cApoio;
        fetch cApoio into v_apoio;
        
end;     
