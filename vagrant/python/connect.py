import cx_Oracle
con = cx_Oracle.connect('hr/hr@localhost/xepdb1')
print con.version
con.close()
