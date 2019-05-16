import cx_Oracle
con = cx_Oracle.connect('hr/hr@localhost/xepdb1')
cur = con.cursor()
cur.execute('select * from departments order by department_id')
for result in cur:
    print result
cur.close()
con.close() 
