import cx_Oracle
con = cx_Oracle.connect('hr/hr@localhost/xepdb1')
cur = con.cursor()
cur.execute('select * from departments order by department_id')
               
res = cur.fetchall()
for r in res:
    print r               

cur.close()
con.close()
