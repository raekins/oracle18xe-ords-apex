import cx_Oracle
con = cx_Oracle.connect('hr/hr@localhost/xepdb1')
cur = con.cursor()
cur.execute('select * from departments order by department_id')
               
res = cur.fetchmany(numRows=3)
print res

cur.close()
con.close()
