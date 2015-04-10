SET SERVEROUTPUT ON
declare
  v_count NUMber;
  V_START NUMBER;
begin
  V_START := DBMS_UTILITY.GET_TIME;
  for i in 1..100
  loop
    EXECUTE IMMEDIATE 'SELECT  COUNT(1) FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = ' || i INTO V_COUNT;
  end loop;
  
  DBMS_OUTPUT.PUT_LINE('Tempo de execucao sql dinamico: ' || (DBMS_UTILITY.GET_TIME - V_START) || 'cs');
  
  V_START := DBMS_UTILITY.GET_TIME;
  for i in 1..100
  loop
    SELECT  COUNT(1) INTO V_COUNT
    FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = i;
  end loop;
  
  DBMS_OUTPUT.PUT_LINE('Tempo de execucao sql estatico: ' || (DBMS_UTILITY.GET_TIME - V_START) || 'cs');
end;