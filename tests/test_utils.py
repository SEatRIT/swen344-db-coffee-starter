from src.swen344_db_utils import connect, exec_sql_file

def insertTestData():
    exec_sql_file('tests/test_data.sql')

def assert_sql_count(test, sql, n, msg = 'Expected row count did not match query'):
    conn = connect()
    cur = conn.cursor()
    cur.execute(sql)
    test.assertEqual(n, cur.rowcount, msg)
    conn.close()
