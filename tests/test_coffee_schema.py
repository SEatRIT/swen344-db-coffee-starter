import unittest
from src.coffee import *
from src.swen344_db_utils import connect
from .test_utils import *

class TestCoffee(unittest.TestCase):

    def test_rebuild_tables(self):
        """Rebuild the tables"""
        conn = connect()
        cur = conn.cursor()
        rebuildTables()
        cur.execute('SELECT * FROM roast_curve_points')
        self.assertEqual([], cur.fetchall(), "no rows in example_table")
        conn.close()

    def test_rebuild_tables_is_idempotent(self):
        """Drop and rebuild the tables twice"""
        rebuildTables()
        rebuildTables()
        sql = """
            SELECT * FROM reviewers WHERE username='pedant72'
        """
        assert_sql_count(self, sql, 0)

    def test_seed_data_works(self):
        rebuildTables()
        insertTestData()
        sql = """
            SELECT * FROM reviewers WHERE username='pedant72'
        """
        assert_sql_count(self, sql, 1)
